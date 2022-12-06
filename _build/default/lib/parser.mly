%{
    open Typ.Typma
%}

(** Tokens. *)
%token LPAREN RPAREN LBRACE RBRACE EOF
%token ADD SUB MUL DIV
%token NOT OR AND EQ LT
%token SKIP PRINT ASGN SEMICOLON IF ELSE WHILE
%token <bool> BOOL
%token <int> INT
%token <string> STR
%token <string> VAR

(** Start symbol. *)
%start <com> prog

(** expression parsing rules. *)
%type <exp> eadd
%type <exp> emul
%type <exp> eor
%type <exp> eand
%type <exp> enot
%type <exp> ecomp
%type <exp> elit

(** Command parsing rules. *)
%type <com> cseq
%type <com> cctrl
%type <com> cbot

%%

prog:
  | c=cseq EOF { c }

cseq:
  | c1=cctrl SEMICOLON c2=cseq { CSeq (c1,c2) }
  | c=cctrl { c }

cctrl:
  | IF e=eor LBRACE c1=cseq RBRACE ELSE LBRACE c2=cseq RBRACE { CIf (e,c1,c2) }
  | WHILE e=eor LBRACE c=cseq RBRACE { CWhile (e,c) }
  | c=cbot { c }

cbot:
  | SKIP { CSkip }
  | PRINT e=eor { CPrint e }
  | x=VAR ASGN e=eor { CAsgn (x,e) }
  | LPAREN c=cseq RPAREN { c }

eor:
  | e1=eand OR e2=eor { EOr (e1,e2) }
  | b=eand { b }

eand:
  | e1=enot AND e2=eand { EAnd (e1,e2) }
  | e=enot { e }

enot:
  | NOT e=enot { ENot e }
  | e=ecomp { e }

ecomp:
  | e1=eadd EQ e2=eadd { EEq (e1,e2) }
  | e1=eadd LT e2=eadd { ELe (e1,e2) }
  | e=eadd { e }

eadd:
  | e1=emul ADD e2=eadd { EPlus (e1,e2) }
  | e1=emul SUB e2=eadd { EMinus(e1,e2) }
  | e=emul { e }

emul:
  | e1=elit MUL e2=emul { EMult (e1,e2) }
  | e1=elit DIV e2=emul { EDiv (e1,e2) }
  | e=elit { e }

elit:
  | z=INT { ENat z }
  | b=BOOL { EBool b }
  | s=STR { EStr s }
  | x=VAR { EId x }
  | LPAREN e=eor RPAREN { e }
