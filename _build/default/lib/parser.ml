
(* This generated code requires the following version of MenhirLib: *)

let () =
  MenhirLib.StaticVersion.require_20220210

module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | VAR of (
# 12 "lib/parser.mly"
       (string)
# 21 "lib/parser.ml"
  )
    | UNTIL
    | SUB
    | SKIP
    | SEMICOLON
    | RPAREN
    | RBRACE
    | PRINT
    | OR
    | NOT
    | MUL
    | LT
    | LPAREN
    | LBRACE
    | INT of (
# 11 "lib/parser.mly"
       (int)
# 39 "lib/parser.ml"
  )
    | IF
    | EQ
    | EOF
    | ELSE
    | DO
    | DIV
    | CON
    | BOOL of (
# 10 "lib/parser.mly"
       (bool)
# 51 "lib/parser.ml"
  )
    | ASGN
    | AND
    | ADD
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
    open Syntax

# 65 "lib/parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | ADD ->
          27
      | AND ->
          26
      | ASGN ->
          25
      | BOOL _ ->
          24
      | CON ->
          23
      | DIV ->
          22
      | DO ->
          21
      | ELSE ->
          20
      | EOF ->
          19
      | EQ ->
          18
      | IF ->
          17
      | INT _ ->
          16
      | LBRACE ->
          15
      | LPAREN ->
          14
      | LT ->
          13
      | MUL ->
          12
      | NOT ->
          11
      | OR ->
          10
      | PRINT ->
          9
      | RBRACE ->
          8
      | RPAREN ->
          7
      | SEMICOLON ->
          6
      | SKIP ->
          5
      | SUB ->
          4
      | UNTIL ->
          3
      | VAR _ ->
          2
      | WHILE ->
          1
  
  and error_terminal =
    0
  
  and token2value : token -> Obj.t =
    fun _tok ->
      match _tok with
      | ADD ->
          Obj.repr ()
      | AND ->
          Obj.repr ()
      | ASGN ->
          Obj.repr ()
      | BOOL _v ->
          Obj.repr _v
      | CON ->
          Obj.repr ()
      | DIV ->
          Obj.repr ()
      | DO ->
          Obj.repr ()
      | ELSE ->
          Obj.repr ()
      | EOF ->
          Obj.repr ()
      | EQ ->
          Obj.repr ()
      | IF ->
          Obj.repr ()
      | INT _v ->
          Obj.repr _v
      | LBRACE ->
          Obj.repr ()
      | LPAREN ->
          Obj.repr ()
      | LT ->
          Obj.repr ()
      | MUL ->
          Obj.repr ()
      | NOT ->
          Obj.repr ()
      | OR ->
          Obj.repr ()
      | PRINT ->
          Obj.repr ()
      | RBRACE ->
          Obj.repr ()
      | RPAREN ->
          Obj.repr ()
      | SEMICOLON ->
          Obj.repr ()
      | SKIP ->
          Obj.repr ()
      | SUB ->
          Obj.repr ()
      | UNTIL ->
          Obj.repr ()
      | VAR _v ->
          Obj.repr _v
      | WHILE ->
          Obj.repr ()
  
  and default_reduction =
    (8, "\000\000\006\000\000\005\016\000\017\000\000\015\019\011\000\000\000\000\000\b\000\t\000\007\003\000\002\000\000\014\000\r\000\000\020\000\018\000\000\000\000\024\022\000\023\000\000\000\000\000\000\000\000\000\028\000\000\030\029\000\031\000\000\000\000\000\026\000\025\000\027\001\000!")
  
  and error =
    (28, "dBD\002\001(\b\000\000\000\002\001(\b \018\128\128\000\000\000\000\000\000\000\016\000\000\000\000\000\000:\017\018 \018\128\128\000\000\000\000\000\000\000\000\000\000\011\16512\000(\000 \002\128\000\186\2113 \002\128\000\000\000\000 \002\128\000\000\000\000\001\000\000\000\000\000\000\000\000\000\002\000(\000\000\000\000\000\000B\000 \002\128\000\000\000\000 \002\128\000\000\000\000\003\161\017\002\001(\b\000\000\000\000\016B\000\000\000\000\000\000\016\000dBD\000\000\000\004 \002\128\000\000\000\000\000\000\000\002\000(\000\000\000\000\006D$@ \018\128\128\000\016\000dBD\000\000\016\000dBD\000\b\000\000\016\000\000\002\001(\b\000\000\000\0008\001\016dBD\000\000\000\000\000\000\000\006D$@\000\000\000\000\b\000\000\000\000\b\000\000\016\000dBD\000\b\000\000\000\000\000\000\016\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000")
  
  and start =
    1
  
  and action =
    ((8, "b~\000~~\000\000\012\000D~\000\000\000(\030\030\t\030\000\030\000\r\000\000\030\000\017\030\000\030\000z~\000\r\000\002b\011\030\000\000\030\000b~\012b\020b0>~\000\150b\000\000b\0008\"<bP\000Z\000^\000\000J\000"), (16, "\000%\000^\000%\000%\000%\000r\000%\000r\000J\000%\000z\000%\000z\000\"\000%\000%\000\154\000\n\000R\000%\000\162\000\194\000%\000%\000>\000\202\000\r\000\r\000\r\000B\000\r\000\022\000\210\000\r\000\214\000\r\000\250\000\254\000\r\000\r\000-\000-\000-\000\r\000-\001\002\000\r\000f\001\n\000-\000\006\000\158\001\018\000-\000\170\001\026\001'\000-\000\174\000\000\000*\000\000\000\000\000\182\000\000\000\n\000\186\000Q\000Q\000Q\000\198\000\134\000\000\000\000\000\014\000\000\000Q\000\018\000\000\000\022\000Q\000\226\000}\000}\000Q\000\000\000\000\000\026\000\000\000\000\000\000\000\000\000\000\000\000\000}\000\000\000\000\000\000\000\238"))
  
  and lhs =
    (4, "\012\204\187\186\170\153\136\135veTDC32\"\016")
  
  and goto =
    ((8, "j\011\000R\006\000\000\000\000\000D\000\000\000\000`f\000\180\000\184\000\000\000\000l\000\000r\000x\000\000\022\000\000\000\000\142\000\132\000\000\138\000\160&\000\166\000\172\000\0006\000\000\178\000\000\184\000\000\000\000\190\000\000\000\000\000\000\000\000\000"), (8, "&\n\012\r!\015\018\028\b\n\012\r!\015\018$#\n\012\r!\015\018\0280\n\012\r!\015\018\0287\n\012\r!\015\018\028\n\012\r\014\015\018\028%\012\r\000\015\018\028HI8;\015\018\025\015\018\023\015\018\027\015\018\030\015\018 F8;\015\018*\015\018-D8;>8;48;:8;=8;B8;\020\018\022\018"))
  
  and semantic_action =
    [|
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = a2;
          MenhirLib.EngineTypes.startp = _startpos_a2_;
          MenhirLib.EngineTypes.endp = _endpos_a2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = a1;
              MenhirLib.EngineTypes.startp = _startpos_a1_;
              MenhirLib.EngineTypes.endp = _endpos_a1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let a2 : (Syntax.aexp) = Obj.magic a2 in
        let _2 : unit = Obj.magic _2 in
        let a1 : (Syntax.aexp) = Obj.magic a1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a1_ in
        let _endpos = _endpos_a2_ in
        let _v : (Syntax.aexp) = 
# 79 "lib/parser.mly"
                        ( AOp (a1,Add,a2) )
# 240 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = a2;
          MenhirLib.EngineTypes.startp = _startpos_a2_;
          MenhirLib.EngineTypes.endp = _endpos_a2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = a1;
              MenhirLib.EngineTypes.startp = _startpos_a1_;
              MenhirLib.EngineTypes.endp = _endpos_a1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let a2 : (Syntax.aexp) = Obj.magic a2 in
        let _2 : unit = Obj.magic _2 in
        let a1 : (Syntax.aexp) = Obj.magic a1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a1_ in
        let _endpos = _endpos_a2_ in
        let _v : (Syntax.aexp) = 
# 80 "lib/parser.mly"
                        ( AOp (a1,Sub,a2) )
# 279 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = a;
          MenhirLib.EngineTypes.startp = _startpos_a_;
          MenhirLib.EngineTypes.endp = _endpos_a_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let a : (Syntax.aexp) = Obj.magic a in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a_ in
        let _endpos = _endpos_a_ in
        let _v : (Syntax.aexp) = 
# 81 "lib/parser.mly"
           ( a )
# 304 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = z;
          MenhirLib.EngineTypes.startp = _startpos_z_;
          MenhirLib.EngineTypes.endp = _endpos_z_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let z : (
# 11 "lib/parser.mly"
       (int)
# 325 "lib/parser.ml"
        ) = Obj.magic z in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_z_ in
        let _endpos = _endpos_z_ in
        let _v : (Syntax.aexp) = 
# 89 "lib/parser.mly"
          ( Int z )
# 333 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (
# 12 "lib/parser.mly"
       (string)
# 354 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.aexp) = 
# 90 "lib/parser.mly"
          ( Var x )
# 362 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = a;
            MenhirLib.EngineTypes.startp = _startpos_a_;
            MenhirLib.EngineTypes.endp = _endpos_a_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let a : (Syntax.aexp) = Obj.magic a in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.aexp) = 
