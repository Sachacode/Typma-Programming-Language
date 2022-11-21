open Bool
open Nat
open String

module Pacer =
 struct
  (** val pacer : string **)

  let pacer =
    "The FitnessGram Pacer Test is a multistage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in 30 seconds. Line up at the start. The running speed starts slowly, but gets faster each minute after you hear this signal. [beep] A single lap should be completed each time you hear this sound. [ding] Remember to run in a straight line, and run as long as possible. The second time you fail to complete a lap before the sound, your test is over. The test will begin on the word start. On your mark, get ready, start."

  (** val succ : string **)

  let succ =
    "succ"

  (** val no_succ : string **)

  let no_succ =
    "no succ"

  (** val fs : string **)

  let fs =
    "false"

  (** val ts : string **)

  let ts =
    "true"

  (** val ms : string **)

  let ms =
    "star"

  (** val nots : string **)

  let nots =
    "!"

  (** val ands : string **)

  let ands =
    "&&"

  (** val ors : string **)

  let ors =
    "||"
 end

type typma =
| TNat of int
| TBool of bool
| TStr of string

(** val typma_rect :
    (int -> 'a1) -> (bool -> 'a1) -> (string -> 'a1) -> typma -> 'a1 **)

let typma_rect f f0 f1 = function
| TNat x -> f x
| TBool x -> f0 x
| TStr x -> f1 x

(** val typma_rec :
    (int -> 'a1) -> (bool -> 'a1) -> (string -> 'a1) -> typma -> 'a1 **)

let typma_rec f f0 f1 = function
| TNat x -> f x
| TBool x -> f0 x
| TStr x -> f1 x

type 'a total_map = string -> 'a

type state = typma total_map

(** val t_empty : 'a1 -> 'a1 total_map **)

let t_empty v _ =
  v

(** val t_update : 'a1 total_map -> string -> 'a1 -> string -> 'a1 **)

let t_update m x v x' =
  if (=) x x' then v else m x'

(** val to_nat : typma -> int **)

let to_nat = function
| TNat n -> n
| TBool b -> if b then Pervasives.succ 0 else 0
| TStr s -> length s

(** val to_bool : typma -> bool **)

let to_bool = function
| TNat n -> ltb 0 n
| TBool b -> b
| TStr s -> ltb 0 (length s)

(** val to_str : typma -> string **)

let to_str = function
| TNat n -> if ltb 0 n then Pacer.no_succ else Pacer.succ
| TBool b -> if b then Pacer.ts else Pacer.fs
| TStr s -> s

(** val typma_add : typma -> typma -> typma **)

let typma_add t1 t2 =
  match t1 with
  | TNat n ->
    (match t2 with
     | TNat n2 -> TNat (add n n2)
     | _ -> TNat (add n (to_nat t2)))
  | TBool _ ->
    (match t2 with
     | TNat n -> TNat (add n (to_nat t1))
     | TBool _ -> TNat (add (to_nat t1) (to_nat t2))
     | TStr s -> TStr ((^) (to_str t1) s))
  | TStr s1 ->
    (match t2 with
     | TStr s2 -> TStr ((^) s1 s2)
     | _ -> TStr ((^) s1 (to_str t2)))

(** val typma_minus : typma -> typma -> typma **)

let typma_minus t1 t2 =
  match t1 with
  | TNat n ->
    (match t2 with
     | TNat n2 -> TNat (sub n n2)
     | _ -> TNat (sub n (to_nat t2)))
  | TBool _ ->
    (match t2 with
     | TNat n -> TNat (sub (to_nat t1) n)
     | _ -> TNat (sub (to_nat t1) (to_nat t2)))
  | TStr s1 ->
    (match t2 with
     | TNat n -> TStr (substring 0 (sub (length s1) n) s1)
     | _ -> TNat (sub (to_nat t1) (to_nat t2)))

(** val typma_mult : typma -> typma -> typma **)

let typma_mult t1 t2 =
  match t1 with
  | TNat n ->
    (match t2 with
     | TNat n2 -> TNat (mul n n2)
     | _ -> TNat (mul n (to_nat t2)))
  | TBool _ ->
    (match t2 with
     | TNat n -> TNat (mul n (to_nat t1))
     | _ -> TNat (mul (to_nat t1) (to_nat t2)))
  | TStr s1 ->
    (match t2 with
     | TStr s2 -> TStr ((^) s1 ((^) Pacer.ms s2))
     | _ -> TStr ((^) s1 ((^) Pacer.ms (to_str t2))))

(** val typma_div : typma -> typma -> typma **)

let typma_div t1 t2 =
  match t1 with
  | TNat n ->
    (match t2 with
     | TNat n2 -> if eqb n2 0 then TStr Pacer.pacer else TNat (div n n2)
     | TBool b ->
       if b then TNat (div n (to_nat (TBool b))) else TStr Pacer.pacer
     | TStr s ->
       if ltb 0 (length s)
       then TNat (div n (to_nat (TStr s)))
       else TStr Pacer.pacer)
  | TBool b ->
    (match t2 with
     | TNat n ->
       if eqb n 0 then TStr Pacer.pacer else TNat (div n (to_nat (TBool b)))
     | TBool b2 ->
       if b2
       then TNat (div (to_nat (TBool b)) (to_nat (TBool b2)))
       else TStr Pacer.pacer
     | TStr s ->
       if ltb 0 (length s)
       then TNat (div (to_nat (TBool b)) (to_nat (TStr s)))
       else TStr Pacer.pacer)
  | TStr s1 ->
    (match t2 with
     | TNat n ->
       if eqb n 0 then TStr Pacer.pacer else TNat (div (to_nat (TStr s1)) n)
     | TBool b ->
       if b
       then TNat (div (to_nat (TStr s1)) (to_nat (TBool b)))
       else TStr Pacer.pacer
     | TStr s2 -> TNat (div (to_nat (TStr s1)) (to_nat (TStr s2))))

(** val typma_equal : typma -> typma -> typma **)

let typma_equal t1 t2 =
  match t1 with
  | TNat n ->
    (match t2 with
     | TNat n2 -> TBool (eqb n n2)
     | TBool b -> TBool (Bool.eqb (to_bool (TNat n)) b)
     | TStr s -> TBool (eqb n (to_nat (TStr s))))
  | TBool b ->
    (match t2 with
     | TNat n -> TBool (Bool.eqb (to_bool (TNat n)) b)
     | TBool b2 -> TBool (Bool.eqb b b2)
     | TStr s -> TBool (Bool.eqb b (to_bool (TStr s))))
  | TStr s1 ->
    (match t2 with
     | TNat n -> TBool (eqb (to_nat (TStr s1)) n)
     | TBool b -> TBool (Bool.eqb b (to_bool (TStr s1)))
     | TStr s2 -> TBool ((=) s1 s2))

(** val typma_le : typma -> typma -> typma **)

let typma_le t1 t2 =
  match t1 with
  | TNat n ->
    (match t2 with
     | TNat n2 -> TBool (ltb n n2)
     | x -> TBool (ltb n (to_nat x)))
  | TBool b ->
    (match t2 with
     | TNat n -> TBool (ltb (to_nat (TBool b)) n)
     | TBool b2 -> TBool (ltb (to_nat (TBool b)) (to_nat (TBool b2)))
     | TStr s ->
       TBool (ltb (to_nat (TStr (to_str (TBool b)))) (to_nat (TStr s))))
  | TStr s1 ->
    (match t2 with
     | TNat n -> TBool (ltb (to_nat (TStr s1)) n)
     | TBool b ->
       TBool (ltb (to_nat (TStr s1)) (to_nat (TStr (to_str (TBool b)))))
     | TStr s2 -> TBool (ltb (to_nat (TStr s1)) (to_nat (TStr s2))))

(** val fact : int -> int **)

let rec fact n =
  (fun fO fS n -> if n=0 then fO () else fS (n-1))
    (fun _ -> Pervasives.succ 0)
    (fun n' -> mul n (fact n'))
    n

(** val typma_not : typma -> typma **)

let typma_not = function
| TNat n -> TNat (fact n)
| TBool b -> if b then TBool false else TBool true
| TStr s -> TStr ((^) Pacer.ts s)

(** val typma_and : typma -> typma -> typma **)

let typma_and t1 t2 =
  match t1 with
  | TNat n ->
    (match t2 with
     | TBool b -> TBool ((&&) (to_bool (TNat n)) b)
     | x -> TBool ((&&) (to_bool (TNat n)) (to_bool x)))
  | TBool b ->
    (match t2 with
     | TNat n -> TBool ((&&) (to_bool (TNat n)) b)
     | TBool b2 -> TBool ((&&) b b2)
     | TStr s -> TStr ((^) (to_str (TBool b)) s))
  | TStr s1 ->
    (match t2 with
     | TNat n -> TBool ((&&) (to_bool (TNat n)) (to_bool (TStr s1)))
     | TBool b -> TStr ((^) s1 (to_str (TBool b)))
     | TStr s2 -> TStr ((^) s1 ((^) Pacer.ands s2)))

(** val typma_or : typma -> typma -> typma **)

let typma_or t1 t2 =
  match t1 with
  | TNat n ->
    (match t2 with
     | TBool b -> TBool ((||) (to_bool (TNat n)) b)
     | x -> TBool ((||) (to_bool (TNat n)) (to_bool x)))
  | TBool b ->
    (match t2 with
     | TNat n -> TBool ((||) (to_bool (TNat n)) b)
     | TBool b2 -> TBool ((||) b b2)
     | TStr s -> TBool ((||) b (to_bool (TStr s))))
  | TStr s1 ->
    (match t2 with
     | TNat n -> TBool ((||) (to_bool (TNat n)) (to_bool (TStr s1)))
     | TBool b -> TBool ((||) b (to_bool (TStr s1)))
     | TStr s2 -> TStr ((^) s1 ((^) Pacer.ors s2)))

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

(** val exp_rect :
    (int -> 'a1) -> (bool -> 'a1) -> (string -> 'a1) -> (string -> 'a1) ->
    (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) ->
    (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) ->
    (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) ->
    (exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1
    -> exp -> 'a1 -> 'a1) -> exp -> 'a1 **)

let rec exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 = function
| ENat n -> f n
| EBool b -> f0 b
| EStr s -> f1 s
| EId x -> f2 x
| EPlus (e1, e2) ->
  f3 e1 (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| EMinus (e1, e2) ->
  f4 e1 (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| EMult (e1, e2) ->
  f5 e1 (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| EDiv (e1, e2) ->
  f6 e1 (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| EEq (e1, e2) ->
  f7 e1 (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| ELe (e1, e2) ->
  f8 e1 (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| ENot e0 -> f9 e0 (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e0)
| EAnd (e1, e2) ->
  f10 e1 (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| EOr (e1, e2) ->
  f11 e1 (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rect f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)

(** val exp_rec :
    (int -> 'a1) -> (bool -> 'a1) -> (string -> 'a1) -> (string -> 'a1) ->
    (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) ->
    (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) ->
    (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) ->
    (exp -> 'a1 -> 'a1) -> (exp -> 'a1 -> exp -> 'a1 -> 'a1) -> (exp -> 'a1
    -> exp -> 'a1 -> 'a1) -> exp -> 'a1 **)

let rec exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 = function
| ENat n -> f n
| EBool b -> f0 b
| EStr s -> f1 s
| EId x -> f2 x
| EPlus (e1, e2) ->
  f3 e1 (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| EMinus (e1, e2) ->
  f4 e1 (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| EMult (e1, e2) ->
  f5 e1 (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| EDiv (e1, e2) ->
  f6 e1 (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| EEq (e1, e2) ->
  f7 e1 (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| ELe (e1, e2) ->
  f8 e1 (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| ENot e0 -> f9 e0 (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e0)
| EAnd (e1, e2) ->
  f10 e1 (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)
| EOr (e1, e2) ->
  f11 e1 (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e1) e2
    (exp_rec f f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 e2)

(** val exeval : state -> exp -> typma **)

let rec exeval st = function
| ENat n -> TNat n
| EBool b -> TBool b
| EStr x -> TStr x
| EId x -> st x
| EPlus (e1, e2) -> typma_add (exeval st e1) (exeval st e2)
| EMinus (e1, e2) -> typma_minus (exeval st e1) (exeval st e2)
| EMult (e1, e2) -> typma_mult (exeval st e1) (exeval st e2)
| EDiv (e1, e2) -> typma_div (exeval st e1) (exeval st e2)
| EEq (e1, e2) -> typma_equal (exeval st e1) (exeval st e2)
| ELe (e1, e2) -> typma_le (exeval st e1) (exeval st e2)
| ENot e0 -> typma_not (exeval st e0)
| EAnd (e1, e2) -> typma_and (exeval st e1) (exeval st e2)
| EOr (e1, e2) -> typma_or (exeval st e1) (exeval st e2)

type com =
| CSkip
| CAsgn of string * exp
| CSeq of com * com
| CIf of exp * com * com
| CWhile of exp * com

(** val com_rect :
    'a1 -> (string -> exp -> 'a1) -> (com -> 'a1 -> com -> 'a1 -> 'a1) ->
    (exp -> com -> 'a1 -> com -> 'a1 -> 'a1) -> (exp -> com -> 'a1 -> 'a1) ->
    com -> 'a1 **)

let rec com_rect f f0 f1 f2 f3 = function
| CSkip -> f
| CAsgn (x, e) -> f0 x e
| CSeq (c1, c2) ->
  f1 c1 (com_rect f f0 f1 f2 f3 c1) c2 (com_rect f f0 f1 f2 f3 c2)
| CIf (e, c1, c2) ->
  f2 e c1 (com_rect f f0 f1 f2 f3 c1) c2 (com_rect f f0 f1 f2 f3 c2)
| CWhile (e, c0) -> f3 e c0 (com_rect f f0 f1 f2 f3 c0)

(** val com_rec :
    'a1 -> (string -> exp -> 'a1) -> (com -> 'a1 -> com -> 'a1 -> 'a1) ->
    (exp -> com -> 'a1 -> com -> 'a1 -> 'a1) -> (exp -> com -> 'a1 -> 'a1) ->
    com -> 'a1 **)

let rec com_rec f f0 f1 f2 f3 = function
| CSkip -> f
| CAsgn (x, e) -> f0 x e
| CSeq (c1, c2) ->
  f1 c1 (com_rec f f0 f1 f2 f3 c1) c2 (com_rec f f0 f1 f2 f3 c2)
| CIf (e, c1, c2) ->
  f2 e c1 (com_rec f f0 f1 f2 f3 c1) c2 (com_rec f f0 f1 f2 f3 c2)
| CWhile (e, c0) -> f3 e c0 (com_rec f f0 f1 f2 f3 c0)

(** val ceval_step : state -> com -> int -> state option **)

let rec ceval_step st c i =
  (fun fO fS n -> if n=0 then fO () else fS (n-1))
    (fun _ -> None)
    (fun i' ->
    match c with
    | CSkip -> Some st
    | CAsgn (l, e1) -> Some (t_update st l (exeval st e1))
    | CSeq (c1, c2) ->
      (match ceval_step st c1 i' with
       | Some st' -> ceval_step st' c2 i'
       | None -> None)
    | CIf (t, c1, c2) ->
      if to_bool (exeval st t)
      then ceval_step st c1 i'
      else ceval_step st c2 i'
    | CWhile (t1, c1) ->
      if to_bool (exeval st t1)
      then (match ceval_step st c1 i' with
            | Some st' -> ceval_step st' c i'
            | None -> None)
      else Some st)
    i
