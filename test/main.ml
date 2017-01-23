open Type_def
open Expr_helpers
(*open Expr_simplifications*)
open Expr_to_opcalc
(*open Expr_opCalc_simp*)

(*
let x = Sum [Product [Rational (snd (Mpfr.init_set_si 2 Mpfr.Near)); Pow(Symbolic_Constant "x", Rational (snd (Mpfr.init_set_si 3 Mpfr.Near)))]; Product [Pow(Symbolic_Constant "x", Rational (snd (Mpfr.init_set_si 2 Mpfr.Near))) ; Symbolic_Constant "x"]];;

let y = Product [Divide (Rational (snd(Mpfr.init_set_si 1 Mpfr.Near)), Symbolic_Constant "a"); Symbolic_Constant "b"; Symbolic_Constant "a"];;

let z = Minus (Symbolic_Constant "x", Symbolic_Constant "x");;

let x1 = Times (Divide (Symbolic_Constant "x", Symbolic_Constant "y"), Divide (Symbolic_Constant "y", Symbolic_Constant "x"));;

let x2 = Times (Rational (snd (Mpfr.init_set_si 2 Mpfr.Near)), Plus(Symbolic_Constant "x", Symbolic_Constant "y"));;

let x3 = Plus(Plus(Symbolic_Constant "a", Symbolic_Constant "b"), Times (Rational (snd(Mpfr.init_set_si (-1) Mpfr.Near)), Plus(Symbolic_Constant "a", Symbolic_Constant "b")));;

let x4 = Times( Rational (snd(Mpfr.init_set_si 3 Mpfr.Near)), Sum [Times (Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Symbolic_Constant "x") ; Symbolic_Constant "y"]);;

let x5 = Times(Rational (snd(Mpfr.init_set_si 3 Mpfr.Near)), Times (Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Sum [Symbolic_Constant "x" ; Symbolic_Constant "y"]));;

let x6 = Divide(Minus(Symbolic_Constant "y", Symbolic_Constant "y"), Sum [Pow (Symbolic_Constant "x", Rational (snd(Mpfr.init_set_si 2 Mpfr.Near))); Symbolic_Constant "x"; Product [Rational (snd(Mpfr.init_set_si (-1) Mpfr.Near)); Symbolic_Constant "x"; Sum [Symbolic_Constant "x"; Rational (snd(Mpfr.init_set_si 1 Mpfr.Near))]]]);;

let x7 = Divide(Minus(Symbolic_Constant "y", Symbolic_Constant "y"), Minus (Symbolic_Constant "y", Symbolic_Constant "y"));;

let x9 = Sum [Symbolic_Constant "x"; Product [Rational (snd(Mpfr.init_set_si (-2) Mpfr.Near)); Symbolic_Constant "x"]];;

let lis = [x;y;z;x1; x2; x3; x4; x5; x6; x7; x9];;

List.iter (fun x -> begin print_endline (expr_to_string x); print_endline (expr_to_string (Expr_simplifications.automatic_simplify x)); print_endline "" end) lis;;


let testing = OpProduct [OpSum [OpSymbolic_Constant "x"; OpRational (snd(Mpfr.init_set_si (2) Mpfr.Near))]; OpSum [OpSymbolic_Constant "x"; OpRational (snd(Mpfr.init_set_si (1) Mpfr.Near))]];;


print_endline (op_expr_to_string (Op_simplifications.op_automatic_simplify testing));;
print_endline (op_expr_to_string (Op_transforms.algebraic_expand testing));;
print_endline ("");;
*)
(*
let test = Log( snd(Mpfr.init_set_si 2 Mpfr.Near), Pow(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Sum[Times(Rational (snd(Mpfr.init_set_si 3 Mpfr.Near)), Input_variable "n"); Rational (snd(Mpfr.init_set_si 1 Mpfr.Near))]));;

let pow_test = Pow(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Sum[Input_variable "n"; Rational (snd(Mpfr.init_set_si 3 Mpfr.Near))]);;

let pow_test2 = Sum[Product[Rational (snd(Mpfr.init_set_si 4 Mpfr.Near)); Pow(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Sum[Log(snd(Mpfr.init_set_si 2 Mpfr.Near), Sum[Input_variable "n"; Rational(snd(Mpfr.init_set_si 1 Mpfr.Near))]); Rational (snd(Mpfr.init_set_si (-1) Mpfr.Near))])]; Rational (snd(Mpfr.init_set_si (-4) Mpfr.Near)); Product[Rational(snd(Mpfr.init_set_si (-1) Mpfr.Near)); Sum[Log(snd(Mpfr.init_set_si 2 Mpfr.Near), Sum[Input_variable "n"; Rational (snd(Mpfr.init_set_si 1 Mpfr.Near))]); Rational (snd(Mpfr.init_set_si (-1) Mpfr.Near))]]];;

let log_test = Sum[Pow(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Log(snd(Mpfr.init_set_si 2 Mpfr.Near), Input_variable "n")); Product[Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)); Pow(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Product[Rational(snd(Mpfr.init_set_si 2 Mpfr.Near)); Log(snd(Mpfr.init_set_si 2 Mpfr.Near), Input_variable "n")])]];;

