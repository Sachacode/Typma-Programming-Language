
(* The type of tokens. *)

type token = 
  | WHILE
  | VAR of (string)
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
  | INT of (int)
  | IF
  | EQ
  | EOF
  | ELSE
  | DO
  | DIV
  | CON
  | BOOL of (bool)
  | ASGN
  | AND
  | ADD

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.cmd)

module MenhirInterpreter : sig
  
  (* The incremental API. *)
  
  include MenhirLib.IncrementalEngine.INCREMENTAL_ENGINE
    with type token = token
  
end

(* The entry point(s) to the incremental API. *)

module Incremental : sig
  
  val prog: Lexing.position -> (Syntax.cmd) MenhirInterpreter.checkpoint
  
end