# 91 "lib/parser.mly"
                         ( a )
# 401 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = a2;
          MenhirLib.EngineTypes.startp = _startpos_a2_;
          MenhirLib.EngineTypes.endp = _endpos_a2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = a1;
              MenhirLib.EngineTypes.startp = _startpos_a1_;
              MenhirLib.EngineTypes.endp = _endpos_a1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let a2 : (Syntax.aexp) = Obj.magic a2 in
        let _2 : unit = Obj.magic _2 in
        let a1 : (Syntax.aexp) = Obj.magic a1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a1_ in
        let _endpos = _endpos_a2_ in
        let _v : (Syntax.aexp) = 
# 84 "lib/parser.mly"
                        ( AOp (a1,Mul,a2) )
# 440 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = a2;
          MenhirLib.EngineTypes.startp = _startpos_a2_;
          MenhirLib.EngineTypes.endp = _endpos_a2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = a1;
              MenhirLib.EngineTypes.startp = _startpos_a1_;
              MenhirLib.EngineTypes.endp = _endpos_a1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let a2 : (Syntax.aexp) = Obj.magic a2 in
        let _2 : unit = Obj.magic _2 in
        let a1 : (Syntax.aexp) = Obj.magic a1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a1_ in
        let _endpos = _endpos_a2_ in
        let _v : (Syntax.aexp) = 
