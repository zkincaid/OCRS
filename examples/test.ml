open Type_def;;


(*
let test = Log( Mpq.init_set_si 2 1, Pow(Rational (Mpq.init_set_si 2 1), Sum[Times(Rational (Mpq.init_set_si 3 1), Input_variable "n"); Rational (Mpq.init_set_si 1 1)]));;

let pow_test = Pow(Rational (Mpq.init_set_si 2 1), Sum[Input_variable "n"; Rational (Mpq.init_set_si 3 1)]);;

let pow_test2 = Sum[Product[Rational (Mpq.init_set_si 4 1); Pow(Rational (Mpq.init_set_si 2 1), Sum[Log(Mpq.init_set_si 2 1, Sum[Input_variable "n"; Rational(Mpq.init_set_si 1 1)]); Rational (Mpq.init_set_si (-1) 1)])]; Rational (snd(Mpfr.init_set_si (-4) Mpfr.Near)); Product[Rational(Mpq.init_set_si (-1) 1); Sum[Log(Mpq.init_set_si 2 1, Sum[Input_variable "n"; Rational (Mpq.init_set_si 1 1)]); Rational (Mpq.init_set_si (-1) 1)]]];;

let log_test = Sum[Pow(Rational (Mpq.init_set_si 2 1), Log(Mpq.init_set_si 2 1, Input_variable "n")); Product[Rational (Mpq.init_set_si 2 1); Pow(Rational (Mpq.init_set_si 2 1), Product[Rational(Mpq.init_set_si 2 1); Log(Mpq.init_set_si 2 1, Input_variable "n")])]];;

print_endline (expr_to_string test);;
print_endline (expr_to_string (Expr_simplifications.automatic_simplify test));;

print_endline (expr_to_string pow_test);;
print_endline (expr_to_string (Expr_simplifications.automatic_simplify pow_test));;

print_endline (expr_to_string pow_test2);;
print_endline (expr_to_string (Expr_simplifications.automatic_simplify pow_test2));;

print_endline (expr_to_string log_test);;
print_endline (expr_to_string (Expr_simplifications.automatic_simplify log_test));;

*)













let x1 = Equals(Output_variable("y", SAdd("n", 1)), Plus(Output_variable("y", SSVar "n"), Rational (Mpq.init_set_si 1 1)));;

let y1 = Equals(Output_variable("y", SAdd("n", 1)), Times (Output_variable("y", SSVar "n"), Rational (Mpq.init_set_si 2 1)));;

let x8 = Equals(Output_variable("y", SAdd("n", 1)), Plus (Output_variable("y", SSVar "n"), Plus(Pow (Input_variable "n", Rational (Mpq.init_set_si 4 1)), Pow (Input_variable "n", Rational (Mpq.init_set_si 3 1)))));;

let x9 = Equals(Output_variable("y", SAdd("n", 1)), Plus (Output_variable("y", SSVar "n"), Pow (Plus(Input_variable "n", Rational (Mpq.init_set_si 1 1)), Rational (Mpq.init_set_si 4 1))));;

let big_test = Equals(Output_variable("y", SAdd("n", 1)), Sum [Times(Rational (Mpq.init_set_si 2 1), Output_variable("y", SSVar "n")); Pow(Input_variable "n", Rational (Mpq.init_set_si 2 1)); Pow(Rational (Mpq.init_set_si 3 1), Input_variable "n")]);;

let x2 = Equals(Output_variable("y", SAdd("n", 1)), Times(Rational (Mpq.init_set_si 1 2), Output_variable("y", SSVar "n")));;

let will_it_work = Equals(Output_variable("y", SAdd("n", 1)), Plus(Times (Rational (Mpq.init_set_si 2 1), Output_variable("y", SSVar "n")), Pow(Rational (Mpq.init_set_si 2 1), Input_variable "n")));;

let x3 = Equals(Output_variable("y", SAdd("n", 1)), Plus(Output_variable("y", SSVar "n"), Pow(Rational (Mpq.init_set_si 2 1), Sum[Input_variable "n"; Rational (Mpq.init_set_si 1 1)])));;

let x4 = Equals(Output_variable("y", SAdd("n", 1)), Plus(Times(Rational (Mpq.init_set_si 2 1), Output_variable("y", SSVar "n")), Pow(Pow(Rational (Mpq.init_set_si 2 1), Plus(Input_variable "n", Rational (Mpq.init_set_si 1 1))), Rational (Mpq.init_set_si 2 1))));;


let x5 = Equals(Output_variable("y", SAdd("n", 2)), Plus(Output_variable("y", SAdd("n", (1))), Input_variable "n"));;

let x6 = Equals(Output_variable("y", SSVar "n"), Plus(Output_variable("y", SSDiv("n", 2)), Rational (Mpq.init_set_si 1 1)));;

