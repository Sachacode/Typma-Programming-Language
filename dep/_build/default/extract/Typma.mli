open Bool
open Nat
open String

module Pacer :
 sig
  val pacer : string

  val succ : string

  val no_succ : string

  val fs : string

  val ts : string

  val ms : string

  val nots : string

  val ands : string

  val ors : string
 end

type typma =
| TNat of int
| TBool of bool
| TStr of string

val typma_rect :
  (int -> 'a1) -> (bool -> 'a1) -> (string -> 'a1) -> typma -> 'a1

val typma_rec :
  (int -> 'a1) -> (bool -> 'a1) -> (string -> 'a1) -> typma -> 'a1

type 'a total_map = string -> 'a

type state = typma total_map

val t_empty : 'a1 -> 'a1 total_map

val t_update : 'a1 total_map -> string -> 'a1 -> string -> 'a1

val to_nat : typma -> int

val to_bool : typma -> bool

val to_str : typma -> string

val typma_add : typma -> typma -> typma

val typma_minus : typma -> typma -> typma

val typma_mult : typma -> typma -> typma

val typma_div : typma -> typma -> typma

val typma_equal : typma -> typma -> typma

val typma_le : typma -> typma -> typma

val fact : int -> int

val typma_not : typma -> typma

val typma_and : typma -> typma -> typma

val typma_or : typma -> typma -> typma

type exp =
| ENat of int
| EBool of bool
| EStr of string
| EId of string
| EPlus of exp * exp
| EMinus of exp * exp
| EMult of exp * exp
| EDiv of exp * exp
| EEq of exp * exp
| ELe of exp * exp
| ENot of exp
| EAnd of exp * exp
| EOr of exp * exp

val exp_rect :
  (int -> 'a1) -> (bool -> 'a1) -> (string -> 'a1) -> (string -> 'a1) -> (exp
  -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp
  -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp
  -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp
  -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp
  -> 'a1 -> 'a1) -> exp -> 'a1

val exp_rec :
  (int -> 'a1) -> (bool -> 'a1) -> (string -> 'a1) -> (string -> 'a1) -> (exp
  -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp
  -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp
  -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp
  -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp
  -> 'a1 -> 'a1) -> exp -> 'a1

val exeval : state -> exp -> typma

type com =
| CSkip
| CAsgn of string * exp
| CSeq of com * com
| CIf of exp * com * com
| CWhile of exp * com

val com_rect :
  'a1 -> (string -> exp -> 'a1) -> (com -> 'a1 -> com -> 'a1 -> 'a1) -> (exp
  -> com -> 'a1 -> com -> 'a1 -> 'a1) -> (exp -> com -> 'a1 -> 'a1) -> com ->
  'a1

val com_rec :
  'a1 -> (string -> exp -> 'a1) -> (com -> 'a1 -> com -> 'a1 -> 'a1) -> (exp
  -> com -> 'a1 -> com -> 'a1 -> 'a1) -> (exp -> com -> 'a1 -> 'a1) -> com ->
  'a1

val ceval_step : state -> com -> int -> state option