# 85 "lib/parser.mly"
                        (AOp (a1,Div,a2))
# 479 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = a;
          MenhirLib.EngineTypes.startp = _startpos_a_;
          MenhirLib.EngineTypes.endp = _endpos_a_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let a : (Syntax.aexp) = Obj.magic a in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a_ in
        let _endpos = _endpos_a_ in
        let _v : (Syntax.aexp) = 
# 86 "lib/parser.mly"
           ( a )
# 504 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = b2;
          MenhirLib.EngineTypes.startp = _startpos_b2_;
          MenhirLib.EngineTypes.endp = _endpos_b2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = b1;
              MenhirLib.EngineTypes.startp = _startpos_b1_;
              MenhirLib.EngineTypes.endp = _endpos_b1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let b2 : (Syntax.bexp) = Obj.magic b2 in
        let _2 : unit = Obj.magic _2 in
        let b1 : (Syntax.bexp) = Obj.magic b1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_b1_ in
        let _endpos = _endpos_b2_ in
        let _v : (Syntax.bexp) = 
# 62 "lib/parser.mly"
                        ( BOp (b1,And,b2) )
# 543 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = b;
          MenhirLib.EngineTypes.startp = _startpos_b_;
          MenhirLib.EngineTypes.endp = _endpos_b_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let b : (Syntax.bexp) = Obj.magic b in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_b_ in
        let _endpos = _endpos_b_ in
        let _v : (Syntax.bexp) = 