let x7 = Equals(Output_variable("y", SSVar "n"), Plus(Times(Rational (Mpq.init_set_si 2 1), Output_variable("y", SSDiv("n", 2))), Input_variable "n"));;

let x11 = Equals(Output_variable("y", SSVar "n"), Plus(Times(Rational (Mpq.init_set_si 2 1), Output_variable("y", SSDiv("n", 2))), Pow(Input_variable "n", Rational (Mpq.init_set_si 2 1))));;


let x12 = Equals(Output_variable("y", SSVar "n"), Plus(Times(Rational (Mpq.init_set_si 3 1), Output_variable("y", SSDiv("n", 2))), Input_variable "n"));;

let x13 = "y_{n+1} = 3 * y_n + n^2 * 2^n, n";;

let x14 = "y_{n+1} = 2 * y_n + n^2 * 2^n, n";;

let parse str = 
  let lexbuf = Lexing.from_string str in
  Parser.main Lexer.token lexbuf;;

let z1 = "x_{n+1} = x_n + 1, n";;
let z2 = "y_{n+1} = y_n + x_n + 1, n";;
let z3 = "z_{n+1} = z_n + x_n + y_n +1, n";;

let new_test_list = [parse z1; parse z2; parse z3];;

let test_list = [x1; x8; x9; y1; x2; big_test; will_it_work; x3; x4; x5; x6; x7; x11; x12];;

List.iter (fun x -> let _ = Ocrs.solve_rec x true in print_endline "") test_list;;

Ocrs.solve_rec_str x13;;
print_endline "";;

Ocrs.solve_rec_str x14;;
print_endline "";;

Ocrs.solve_rec_str "z_{n+1} = z_n + y_0 + x_0, n";;
print_endline "";;

let res_list = Ocrs.solve_rec_list new_test_list;;
let print_list lis = List.iter (fun x -> print_endline (Expr_helpers.inequation_to_string x)) lis;;
let _ = print_list new_test_list;;
let _ = print_list res_list;;
print_endline "";;
print_endline "";;

print_endline "";;
Ocrs.solve_rec_str "y_{k+1} >= y_k + a, k";;

print_endline "";;
Ocrs.solve_rec_str "y_{n+1}-a*y_n = n, n";;


print_endline "";;
let binary_search_term = Sum[Output_variable ("hi", SSVar "n"); Product[Rational (Mpq.init_set_si (-1) 1); Output_variable ("lo", SSVar "n")]];;
let second_test_list = [(binary_search_term, parse "r_{n+1} = (1/2)*r_n, n"); (Output_variable("x", SSVar "n"), parse z1); (Output_variable("y", SSVar "n"), parse z2); (Output_variable("z", SSVar "n"), parse z3)];;
let res_second_test_list = Ocrs.solve_rec_list_pair second_test_list;;
print_list res_second_test_list;;
print_endline "";;


let test_list = [(Output_variable("x", SSVar "n"), Equals(Output_variable("x", SAdd ("n", 1)), Plus(Output_variable("x", SSVar "n"), Rational (Mpq.init_set_si 1 1)))); (Output_variable("y", SSVar "n"),  Equals(Output_variable("y", SAdd ("n", 1)), Plus(Output_variable("x", SSVar "n"), Output_variable("y", SSVar "n"))))];;

let res = Ocrs.solve_rec_list_pair test_list;;
print_list res;;
print_endline "";;


Ocrs.solve_rec_str "y_{n+1} = a*y_n + (b*n^2 + c*n + d)*e^n, n";;
print_endline "";;

Ocrs.solve_rec_str "y_{n+1} = a*y_n + (b*n^2 + c*n + d)*e^2, n";;
print_endline "";;



let symbolic_log = Equals(Output_variable("x", SAdd ("n", 1)), Sum[Output_variable("x", SSVar "n"); Log(Mpq.init_set_si 2 1, Symbolic_Constant "y")]);;
Ocrs.solve_rec symbolic_log true;;
print_endline "";; 



let one = Mpq.init_set_si 1 1;;
let one_copy = Mpq.init_set_si 1 1;;
let minus_2 = Mpq.init_set_si (-2) 1;;
let four = Mpq.init_set_si 4 1;;

let matrix_test_1 = VEquals (Ovec ([|"x"; "y"|], SAdd("n", 1)), [|[|one; one_copy|];[|minus_2; four|]|], Ovec ([|"x"; "y"|], SSVar "n"), [|Input_variable "n"; Rational (Mpq.init_set_si 1 1)|]);;


print_endline "";;
print_endline (Mat_helpers.matrix_rec_to_string matrix_test_1);;
let result = Ocrs.solve_mat_recurrence matrix_test_1 false;;
print_endline "";;



List.iter (fun x -> print_endline (Expr_helpers.inequation_to_string x)) result;;

