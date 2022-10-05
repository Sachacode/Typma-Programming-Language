%{
    open Syntax
%}

(** Tokens. *)
%token LPAREN RPAREN LBRACE RBRACE EOF
%token ADD SUB MUL DIV
%token NOT OR AND EQ LT
%token SKIP PRINT ASGN SEMICOLON IF ELSE WHILE DO UNTIL CON
%token <bool> BOOL
%token <int> INT
%token <string> VAR

(** Start symbol. *)
%start <cmd> prog

(** Arithmetic-expression parsing rules. *)
%type <aexp> aadd
%type <aexp> amul
%type <aexp> alit

(** Boolean-expression parsing rules. *)
%type <bexp> bor
%type <bexp> band
%type <bexp> bnot
%type <bexp> bcomp
%type <bexp> blit

(** Command parsing rules. *)
%type <cmd> cseq
%type <cmd> cctrl
%type <cmd> cbot

%%

prog:
  | c=cseq EOF { c }

cseq:
  | c1=cctrl SEMICOLON c2=cseq { Seq (c1,c2) }
  | c1=cctrl CON c2=cseq { Con (c1,c2) }
  | c=cctrl { c }


cctrl:
  | IF b=bor LBRACE c1=cseq RBRACE ELSE LBRACE c2=cseq RBRACE { If (b,c1,c2) }
  | WHILE b=bor LBRACE c=cseq RBRACE { While (b,c) }
  | DO LBRACE c=cseq RBRACE UNTIL b=bor { Do (c,b)}
  | c=cbot { c }

cbot:
  | SKIP { Skip }
  | PRINT a=aadd { Print a }
  | x=VAR ASGN a=aadd { Ass (x,a) }
  | LPAREN c=cseq RPAREN { c }

bor:
  | b1=band OR b2=bor { BOp (b1,Or,b2) }
  | b=band { b }

band:
  | b1=bnot AND b2=band { BOp (b1,And,b2) }
  | b=bnot { b }

bnot:
  | NOT b=bnot { Not b }
  | b=bcomp { b }

bcomp:
  | a1=aadd EQ a2=aadd { COp (a1,Eq,a2) }
  | a1=aadd LT a2=aadd { COp (a1,Lt,a2) }
  | b=blit { b }

blit:
  | b=BOOL { Bool b }
  | LPAREN b=bor RPAREN { b }

aadd:
  | a1=amul ADD a2=aadd { AOp (a1,Add,a2) }
  | a1=amul SUB a2=aadd { AOp (a1,Sub,a2) }
  | a=amul { a }

amul:
  | a1=alit MUL a2=amul { AOp (a1,Mul,a2) }
  | a1=alit DIV a2=amul {AOp (a1,Div,a2)}
  | a=alit { a }

alit:
  | z=INT { Int z }
  | x=VAR { Var x }
  | LPAREN a=aadd RPAREN { a }
