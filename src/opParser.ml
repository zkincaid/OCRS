type token =
  | INT of (int)
  | FLOAT of (float)
  | VAR of (string)
  | COMMA
  | UNDERSCORE
  | PI
  | BINOMIAL
  | MOD
  | FLOOR
  | SIN
  | COS
  | ARCTAN
  | EQUALS
  | LESS
  | LESSEQ
  | GREATER
  | GREATEREQ
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | POW
  | LPAREN
  | RPAREN
  | LCURL
  | RCURL
  | Q
  | EOL
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "opParser.mly"
open Type_def
# 37 "opParser.ml"
let yytransl_const = [|
  260 (* COMMA *);
  261 (* UNDERSCORE *);
  262 (* PI *);
  263 (* BINOMIAL *);
  264 (* MOD *);
  265 (* FLOOR *);
  266 (* SIN *);
  267 (* COS *);
  268 (* ARCTAN *);
  269 (* EQUALS *);
  270 (* LESS *);
  271 (* LESSEQ *);
  272 (* GREATER *);
  273 (* GREATEREQ *);
  274 (* PLUS *);
  275 (* MINUS *);
  276 (* TIMES *);
  277 (* DIV *);
  278 (* POW *);
  279 (* LPAREN *);
  280 (* RPAREN *);
  281 (* LCURL *);
  282 (* RCURL *);
  283 (* Q *);
  284 (* EOL *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* FLOAT *);
  259 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\003\000\003\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\002\000\002\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\002\000\003\000\005\000\005\000\003\000\003\000\
\001\000\006\000\006\000\002\000\002\000\002\000\002\000\003\000\
\001\000\001\000\003\000\003\000\003\000\003\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\003\000\004\000\000\000\025\000\000\000\000\000\
\000\000\000\000\000\000\000\000\026\000\032\000\000\000\000\000\
\000\000\020\000\021\000\023\000\022\000\011\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\001\000\002\000\
\016\000\015\000\000\000\000\000\000\000\005\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\014\000\013\000\000\000\000\000\027\000\
\029\000\028\000\030\000\019\000\018\000"

let yydgoto = "\002\000\
\014\000\044\000\047\000"

let yysindex = "\255\255\
\035\255\000\000\000\000\000\000\008\255\000\000\009\255\035\255\
\035\255\004\255\035\255\035\255\000\000\000\000\019\000\077\255\
\035\255\000\000\000\000\000\000\000\000\000\000\074\255\035\255\
\035\255\035\255\035\255\035\255\035\255\035\255\000\000\000\000\
\000\000\000\000\036\255\036\255\096\255\000\000\018\255\018\255\
\001\255\001\255\251\254\251\254\018\255\245\254\019\255\022\255\
\064\255\024\255\033\255\000\000\000\000\025\255\026\255\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\024\000\042\000\
\055\000\086\000\068\000\079\000\057\000\248\254\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\101\255\117\255\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\003\000\015\000"

let yytablesize = 370
let yytable = "\001\000\
\017\000\024\000\025\000\015\000\020\000\021\000\050\000\024\000\
\025\000\051\000\018\000\019\000\016\000\022\000\023\000\031\000\
\030\000\031\000\032\000\037\000\028\000\029\000\030\000\012\000\
\056\000\057\000\039\000\040\000\041\000\042\000\043\000\017\000\
\045\000\058\000\059\000\003\000\004\000\005\000\046\000\030\000\
\006\000\024\000\052\000\007\000\008\000\009\000\010\000\053\000\
\060\000\061\000\048\000\000\000\000\000\011\000\006\000\000\000\
\010\000\012\000\000\000\000\000\000\000\013\000\000\000\000\000\
\054\000\055\000\005\000\008\000\000\000\006\000\000\000\000\000\
\007\000\008\000\009\000\010\000\000\000\033\000\009\000\034\000\
\024\000\025\000\011\000\000\000\000\000\007\000\012\000\000\000\
\000\000\000\000\013\000\026\000\027\000\028\000\029\000\030\000\
\000\000\038\000\000\000\035\000\000\000\036\000\024\000\025\000\
\000\000\000\000\000\000\003\000\003\000\000\000\000\000\000\000\
\000\000\026\000\027\000\028\000\049\000\030\000\003\000\003\000\
\003\000\003\000\003\000\004\000\004\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\004\000\004\000\
\004\000\004\000\004\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\017\000\
\017\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\017\000\017\000\017\000\017\000\017\000\000\000\
\017\000\024\000\025\000\000\000\017\000\000\000\012\000\012\000\
\000\000\000\000\000\000\000\000\026\000\027\000\028\000\029\000\
\030\000\012\000\012\000\012\000\012\000\000\000\031\000\012\000\
\024\000\024\000\000\000\012\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\024\000\024\000\024\000\024\000\010\000\
\010\000\024\000\000\000\000\000\000\000\024\000\000\000\000\000\
\006\000\006\000\010\000\010\000\010\000\010\000\006\000\000\000\
\010\000\000\000\006\000\000\000\010\000\008\000\008\000\008\000\
\008\000\000\000\000\000\008\000\000\000\000\000\000\000\008\000\
\009\000\009\000\009\000\009\000\000\000\000\000\009\000\007\000\
\007\000\000\000\009\000\000\000\000\000\007\000\000\000\000\000\
\000\000\007\000"

let yycheck = "\001\000\
\000\000\007\001\008\001\001\000\001\001\002\001\018\001\007\001\
\008\001\021\001\008\000\009\000\005\001\011\000\012\000\024\001\
\022\001\026\001\000\000\017\000\020\001\021\001\022\001\000\000\
\001\001\002\001\024\000\025\000\026\000\027\000\028\000\023\001\
\030\000\001\001\002\001\001\001\002\001\003\001\003\001\022\001\
\006\001\000\000\024\001\009\001\010\001\011\001\012\001\026\001\
\024\001\024\001\036\000\255\255\255\255\019\001\000\000\255\255\
\000\000\023\001\255\255\255\255\255\255\027\001\255\255\255\255\
\001\001\002\001\003\001\000\000\255\255\006\001\255\255\255\255\
\009\001\010\001\011\001\012\001\255\255\001\001\000\000\003\001\
\007\001\008\001\019\001\255\255\255\255\000\000\023\001\255\255\
\255\255\255\255\027\001\018\001\019\001\020\001\021\001\022\001\
\255\255\024\001\255\255\023\001\255\255\025\001\007\001\008\001\
\255\255\255\255\255\255\007\001\008\001\255\255\255\255\255\255\
\255\255\018\001\019\001\020\001\021\001\022\001\018\001\019\001\
\020\001\021\001\022\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\018\001\019\001\
\020\001\021\001\022\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\007\001\
\008\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\018\001\019\001\020\001\021\001\022\001\255\255\
\024\001\007\001\008\001\255\255\028\001\255\255\007\001\008\001\
\255\255\255\255\255\255\255\255\018\001\019\001\020\001\021\001\
\022\001\018\001\019\001\020\001\021\001\255\255\028\001\024\001\
\007\001\008\001\255\255\028\001\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\018\001\019\001\020\001\021\001\007\001\
\008\001\024\001\255\255\255\255\255\255\028\001\255\255\255\255\
\018\001\019\001\018\001\019\001\020\001\021\001\024\001\255\255\
\024\001\255\255\028\001\255\255\028\001\018\001\019\001\020\001\
\021\001\255\255\255\255\024\001\255\255\255\255\255\255\028\001\
\018\001\019\001\020\001\021\001\255\255\255\255\024\001\018\001\
\019\001\255\255\028\001\255\255\255\255\024\001\255\255\255\255\
\255\255\028\001"

let yynames_const = "\
  COMMA\000\
  UNDERSCORE\000\
  PI\000\
  BINOMIAL\000\
  MOD\000\
  FLOOR\000\
  SIN\000\
  COS\000\
  ARCTAN\000\
  EQUALS\000\
  LESS\000\
  LESSEQ\000\
  GREATER\000\
  GREATEREQ\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  POW\000\
  LPAREN\000\
  RPAREN\000\
  LCURL\000\
  RCURL\000\
  Q\000\
  EOL\000\
  EOF\000\
  "

let yynames_block = "\
  INT\000\
  FLOAT\000\
  VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 26 "opParser.mly"
                      ( (Op_simplifications.op_automatic_simplify _1) )
# 262 "opParser.ml"
               : Type_def.op_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 27 "opParser.mly"
                      ( (Op_simplifications.op_automatic_simplify _1) )
# 269 "opParser.ml"
               : Type_def.op_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 31 "opParser.mly"
              ( OpRational(Mpq.init_set_si _1 1) )
# 276 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 32 "opParser.mly"
                            ( OpRational(Mpq.init_set_d (_1)) )
# 283 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 33 "opParser.mly"
                            ( _2 )
# 290 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 34 "opParser.mly"
                            ( OpPlus(_1, _3) )
# 298 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 35 "opParser.mly"
                            ( OpMinus(_1, _3) )
# 306 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "opParser.mly"
                            ( OpTimes(_1, _3) )
# 314 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "opParser.mly"
                            ( OpDivide(_1, _3) )
# 322 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 38 "opParser.mly"
                      ( OpPow(_1, _3) )
# 330 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 39 "opParser.mly"
                            ( OpTimes(OpRational (Mpq.init_set_si (-1) 1), _2) )
# 337 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 40 "opParser.mly"
                           ( SymBinom(_1, _3) )
# 345 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'sub) in
    Obj.repr(
# 41 "opParser.mly"
                                        ( OpOutput_variable (_1, _4) )
# 353 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'sub) in
    Obj.repr(
# 42 "opParser.mly"
                                        ( OpOutput_variable (_1, _4) )
# 361 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 43 "opParser.mly"
                            ( OpOutput_variable (_1, SSVar _3) )
# 369 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 44 "opParser.mly"
                           ( OpSymbolic_Constant (_1 ^ "_" ^ (string_of_int _3)) )
# 377 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 45 "opParser.mly"
              ( OpSymbolic_Constant (_1) )
# 384 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : float) in
    Obj.repr(
# 46 "opParser.mly"
                                       ( SymIDivide(_3, Mpq.init_set_d (_5)) )
# 392 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 47 "opParser.mly"
                                     ( SymIDivide(_3, Mpq.init_set_si _5 1) )
# 400 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 48 "opParser.mly"
                  ( SymSin(_2) )
# 407 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 49 "opParser.mly"
                  ( SymCos(_2) )
# 414 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 50 "opParser.mly"
                     ( OpArctan(Mpq.init_set_d _2) )
# 421 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 51 "opParser.mly"
                      ( OpArctan(Mpq.init_set_si _2 1) )
# 428 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 52 "opParser.mly"
                      ( SymMod (_1, _3) )
# 436 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "opParser.mly"
             ( OpPi )
# 442 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "opParser.mly"
                            ( Q )
# 448 "opParser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 57 "opParser.mly"
                 ( SAdd (_1, _3) )
# 456 "opParser.ml"
               : 'sub))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 58 "opParser.mly"
                 ( SSDiv (_1, _3) )
# 464 "opParser.ml"
               : 'sub))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 59 "opParser.mly"
                   ( SAdd (_1, int_of_float _3) )
# 472 "opParser.ml"
               : 'sub))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 60 "opParser.mly"
                  ( SSDiv (_1, int_of_float _3) )
# 480 "opParser.ml"
               : 'sub))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "opParser.mly"
          ( SSVar _1 )
# 487 "opParser.ml"
               : 'sub))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Type_def.op_expr)