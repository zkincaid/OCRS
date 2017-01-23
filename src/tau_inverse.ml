open Type_def

let is_const op_expr = 
  match op_expr with
  | OpRational _ | OpBase_case _ | OpSymbolic_Constant _ ->
      true
  | _ -> false
  ;;


let rec complete_tiling op_expr = 
  match op_expr with
  | OpPow (OpSum [OpRational rat; Q], OpRational neg_k) when (Mpfr.cmp_si rat (-1))=0 && (Mpfr.cmp_si neg_k 0)<0 && (Mpfr.integer_p neg_k) ->
      true
  | OpProduct [OpPow (OpSum [OpRational neg_k; Q], OpRational rat2); OpSum [OpRational rat1; Q]] when (Mpfr.cmp_si rat1 (-1))=0 && (Mpfr.cmp_si rat2 (-1))=0 ->
      true
  | OpProduct [OpPow (OpSum [OpRational neg_k; Q], OpRational rat2); OpSum [OpRational rat1; Q]] when (Mpfr.cmp_si rat1 (-1))=0 && (Mpfr.cmp_si rat2 0)<0 && (Mpfr.integer_p rat2) ->
      true
  | OpProduct [OpSum [OpRational rat1; Q]; OpPow (OpSum [OpRational neg_k; Q], OpRational rat2)] when (Mpfr.cmp_si rat1 (-1))=0 && (Mpfr.cmp_si rat2 (-1))=0 ->
      true
  | OpProduct [OpSum [OpRational rat1; Q]; OpPow (OpSum [OpRational neg_k; Q], OpRational rat2)] when (Mpfr.cmp_si rat1 (-1))=0 && (Mpfr.cmp_si rat2 0)<0 && (Mpfr.integer_p rat2) ->
      true
  | OpPow (OpSum [OpRational neg_k; Q], OpRational rat1) when (Mpfr.cmp_si rat1 (-1))=0 ->
      true
  | OpSum expr_list ->
      List.for_all complete_tiling expr_list
  | OpRational rat -> true
  | OpSymbolic_Constant str (* probably some other things *) -> true
  | OpBase_case (str, integer) -> true
  | OpProduct expr_list ->
      let (const_list, term) = List.partition is_const expr_list in
      if (List.length const_list) <> 0 then complete_tiling (Op_simplifications.op_automatic_simplify (OpProduct term))
      else false
  | _ -> false (* might be too strong *)



