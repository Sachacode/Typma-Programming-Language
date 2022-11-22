
(* The type of tokens. *)

type token = 
  | WHILE
  | VAR of (string)
  | SUB
  | STR of (string)
  | SKIP
  | SEMICOLON
  | RPAREN
  | RBRACE
  | OR
  | NOT
  | MUL
  | LT
  | LPAREN
  | LBRACE
  | INT of (int)
  | IF
  | EQ
  | EOF
  | ELSE
  | DIV
  | BOOL of (bool)
  | ASGN
  | AND
  | ADD

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Typ.Typma.com)

module MenhirInterpreter : sig
  
  (* The incremental API. *)
  
  include MenhirLib.IncrementalEngine.INCREMENTAL_ENGINE
    with type token = token
  
end

(* The entry point(s) to the incremental API. *)

module Incremental : sig
  
  val prog: Lexing.position -> (Typ.Typma.com) MenhirInterpreter.checkpoint
  
end
