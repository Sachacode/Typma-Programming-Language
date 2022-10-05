Section Typma.

Set Warnings "-notation-overridden,-parsing,-deprecated-hint-without-locality".
From Coq Require Import Bool.Bool.
From Coq Require Import Init.Nat.
From Coq Require Import Arith.Arith.
From Coq Require Import Arith.EqNat. Import Nat.
From Coq Require Import Lia.
From Coq Require Import Lists.List. Import ListNotations.
From Coq Require Import Strings.String.

(* the typma type that blends everything together*)
Inductive typma : Type :=
  | TNat (n : nat)
  | TBool (b : bool)
  | TStr (s : string).

(* settting up map for later *)
Definition total_map (A : Type) := string -> A.
Definition state := total_map typma.

(* conversion from any typma type to the TNat *)
Definition to_nat (t : typma) : nat :=
  match t with
  | TNat n => n
  | TBool b =>
    match b with
    | true => 1
    | false => 0
    end
  | TStr s => length s
  end.

(* conversion from any typma type to the TBool *)
Definition to_bool (t : typma) : bool :=
  match t with
  | TNat n =>
    match n with
    | 0 => false
    | _ => true
    end
  | TBool b => b
  | TStr s =>
    match s with
    | EmptyString => false
    | _ => true
    end
  end.

(* conversion from any typma type to the TStr *)
Definition to_str (t : typma) : string :=
  match t with
  | TNat n => "natural"
  | TBool b =>
    match b with
    | false => "false"
    | true => "true"
    end
  | TStr s => s
  end.