let matrix_test = VEquals (Ovec ([|"x"|], SAdd("n", 1)), [|[|four|]|], Ovec ([|"x"|], SSVar "n"), [|Input_variable "n"|]);;

print_endline "";;
print_endline (Mat_helpers.matrix_rec_to_string matrix_test);;
let result = Ocrs.solve_mat_recurrence matrix_test false;;
print_endline "";;
List.iter (fun x -> print_endline (Expr_helpers.inequation_to_string x)) result;;


let matrix_test_2 = VEquals (Ovec ([|"x"; "y"; "z"|], SAdd("n", 1)), [|[|(Mpq.init_set_si 5 1); Mpq.init_set_si 2 1; Mpq.init_set_si (-2) 1;|];[|Mpq.init_set_si 2 1; Mpq.init_set_si 5 1;Mpq.init_set_si (-2) 1|];[|Mpq.init_set_si (-2) 1; Mpq.init_set_si (-2) 1; Mpq.init_set_si 5 1|]|], Ovec ([|"x"; "y"; "z"|], SSVar "n"), [|Rational (Mpq.init_set_si 1 1); Times((Pow(Rational (Mpq.init_set_si 3 1), Input_variable "n")),Pow(Input_variable "n", Rational (Mpq.init_set_si 2 1))); Pow(Rational (Mpq.init_set_si 2 1), Input_variable "n")|]);;

print_endline "";;
print_endline (Mat_helpers.matrix_rec_to_string matrix_test_2);;
let result = Ocrs.solve_mat_recurrence matrix_test_2 true;;
print_endline "";;
List.iter (fun x -> print_endline (Expr_helpers.inequation_to_string x)) result;;

let one = Mpq.init_set_si 1 1;;
let one_copy = Mpq.init_set_si 1 1;;
let minus_2 = Mpq.init_set_si (-2) 1;;
let four = Mpq.init_set_si 4 1;;

let matrix_test_1 = VEquals (Ovec ([|"x"; "y"|], SAdd("n", 1)), [|[|one; one_copy|];[|minus_2; four|]|], Ovec ([|"x"; "y"|], SSVar "n"), [|Rational (Mpq.init_set_si 0 1); Rational (Mpq.init_set_si 1 1)|]);;


print_endline "";;
print_endline (Mat_helpers.matrix_rec_to_string matrix_test_1);;
let result = Ocrs.solve_mat_recurrence matrix_test_1 true;;
print_endline "";;



List.iter (fun x -> print_endline (Expr_helpers.inequation_to_string x)) result;;



let matrix_test_1 = VEquals (Ovec ([|"x"; "y"|], SAdd("n", 1)), [|[|one; one_copy|];[|Mpq.init_set_si (-9) 1; Mpq.init_set_si 1 1|]|], Ovec ([|"x"; "y"|], SSVar "n"), [|Rational (Mpq.init_set_si 0 1); Rational (Mpq.init_set_si 0 1)|]);;


print_endline "";;
print_endline (Mat_helpers.matrix_rec_to_string matrix_test_1);;
let result = Ocrs.solve_mat_recurrence matrix_test_1 false;;
print_endline "";;



List.iter (fun x -> print_endline (Expr_helpers.inequation_to_string x)) result;;





let qqify = Array.map (Array.map (fun x -> Mpq.init_set_si x 1))
let matrix_test_fib =
  VEquals (Ovec ([|"a"; "b"; "c"; "d"; "e"; "f"; "g"|], SAdd("n", 1)),
           qqify [|
             [| 1; 0; 1; 0; 0; 0; 0 |];
             [| 0; 1; 0; 1; 0; 0; 0 |];
             [| 1; 0; 0; 0; 0; 0; 0 |];
             [| 0; 1; 0; 0; 0; 0; 0 |];
             [| 0; 0; 0; 0; 1; 0; 0 |];
             [| 0; 0; 0; 0; 0; 1; 0 |];
             [| 0; 0; 0; 0; 0; 1; 0 |];
           |],
           Ovec ([|"a"; "b"; "c"; "d"; "e"; "f"; "g"|], SSVar "n"),
           (Array.map (fun x -> Rational (Mpq.init_set_si x 1))
              [| 0; 0; 0; 0; 1; -1; -1 |]));;
 
print_endline "\nFIB";;
print_endline (Mat_helpers.matrix_rec_to_string matrix_test_fib);;
let result = Ocrs.solve_mat_recurrence matrix_test_fib true;;
print_endline "";;