print_endline (expr_to_string test);;
print_endline (expr_to_string (Expr_simplifications.automatic_simplify test));;

print_endline (expr_to_string pow_test);;
print_endline (expr_to_string (Expr_simplifications.automatic_simplify pow_test));;

print_endline (expr_to_string pow_test2);;
print_endline (expr_to_string (Expr_simplifications.automatic_simplify pow_test2));;

print_endline (expr_to_string log_test);;
print_endline (expr_to_string (Expr_simplifications.automatic_simplify log_test));;
*)


let x1 = Equals(Output_variable("y", SAdd("n", 1)), Plus(Output_variable("y", SSVar "n"), Rational (snd(Mpfr.init_set_si 1 Mpfr.Near))));;

let y1 = Equals(Output_variable("y", SAdd("n", 1)), Times (Output_variable("y", SSVar "n"), Rational (snd(Mpfr.init_set_si (2) Mpfr.Near))));;

let x8 = Equals(Output_variable("y", SAdd("n", 1)), Plus (Output_variable("y", SSVar "n"), Plus(Pow (Input_variable "n", Rational (snd (Mpfr.init_set_si 4 Mpfr.Near))), Pow (Input_variable "n", Rational (snd (Mpfr.init_set_si 3 Mpfr.Near))))));;

let x9 = Equals(Output_variable("y", SAdd("n", 1)), Plus (Output_variable("y", SSVar "n"), Pow (Plus(Input_variable "n", Rational (snd(Mpfr.init_set_si 1 Mpfr.Near))), Rational (snd (Mpfr.init_set_si 4 Mpfr.Near)))));;

let big_test = Equals(Output_variable("y", SAdd("n", 1)), Sum [Times(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Output_variable("y", SSVar "n")); Pow(Input_variable "n", Rational (snd(Mpfr.init_set_si 2 Mpfr.Near))); Pow(Rational (snd(Mpfr.init_set_si 3 Mpfr.Near)), Input_variable "n")]);;

let x2 = Equals(Output_variable("y", SAdd("n", 1)), Times(Rational (snd(Mpfr.init_set_d 0.5 Mpfr.Near)), Output_variable("y", SSVar "n")));;

let will_it_work = Equals(Output_variable("y", SAdd("n", 1)), Plus(Times (Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Output_variable("y", SSVar "n")), Pow(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Input_variable "n")));;

let x3 = Equals(Output_variable("y", SAdd("n", 1)), Plus(Output_variable("y", SSVar "n"), Pow(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Sum[Input_variable "n"; Rational (snd(Mpfr.init_set_si 1 Mpfr.Near))])));;

let x4 = Equals(Output_variable("y", SAdd("n", 1)), Plus(Times(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Output_variable("y", SSVar "n")), Pow(Pow(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Plus(Input_variable "n", Rational (snd(Mpfr.init_set_si 1 Mpfr.Near)))), Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)))));;


let x5 = Equals(Output_variable("y", SAdd("n", 2)), Plus(Output_variable("y", SAdd("n", (1))), Input_variable "n"));;

let x6 = Equals(Output_variable("y", SSVar "n"), Plus(Output_variable("y", SSDiv("n", 2)), Rational (snd(Mpfr.init_set_si 1 Mpfr.Near))));;

let x7 = Equals(Output_variable("y", SSVar "n"), Plus(Times(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Output_variable("y", SSDiv("n", 2))), Input_variable "n"));;

let x11 = Equals(Output_variable("y", SSVar "n"), Plus(Times(Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)), Output_variable("y", SSDiv("n", 2))), Pow(Input_variable "n", Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)))));;


let x12 = Equals(Output_variable("y", SSVar "n"), Plus(Times(Rational (snd(Mpfr.init_set_si 3 Mpfr.Near)), Output_variable("y", SSDiv("n", 2))), Input_variable "n"));;

let test_list = [x1; x8; x9; y1; x2; big_test; will_it_work; x3; x4; x5; x6; x7; x11; x12];;

List.iter (fun x -> let _ = Solve_rec.solve_rec x in print_endline "") test_list;;

(*let x10 = Equals(Output_variable("y", SAdd("n", 4)), Sum[Times (Output_variable("y", SAdd ("n", 3)), Rational (snd(Mpfr.init_set_si 2 Mpfr.Near)));Times (Output_variable("y", SAdd ("n", 2)), Rational (snd(Mpfr.init_set_si 1 Mpfr.Near))); Times (Output_variable("y", SAdd ("n", 1)), Rational (snd(Mpfr.init_set_si (-5) Mpfr.Near))); Times (Output_variable("y", SSVar "n"), Rational (snd(Mpfr.init_set_si 3 Mpfr.Near)))]);;

let simplify_x10 = Expr_simplifications.automatic_simplify_inequation x10;;

print_endline (inequation_to_string simplify_x10);;

let op_x10 = Op_simplifications.op_automatic_simplify_inequation (inequation_to_opCalc simplify_x10);;
print_endline (op_inequation_to_string op_x10);;

let isolated_op_x10 = Isolate_Ovar.solve_for_Ovar op_x10 "y" "n";;
print_endline (op_inequation_to_string isolated_op_x10);;*)