# 63 "lib/parser.mly"
           ( b )
# 568 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = a2;
          MenhirLib.EngineTypes.startp = _startpos_a2_;
          MenhirLib.EngineTypes.endp = _endpos_a2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = a1;
              MenhirLib.EngineTypes.startp = _startpos_a1_;
              MenhirLib.EngineTypes.endp = _endpos_a1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let a2 : (Syntax.aexp) = Obj.magic a2 in
        let _2 : unit = Obj.magic _2 in
        let a1 : (Syntax.aexp) = Obj.magic a1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a1_ in
        let _endpos = _endpos_a2_ in
        let _v : (Syntax.bexp) = 
# 70 "lib/parser.mly"
                       ( COp (a1,Eq,a2) )
# 607 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = a2;
          MenhirLib.EngineTypes.startp = _startpos_a2_;
          MenhirLib.EngineTypes.endp = _endpos_a2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = a1;
              MenhirLib.EngineTypes.startp = _startpos_a1_;
              MenhirLib.EngineTypes.endp = _endpos_a1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let a2 : (Syntax.aexp) = Obj.magic a2 in
        let _2 : unit = Obj.magic _2 in
        let a1 : (Syntax.aexp) = Obj.magic a1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a1_ in
        let _endpos = _endpos_a2_ in
        let _v : (Syntax.bexp) = 
# 71 "lib/parser.mly"
                       ( COp (a1,Lt,a2) )
# 646 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = b;
          MenhirLib.EngineTypes.startp = _startpos_b_;
          MenhirLib.EngineTypes.endp = _endpos_b_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let b : (Syntax.bexp) = Obj.magic b in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_b_ in
        let _endpos = _endpos_b_ in
        let _v : (Syntax.bexp) = 
# 72 "lib/parser.mly"
           ( b )
# 671 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = b;
          MenhirLib.EngineTypes.startp = _startpos_b_;
          MenhirLib.EngineTypes.endp = _endpos_b_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let b : (
# 10 "lib/parser.mly"
       (bool)
# 692 "lib/parser.ml"
        ) = Obj.magic b in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_b_ in
        let _endpos = _endpos_b_ in
        let _v : (Syntax.bexp) = 
# 75 "lib/parser.mly"
           ( Bool b )
# 700 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = b;
            MenhirLib.EngineTypes.startp = _startpos_b_;
            MenhirLib.EngineTypes.endp = _endpos_b_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let b : (Syntax.bexp) = Obj.magic b in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.bexp) = 
# 76 "lib/parser.mly"
                        ( b )
# 739 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = b;
          MenhirLib.EngineTypes.startp = _startpos_b_;
          MenhirLib.EngineTypes.endp = _endpos_b_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let b : (Syntax.bexp) = Obj.magic b in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_b_ in
        let _v : (Syntax.bexp) = 
# 66 "lib/parser.mly"
               ( Not b )
# 771 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = b;
          MenhirLib.EngineTypes.startp = _startpos_b_;
          MenhirLib.EngineTypes.endp = _endpos_b_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let b : (Syntax.bexp) = Obj.magic b in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_b_ in
        let _endpos = _endpos_b_ in
        let _v : (Syntax.bexp) = 
# 67 "lib/parser.mly"
            ( b )
# 796 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = b2;
          MenhirLib.EngineTypes.startp = _startpos_b2_;
          MenhirLib.EngineTypes.endp = _endpos_b2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = b1;
              MenhirLib.EngineTypes.startp = _startpos_b1_;
              MenhirLib.EngineTypes.endp = _endpos_b1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let b2 : (Syntax.bexp) = Obj.magic b2 in
        let _2 : unit = Obj.magic _2 in
        let b1 : (Syntax.bexp) = Obj.magic b1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_b1_ in
        let _endpos = _endpos_b2_ in
        let _v : (Syntax.bexp) = 
