(** Imp Syntax. *)

(** Arithmetic operations. *)
type aop = Add | Sub | Mul | Div

(** Arithmetic expressions. *)
type aexp =
  | Int of int
  | Var of string
  | AOp of aexp * aop * aexp

(** Boolean operations. *)
type bop = And | Or

(** Comparison operations. *)
type cop = Eq | Lt

(** Boolean expressions. *)
type bexp =
  | Bool of bool
  | Not of bexp
  | BOp of bexp * bop * bexp
  | COp of aexp * cop * aexp

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