(*

let ior integ = OpRational (Mpq.init_set_si integ 1);;



(*6 + (-5 * q) + q ^ 2 + (24 * x_0) + (-50 * q * x_0) + (35 * q ^ 2 * x_0) + (-10 * q ^ 3 * x_0) + (q ^ 4 * x_0) + (-6 * y_0) + (11 * q * y_0) + (-6 * q ^ 2 * y_0) + (q ^ 3 * y_0))*)
let dividend = Op_simplifications.op_automatic_simplify (OpSum[ior 6; OpProduct[ior (-5); Q]; OpPow(Q, ior 2); OpProduct[ior 24; OpBase_case ("x", 0)];OpProduct[ior (-50); Q; OpBase_case ("x", 0)] ;OpProduct[ior 35; OpPow(Q, ior 2); OpBase_case ("x", 0)]; OpProduct[ior (-10);OpPow(Q, ior 3); OpBase_case ("x", 0)]; OpProduct[OpPow(Q, ior 4); OpBase_case ("x", 0)]; OpProduct[ior (-6); OpBase_case ("y", 0)]; OpProduct[ior 11; Q; OpBase_case ("y", 0)]; OpProduct[ior (-6); OpPow(Q, ior 2); OpBase_case ("y", 0)]; OpProduct[OpPow(Q, ior 3); OpBase_case ("y", 0)]]);;

let divisor = Op_simplifications.op_automatic_simplify (OpPow(OpSum[ior 6; OpProduct [ior (-5); Q]; OpPow(Q, ior 2)], ior 2));;

let expand_divisor = Op_transforms.algebraic_expand divisor;;


let ext_res = Op_transforms.extended_euclidean dividend divisor;;





print_endline ("dividend: " ^ (Expr_helpers.op_expr_to_string dividend));;
print_endline ("divisor: " ^ (Expr_helpers.op_expr_to_string divisor));;


print_endline ("gcd: " ^ (Expr_helpers.op_expr_to_string (List.nth ext_res 0)));;
print_endline ("app: " ^ (Expr_helpers.op_expr_to_string (List.nth ext_res 1)));;
print_endline ("bpp: " ^ (Expr_helpers.op_expr_to_string (List.nth ext_res 2)));;
*)






(*

let stratified_test_lower = VEquals (Ovec ([|"x"; "y"|], SAdd("n", 1)), [|[|one; one_copy|];[|minus_2; four|]|], Ovec ([|"x"; "y"|], SSVar "n"), [|Input_variable "n"; Rational (Mpq.init_set_si 1 1)|]);;

let stratified_test_higher = VEquals (Ovec ([|"u"; "v"; "z"|], SAdd("n", 1)), [|[|(Mpq.init_set_si 5 1); Mpq.init_set_si 2 1; Mpq.init_set_si (-2) 1;|];[|Mpq.init_set_si 2 1; Mpq.init_set_si 5 1;Mpq.init_set_si (-2) 1|];[|Mpq.init_set_si (-2) 1; Mpq.init_set_si (-2) 1; Mpq.init_set_si 5 1|]|], Ovec ([|"u"; "v"; "z"|], SSVar "n"), [|Rational (Mpq.init_set_si 1 1); Output_variable ("x", SSVar "n"); Rational (Mpq.init_set_si 0 1)|]);;

let stratified_test = [stratified_test_lower;stratified_test_higher];;


print_endline "";;
List.iter (fun x -> print_endline (Mat_helpers.matrix_rec_to_string x)) stratified_test;;
let results = Ocrs.solve_mat_recurrence_list stratified_test;;
print_endline "";;
List.iter (fun x -> print_endline (Expr_helpers.inequation_to_string x)) results;;
*)

(*let lexbuf = Lexing.from_string "y_n = (n ^ 2) * 2^n, n" in
let result = Parser.main Lexer.token lexbuf in

let _ = print_endline (Expr_helpers.inequation_to_string_IR result) in

let result  = Expr_simplifications.automatic_simplify_inequation result in

print_endline (Expr_helpers.inequation_to_string_IR result);;
*)
(*let x10 = Equals(Output_variable("y", SAdd("n", 4)), Sum[Times (Output_variable("y", SAdd ("n", 3)), Rational (Mpq.init_set_si 2 1));Times (Output_variable("y", SAdd ("n", 2)), Rational (Mpq.init_set_si 1 1)); Times (Output_variable("y", SAdd ("n", 1)), Rational (snd(Mpfr.init_set_si (-5) Mpfr.Near))); Times (Output_variable("y", SSVar "n"), Rational (Mpq.init_set_si 3 1))]);;

let simplify_x10 = Expr_simplifications.automatic_simplify_inequation x10;;

print_endline (inequation_to_string simplify_x10);;

let op_x10 = Op_simplifications.op_automatic_simplify_inequation (inequation_to_opCalc simplify_x10);;
print_endline (op_inequation_to_string op_x10);;

let isolated_op_x10 = Isolate_Ovar.solve_for_Ovar op_x10 "y" "n";;
print_endline (op_inequation_to_string isolated_op_x10);;*)
