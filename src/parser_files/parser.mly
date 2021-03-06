%{
(** The parser for expressions (generated by ocamlyacc) *)
open Type_def

let rec substitute_expr expr old_term new_term =
  if expr = old_term then new_term
  else
    (match expr with
    | Rational _ | Symbolic_Constant _ | Base_case _ | Undefined | Input_variable _ | Output_variable _ | Arctan _ | Pi | Iif _ ->
      expr
    | Pow (base, exp) ->
      Pow (substitute_expr base old_term new_term, substitute_expr exp old_term new_term)
    | Times (left, right) ->
      Times (substitute_expr left old_term new_term, substitute_expr right old_term new_term)
    | Plus (left, right) ->
      Plus (substitute_expr left old_term new_term, substitute_expr right old_term new_term)
    | Minus (left, right) ->
      Minus (substitute_expr left old_term new_term, substitute_expr right old_term new_term)
    | Divide (left, right) ->
      Divide (substitute_expr left old_term new_term, substitute_expr right old_term new_term)
    | Binomial (left, right) ->
      Binomial (substitute_expr left old_term new_term, substitute_expr right old_term new_term)
    | Log (base, expression) ->
      Log (base, substitute_expr expression old_term new_term)
    | Factorial expression ->
      Factorial (substitute_expr expression old_term new_term)
    | Product prodList ->
      Product (List.map (fun x -> substitute_expr x old_term new_term) prodList)
    | Sum sumList ->
      Sum (List.map (fun x -> substitute_expr x old_term new_term) sumList)
    | IDivide (num, denom) ->
      IDivide (substitute_expr num old_term new_term, denom)
    | Sin expression ->
      Sin (substitute_expr expression old_term new_term)
    | Cos expression ->
      Cos (substitute_expr expression old_term new_term)
    | Mod (left, right) ->
      Mod (substitute_expr left old_term new_term, substitute_expr right old_term new_term)
    | Shift (shift_v, expression) ->
      Shift (shift_v, substitute_expr expression old_term new_term))
  ;;

let substitute ineq old_term new_term =
  match ineq with
  | Equals (left, right) ->
    Equals(substitute_expr left old_term new_term, substitute_expr right old_term new_term)
  | Less (left, right) ->
    Less(substitute_expr left old_term new_term, substitute_expr right old_term new_term)
  | LessEq (left, right) ->
    LessEq(substitute_expr left old_term new_term, substitute_expr right old_term new_term)
  | Greater (left, right) ->
    Greater(substitute_expr left old_term new_term, substitute_expr right old_term new_term)
  | GreaterEq (left, right) ->
    GreaterEq(substitute_expr left old_term new_term, substitute_expr right old_term new_term)
  ;;  
%}
%token <int> INT
%token <float> FLOAT
%token <string> VAR
%token COMMA UNDERSCORE
%token PI
%token BINOMIAL MOD
%token FLOOR
%token SIN COS ARCTAN
%token EQUALS LESS LESSEQ GREATER GREATEREQ
%token PLUS MINUS TIMES DIV POW
%token LPAREN RPAREN LCURL RCURL
%token EOL EOF
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%left BINOMIAL MOD
%right POW		/* highest precedence */
%nonassoc UMINUS SIN COS ARCTAN FLOOR
%start main             /* the entry point */
%type <Type_def.inequation> main
%%
main:
  ineq COMMA VAR EOL          { (substitute $1 (Symbolic_Constant $3) (Input_variable $3)) }
  | ineq COMMA VAR EOF	      { (substitute $1 (Symbolic_Constant $3) (Input_variable $3)) }
;

ineq:
    expr EQUALS expr	{ Equals($1, $3) }
  | expr LESS expr	{ Less($1, $3) }
  | expr LESSEQ expr	{ LessEq($1, $3) }
  | expr GREATER expr	{ Greater($1, $3) }
  | expr GREATEREQ expr	{ GreaterEq($1, $3) }  
;
expr:
    INT			    { Rational(Mpq.init_set_si $1 1) }
  | FLOAT                   { Rational(Mpq.init_set_d ($1)) }
  | LPAREN expr RPAREN      { $2 }
  | expr PLUS expr          { Plus($1, $3) }
  | expr MINUS expr         { Minus($1, $3) }
  | expr TIMES expr         { Times($1, $3) }
  | expr DIV expr           { Divide($1, $3) }
  | expr POW expr	    { Pow($1, $3) }
  | MINUS expr %prec UMINUS { Times(Rational (Mpq.init_set_si (-1) 1), $2) }
  | expr BINOMIAL expr	    { Binomial($1, $3) }
  | VAR UNDERSCORE LCURL sub RCURL      { Output_variable ($1, $4) }
  | VAR UNDERSCORE LPAREN sub RPAREN    { Output_variable ($1, $4) }
  | VAR UNDERSCORE VAR      { Output_variable ($1, SSVar $3) }
  | VAR UNDERSCORE INT	    { Symbolic_Constant ($1 ^ "_" ^ (string_of_int $3)) }
  | VAR			    { Symbolic_Constant ($1) }
  | FLOOR LPAREN expr DIV FLOAT RPAREN { IDivide($3, Mpq.init_set_d ($5)) }
  | FLOOR LPAREN expr DIV INT RPAREN { IDivide($3, Mpq.init_set_si $5 1) }
  | SIN expr		    { Sin($2) }
  | COS expr		    { Cos($2) }
  | ARCTAN FLOAT	    { Arctan(Mpq.init_set_d $2) }
  | ARCTAN INT	  	    { Arctan(Mpq.init_set_si $2 1) }
  | expr MOD expr	    { Mod ($1, $3) }
  | PI			    { Pi }
;
sub:
    VAR PLUS INT	{ SAdd ($1, $3) }
  | VAR DIV INT		{ SSDiv ($1, $3) }
  | VAR PLUS FLOAT	{ SAdd ($1, int_of_float $3) }
  | VAR DIV FLOAT	{ SSDiv ($1, int_of_float $3) }
  | VAR			{ SSVar $1 }
;