let rec tau_inverse op_expr input_ident = 
  match op_expr with
  | OpPow (OpSum [OpRational rat; Q], OpRational neg_k) when (Mpfr.cmp_si rat (-1))=0 && (Mpfr.cmp_si neg_k 0)<0 && (Mpfr.integer_p neg_k) ->
      let k = Mpfr.init () in
      let _ = Mpfr.neg k neg_k Mpfr.Near in
      Binomial (Input_variable input_ident, Rational k)
  | OpProduct [OpPow (OpSum [OpRational neg_k; Q], OpRational rat2); OpSum [OpRational rat1; Q]] when (Mpfr.cmp_si rat1 (-1))=0 && (Mpfr.cmp_si rat2 (-1))=0 ->
      let k = Mpfr.init () in
      let _ = Mpfr.neg k neg_k Mpfr.Near in
      Pow (Rational k, Input_variable input_ident)
  | OpProduct [OpPow (OpSum [OpRational neg_k; Q], OpRational rat2); OpSum [OpRational rat1; Q]] when (Mpfr.cmp_si rat1 (-1))=0 && (Mpfr.cmp_si rat2 0)<0 && (Mpfr.integer_p rat2) ->
      let k = Mpfr.init () in
      let _ = Mpfr.neg k neg_k Mpfr.Near in
      let neg_c = Mpfr.init () in
      let c = Mpfr.init () in
      let _ = Mpfr.add_ui neg_c rat2 1 Mpfr.Near in
      let _ = Mpfr.neg c neg_c Mpfr.Near in
      Product [Binomial (Input_variable input_ident, Rational c); Pow(Rational k, Sum[Rational neg_c; Input_variable input_ident])]
  
  | OpProduct [OpSum [OpRational rat1; Q]; OpPow (OpSum [OpRational neg_k; Q], OpRational rat2)] when (Mpfr.cmp_si rat1 (-1))=0 && (Mpfr.cmp_si rat2 (-1))=0 ->
      let k = Mpfr.init () in
      let _ = Mpfr.neg k neg_k Mpfr.Near in
      Pow (Rational k, Input_variable input_ident)
  
  | OpProduct [OpSum [OpRational rat1; Q]; OpPow (OpSum [OpRational neg_k; Q], OpRational rat2)] when (Mpfr.cmp_si rat1 (-1))=0 && (Mpfr.cmp_si rat2 0)<0 && (Mpfr.integer_p rat2) ->
      let k = Mpfr.init () in
      let _ = Mpfr.neg k neg_k Mpfr.Near in
      let neg_c = Mpfr.init () in
      let c = Mpfr.init () in
      let _ = Mpfr.add_ui neg_c rat2 1 Mpfr.Near in
      let _ = Mpfr.neg c neg_c Mpfr.Near in
      Product [Binomial (Input_variable input_ident, Rational c); Pow(Rational k, Sum[Rational neg_c; Input_variable input_ident])]

  | OpPow (OpSum [OpRational neg_k; Q], OpRational rat1) when (Mpfr.cmp_si rat1 (-1))=0 ->
      let k = Mpfr.init () in
      let _ = Mpfr.neg k neg_k Mpfr.Near in	(* should automatically simplify these expressions before sending out *)
      Product [Sum [Rational (snd(Mpfr.init_set_si (-1) Mpfr.Near)); Pow(Rational k , Input_variable input_ident)]; Pow(Sum [Rational (snd(Mpfr.init_set_si (-1) Mpfr.Near)); Rational k], Rational (snd(Mpfr.init_set_si (-1) Mpfr.Near)))]
  | OpSum expr_list ->
      if complete_tiling op_expr then Sum (List.map (fun x -> tau_inverse x input_ident) expr_list)
      else failwith "need to do some transforms"
  | OpRational rat -> Rational rat
  | OpSymbolic_Constant str (* probably some other things *) -> Symbolic_Constant str
  | OpBase_case (str, integer) -> Base_case (str, integer)
  | OpProduct expr_list ->
      let (const_list, term) = List.partition is_const expr_list in
      if (List.length const_list) <> 0 then Product (List.append (List.map (fun x -> tau_inverse x input_ident) const_list) ((tau_inverse (Op_simplifications.op_automatic_simplify (OpProduct term)) input_ident) :: []))
      else (failwith "This shouldn't happen eventually because we check we don't get here") (* need to do some transformations *)
  | _ -> failwith "Haven't implemented any other transforms yet"


let tau_inverse_inequation expr input_ident =
    match expr with
    | OpEquals (OpOutput_variable(ident, subscript), right) ->
        Equals (Output_variable(ident, subscript), (tau_inverse right input_ident))
    | OpGreaterEq (OpOutput_variable(ident, subscript), right) ->
        GreaterEq (Output_variable(ident, subscript), (tau_inverse right input_ident))
    | OpGreater (OpOutput_variable(ident, subscript), right) ->
        Greater (Output_variable(ident, subscript), (tau_inverse right input_ident))
    | OpLessEq (OpOutput_variable(ident, subscript), right) ->
        LessEq (Output_variable(ident, subscript), (tau_inverse right input_ident))
    | OpLess (OpOutput_variable(ident, subscript), right) ->
        Less (Output_variable(ident, subscript), (tau_inverse right input_ident))
    | _ -> failwith "The inequation should be solved before we get here"
    ;;
