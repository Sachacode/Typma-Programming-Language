(** Imp Syntax. *)

(** Arithmetic operations. *)
type op = Add | Sub | Mul | Div | Eq | Le | Not | And | Or

(** Arithmetic expressions. *)
type exp =
  | Int of int
  | Bool of bool
  | Str of string
  | Var of string
  | EOp of exp * op * exp

(** Imp commands. *)
type cmd =
  | Skip
  | Print of aexp
  | Ass of string * aexp
  | Seq of cmd * cmd
  | Con of cmd * cmd
  | If of bexp * cmd * cmd
  | While of bexp * cmd
  | Do of cmd * bexp