# 58 "lib/parser.mly"
                      ( BOp (b1,Or,b2) )
# 835 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = b;
          MenhirLib.EngineTypes.startp = _startpos_b_;
          MenhirLib.EngineTypes.endp = _endpos_b_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let b : (Syntax.bexp) = Obj.magic b in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_b_ in
        let _endpos = _endpos_b_ in
        let _v : (Syntax.bexp) = 
# 59 "lib/parser.mly"
           ( b )
# 860 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.cmd) = 
# 52 "lib/parser.mly"
         ( Skip )
# 885 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = a;
          MenhirLib.EngineTypes.startp = _startpos_a_;
          MenhirLib.EngineTypes.endp = _endpos_a_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let a : (Syntax.aexp) = Obj.magic a in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_a_ in
        let _v : (Syntax.cmd) = 
# 53 "lib/parser.mly"
                 ( Print a )
# 917 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = a;
          MenhirLib.EngineTypes.startp = _startpos_a_;
          MenhirLib.EngineTypes.endp = _endpos_a_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let a : (Syntax.aexp) = Obj.magic a in
        let _2 : unit = Obj.magic _2 in
        let x : (
# 12 "lib/parser.mly"
       (string)
# 952 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_a_ in
        let _v : (Syntax.cmd) = 
# 54 "lib/parser.mly"
                      ( Ass (x,a) )
# 960 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.cmd) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.cmd) = 
# 55 "lib/parser.mly"
                         ( c )
# 999 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _9;
          MenhirLib.EngineTypes.startp = _startpos__9_;
          MenhirLib.EngineTypes.endp = _endpos__9_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c2;
            MenhirLib.EngineTypes.startp = _startpos_c2_;
            MenhirLib.EngineTypes.endp = _endpos_c2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _7;
              MenhirLib.EngineTypes.startp = _startpos__7_;
              MenhirLib.EngineTypes.endp = _endpos__7_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _6;
                MenhirLib.EngineTypes.startp = _startpos__6_;
                MenhirLib.EngineTypes.endp = _endpos__6_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _5;
                  MenhirLib.EngineTypes.startp = _startpos__5_;
                  MenhirLib.EngineTypes.endp = _endpos__5_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = c1;
                    MenhirLib.EngineTypes.startp = _startpos_c1_;
                    MenhirLib.EngineTypes.endp = _endpos_c1_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _3;
                      MenhirLib.EngineTypes.startp = _startpos__3_;
                      MenhirLib.EngineTypes.endp = _endpos__3_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = b;
                        MenhirLib.EngineTypes.startp = _startpos_b_;
                        MenhirLib.EngineTypes.endp = _endpos_b_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _menhir_s;
                          MenhirLib.EngineTypes.semv = _1;
                          MenhirLib.EngineTypes.startp = _startpos__1_;
                          MenhirLib.EngineTypes.endp = _endpos__1_;
                          MenhirLib.EngineTypes.next = _menhir_stack;
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _9 : unit = Obj.magic _9 in
        let c2 : (Syntax.cmd) = Obj.magic c2 in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let c1 : (Syntax.cmd) = Obj.magic c1 in
        let _3 : unit = Obj.magic _3 in
        let b : (Syntax.bexp) = Obj.magic b in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__9_ in
        let _v : (Syntax.cmd) = 
# 46 "lib/parser.mly"
                                                              ( If (b,c1,c2) )
# 1080 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3;
              MenhirLib.EngineTypes.startp = _startpos__3_;
              MenhirLib.EngineTypes.endp = _endpos__3_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = b;
                MenhirLib.EngineTypes.startp = _startpos_b_;
                MenhirLib.EngineTypes.endp = _endpos_b_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let c : (Syntax.cmd) = Obj.magic c in
        let _3 : unit = Obj.magic _3 in
        let b : (Syntax.bexp) = Obj.magic b in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v : (Syntax.cmd) = 
# 47 "lib/parser.mly"
                                     ( While (b,c) )
# 1133 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = b;
          MenhirLib.EngineTypes.startp = _startpos_b_;
          MenhirLib.EngineTypes.endp = _endpos_b_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _5;
            MenhirLib.EngineTypes.startp = _startpos__5_;
            MenhirLib.EngineTypes.endp = _endpos__5_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = c;
                MenhirLib.EngineTypes.startp = _startpos_c_;
                MenhirLib.EngineTypes.endp = _endpos_c_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let b : (Syntax.bexp) = Obj.magic b in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let c : (Syntax.cmd) = Obj.magic c in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_b_ in
        let _v : (Syntax.cmd) = 
# 48 "lib/parser.mly"
                                        ( Do (c,b))
# 1193 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = c;
          MenhirLib.EngineTypes.startp = _startpos_c_;
          MenhirLib.EngineTypes.endp = _endpos_c_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let c : (Syntax.cmd) = Obj.magic c in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_c_ in
        let _endpos = _endpos_c_ in
        let _v : (Syntax.cmd) = 
# 49 "lib/parser.mly"
           ( c )
# 1218 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = c2;
          MenhirLib.EngineTypes.startp = _startpos_c2_;
          MenhirLib.EngineTypes.endp = _endpos_c2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = c1;
              MenhirLib.EngineTypes.startp = _startpos_c1_;
              MenhirLib.EngineTypes.endp = _endpos_c1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let c2 : (Syntax.cmd) = Obj.magic c2 in
        let _2 : unit = Obj.magic _2 in
        let c1 : (Syntax.cmd) = Obj.magic c1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_c1_ in
        let _endpos = _endpos_c2_ in
        let _v : (Syntax.cmd) = 
# 40 "lib/parser.mly"
                               ( Seq (c1,c2) )
# 1257 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = c2;
          MenhirLib.EngineTypes.startp = _startpos_c2_;
          MenhirLib.EngineTypes.endp = _endpos_c2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = c1;
              MenhirLib.EngineTypes.startp = _startpos_c1_;
              MenhirLib.EngineTypes.endp = _endpos_c1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let c2 : (Syntax.cmd) = Obj.magic c2 in
        let _2 : unit = Obj.magic _2 in
        let c1 : (Syntax.cmd) = Obj.magic c1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_c1_ in
        let _endpos = _endpos_c2_ in
        let _v : (Syntax.cmd) = 
# 41 "lib/parser.mly"
                         ( Con (c1,c2) )
# 1296 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = c;
          MenhirLib.EngineTypes.startp = _startpos_c_;
          MenhirLib.EngineTypes.endp = _endpos_c_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let c : (Syntax.cmd) = Obj.magic c in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_c_ in
        let _endpos = _endpos_c_ in
        let _v : (Syntax.cmd) = 
# 42 "lib/parser.mly"
            ( c )
# 1321 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let c : (Syntax.cmd) = Obj.magic c in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_c_ in
        let _endpos = _endpos__2_ in
        let _v : (Syntax.cmd) = 
# 37 "lib/parser.mly"
               ( c )
# 1353 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
    |]
  
  and trace =
    None
  
end

module MenhirInterpreter = struct
  
  module ET = MenhirLib.TableInterpreter.MakeEngineTable (Tables)
  
  module TI = MenhirLib.Engine.Make (ET)
  
  include TI
  
end

let prog =
  fun lexer lexbuf ->
    (Obj.magic (MenhirInterpreter.entry `Legacy 0 lexer lexbuf) : (Syntax.cmd))

module Incremental = struct
  
  let prog =
    fun initial_position ->
      (Obj.magic (MenhirInterpreter.start 0 initial_position) : (Syntax.cmd) MenhirInterpreter.checkpoint)
  
end