(* system of math for typma addition *)
Definition typma_add (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TNat (n1 + n2)
  | TNat n, TBool b => TNat (n + (to_nat (TBool b)))
  | TNat n, TStr s => TNat (n + (to_nat (TStr s)))
  | TBool b, TNat n => TNat (n + (to_nat (TBool b)))
  | TBool b1, TBool b2 => TNat ((to_nat (TBool b1)) + (to_nat (TBool b2)))
  | TBool b, TStr s => TStr ((to_str (TBool b)) ++ s)
  | TStr s, TNat n => TStr (s ++ (to_str (TNat n)))
  | TStr s, TBool b => TStr (s ++ (to_str (TBool b)))
  | TStr s1, TStr s2 => TStr (s1 ++ s2)
  end.

(* system of math for typma subtraction *)
Definition typma_minus (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TNat (n1 - n2)
  | TNat n, TBool b => TNat (n - (to_nat (TBool b)))
  | TNat n, TStr s => TNat (n - (to_nat (TStr s)))
  | TBool b, TNat n => TNat (n - (to_nat (TBool b)))
  | TBool b1, TBool b2 => TNat ((to_nat (TBool b1)) - (to_nat (TBool b2)))
  | TBool b, TStr s => TNat ((to_nat (TBool b)) - (to_nat (TStr s)))
  | TStr s, TNat n => TStr (substring 0 ((length s) - n) s)
  | TStr s, TBool b => TNat ((to_nat (TStr s)) - (to_nat (TBool b)))
  | TStr s1, TStr s2 => TNat ((to_nat (TStr s1)) - (to_nat (TStr s2)))
  end.

Definition typma_mult (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TNat (n1 * n2)
  | TNat n, TBool b => TNat (n * (to_nat (TBool b)))
  | TNat n, TStr s => TNat (n * (to_nat (TStr s)))
  | TBool b, TNat n => TNat (n * (to_nat (TBool b)))
  | TBool b1, TBool b2 => TNat ((to_nat (TBool b1)) * (to_nat (TBool b2)))
  | TBool b, TStr s => TNat ((to_nat (TBool b)) * (to_nat (TStr s)))
  | TStr s, TNat n => TStr s (* repeated str add here *)
  | TStr s, TBool b => TNat ((to_nat (TStr s)) * (to_nat (TBool b)))
  | TStr s1, TStr s2 => TNat ((to_nat (TStr s1)) * (to_nat (TStr s2)))
  end.

Definition typma_div (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n, TNat 0 => TStr ";)"
  | TNat n1, TNat n2 => TNat (n1 / n2)
  | TNat n, TBool false => TStr ";)"
  | TNat n, TBool b => TNat (n / (to_nat (TBool b)))
  | TNat n, TStr "" => TStr ";)"
  | TNat n, TStr s => TNat (n / (to_nat (TStr s)))
  | TBool b, TNat 0 => TStr ";)"
  | TBool b, TNat n => TNat (n / (to_nat (TBool b)))
  | TBool b, TBool false => TStr ";)"
  | TBool b1, TBool b2 => TNat ((to_nat (TBool b1)) / (to_nat (TBool b2)))
  | TBool b, TStr "" => TStr ";)"
  | TBool b, TStr s => TNat ((to_nat (TBool b)) / (to_nat (TStr s)))
  | TStr s, TNat 0 => TStr ";)"
  | TStr s, TNat n => TNat ((to_nat (TStr s)) / n)
  | TStr s, TBool false => TStr ";)"
  | TStr s, TBool b => TNat ((to_nat (TStr s)) / (to_nat (TBool b)))
  | TStr s1, TStr s2 => TNat ((to_nat (TStr s1)) / (to_nat (TStr s2)))
  end.

Definition typma_equal (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TBool (n1 =? n2)
  | TNat n, TBool b 
  | TBool b, TNat n => TBool (Bool.eqb (to_bool (TNat n)) b)
  | TNat n, TStr s => TBool (n =? (to_nat (TStr s)))
  | TBool b1, TBool b2 => TBool (Bool.eqb b1 b2)
  | TStr s, TBool b
  | TBool b, TStr s => TBool (String.eqb (to_str (TBool b)) s)
  | TStr s, TNat n => TBool (to_nat (TStr s) =? n)
  | TStr s1, TStr s2 => TBool (String.eqb s1 s2)
  end.

Definition typma_le (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TBool (n1 <? n2)
  | TNat n, TBool b => TBool (Bool.eqb (to_bool (TNat n)) b)
  | TNat n, TStr s => TBool (n =? (to_nat (TStr s)))
  | TBool b1, TBool b2 => TBool (Bool.eqb b1 b2)
  | TStr s, TBool b
  | TBool b, TStr s => TBool (String.eqb (to_str (TBool b)) s)
  | TStr s, TNat n => TBool (to_nat (TStr s) =? n)
  | TStr s1, TStr s2 => TBool (String.eqb s1 s2)
  end.

Definition typma_not (t : typma) : typma :=
  match t with

Definition typma_and (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TBool (n1 =? n2)
  | TNat n, TBool b 
  | TBool b, TNat n => TBool (Bool.eqb (to_bool (TNat n)) b)
  | TNat n, TStr s => TBool (n =? (to_nat (TStr s)))
  | TBool b1, TBool b2 => TBool (Bool.eqb b1 b2)
  | TStr s, TBool b
  | TBool b, TStr s => TBool (String.eqb (to_str (TBool b)) s)
  | TStr s, TNat n => TBool (to_nat (TStr s) =? n)
  | TStr s1, TStr s2 => TBool (String.eqb s1 s2)
  end.

(* syntax definition for aexp *)
Inductive aexp : Type :=
  | ANat (n : nat)
  | ABool (b : bool)
  | AStr (x : string)
  | AId (x : string)
  | APlus (a1 a2 : aexp)
  | AMinus (a1 a2 : aexp)
  | AMult (a1 a2 : aexp)
  | ADiv (a1 a2 : aexp).

(* syntax definition for bexp *)
Inductive bexp : Type :=
  | BTrue
  | BFalse
  | BNat (n : nat)
  | BStr (x : string)
  | BEq (a1 a2 : aexp)
  | BLe (a1 a2 : aexp)
  | BNot (b : bexp)
  | BAnd (b1 b2 : bexp).

(* function for evaulating arithmatic expressions *)
Fixpoint aeval (st : state) (a : aexp) : typma :=
  match a with
  | ANat n => TNat n
  | ABool b => TBool b
  | AStr x => TStr x
  | AId x => st x                                
  | APlus a1 a2 => typma_add (aeval st a1) (aeval st a2)
  | AMinus a1 a2 => typma_minus (aeval st a1) (aeval st a2)
  | AMult a1 a2 => typma_mult (aeval st a1) (aeval st a2)
  | ADiv a1 a2 => typma_div (aeval st a1) (aeval st a2)
  end.

End Typma.