Section Test.

Set Warnings "-notation-overridden,-parsing,-deprecated-hint-without-locality".
From Coq Require Import Bool.Bool.
From Coq Require Import Init.Nat.
From Coq Require Import Arith.Arith.
From Coq Require Import Arith.EqNat. Import Nat.
From Coq Require Import Lia.
From Coq Require Import Lists.List. Import ListNotations.
From Coq Require Import Strings.String.


(* settting up map for later *)
Definition total_map (A : Type) := string -> A.
Definition state := total_map nat.

(* set of variable keywords for ease *)
Definition W : string := "W".
Definition X : string := "X".
Definition Y : string := "Y".
Definition Z : string := "Z".

(* syntax definition for aexp *)
Inductive aexp : Type :=
  | ANum (n : nat)
  | AId (x : string)
  | APlus (a1 a2 : aexp)
  | AMinus (a1 a2 : aexp)
  | AMult (a1 a2 : aexp).

(* synatx definition for bexp *)
Inductive bexp : Type :=
  | BTrue
  | BFalse
  | BEq (a1 a2 : aexp)
  | BLe (a1 a2 : aexp)
  | BNot (b : bexp)
  | BAnd (b1 b2 : bexp).

(* various symbols for ease of proofs *)

Coercion AId : string >-> aexp.
Coercion ANum : nat >-> aexp.

Declare Custom Entry com.
Declare Scope com_scope.
Notation "<{ e }>" := e (at level 0, e custom com at level 99) : com_scope.
Notation "( x )" := x (in custom com, x at level 99) : com_scope.
Notation "x" := x (in custom com at level 0, x constr at level 0) : com_scope.
Notation "f x .. y" := (.. (f x) .. y)
                  (in custom com at level 0, only parsing,
                  f constr at level 0, x constr at level 9,
                  y constr at level 9) : com_scope.
Notation "x + y" := (APlus x y) (in custom com at level 50, left associativity).
Notation "x - y" := (AMinus x y) (in custom com at level 50, left associativity).
Notation "x * y" := (AMult x y) (in custom com at level 40, left associativity).
Notation "'true'"  := true (at level 1).
Notation "'true'"  := BTrue (in custom com at level 0).
Notation "'false'"  := false (at level 1).
Notation "'false'"  := BFalse (in custom com at level 0).
Notation "x <= y" := (BLe x y) (in custom com at level 70, no associativity).
Notation "x = y"  := (BEq x y) (in custom com at level 70, no associativity).
Notation "x && y" := (BAnd x y) (in custom com at level 80, left associativity).
Notation "'~' b"  := (BNot b) (in custom com at level 75, right associativity).

Open Scope com_scope.

(* function for evaulating arithmatic expressions *)
Fixpoint aeval (st : state) (a : aexp) : nat :=
  match a with
  | ANum n => n
  | AId x => st x                                
  | <{a1 + a2}> => (aeval st a1) + (aeval st a2)
  | <{a1 - a2}> => (aeval st a1) - (aeval st a2)
  | <{a1 * a2}> => (aeval st a1) * (aeval st a2)
  end.

(* function for evaluaing boolean expressions *)
Fixpoint beval (st : state) (b : bexp) : bool :=
  match b with
  | <{true}>      => true
  | <{false}>     => false
  | <{a1 = a2}>   => (aeval st a1) =? (aeval st a2)
  | <{a1 <= a2}>  => (aeval st a1) <=? (aeval st a2)
  | <{~ b1}>      => negb (beval st b1)
  | <{b1 && b2}>  => andb (beval st b1) (beval st b2)
  end.

(* convienent notation for aveal function call *)
Reserved Notation "e '==>' n" (at level 90, left associativity).

Inductive aevalR : aexp -> state -> nat -> Prop :=
  | E_ANum (n : nat) (st : state) :
      st (ANum n) ==> n
  | E_AId (a : aexp) (st : state) :
      (AId a) ==> st x
  | E_APlus (e1 e2 : aexp) (n1 n2 : nat) (st : state) :
      (e1 ==> n1) -> (e2 ==> n2) -> (APlus e1 e2)  ==> (n1 + n2)
  | E_AMinus (e1 e2 : aexp) (n1 n2 : nat) (st : state) :
      (e1 ==> n1) -> (e2 ==> n2) -> (AMinus e1 e2) ==> (n1 - n2)
  | E_AMult (e1 e2 : aexp) (n1 n2 : nat) (st : state) :
      (e1 ==> n1) -> (e2 ==> n2) -> (AMult e1 e2)  ==> (n1 * n2)

  where "e '==>' n" := (aevalR e n) : type_scope.

Theorem aeval_iff_aevalR : forall a n,
  (a ==> n) <-> aeval a = n.
Proof.
  split.
  - (* -> *)
    intros H; induction H; subst; reflexivity.
  - (* <- *)
    generalize dependent n.
    induction a; simpl; intros; subst; constructor;
       try apply IHa1; try apply IHa2; reflexivity.
Qed.

Reserved Notation "e '==>b' b" (at level 90, left associativity).

Inductive bevalR: bexp -> bool -> Prop :=
| E_BTrue :
  BTrue ==>b true
| E_BFalse :
  BFalse ==>b false
| E_BEq (e1 e2 : aexp) (n1 n2 : nat) :
  (e1 ==> n1) -> (e2 ==> n2) -> BEq e1 e2 ==>b n1 =? n2
| E_BLe (e1 e2 : aexp) (n1 n2 : nat) :
  (e1 ==> n1) -> (e2 ==> n2) -> BLe e1 e2 ==>b n1 <=? n2
| E_BNot (e : bexp) (b : bool) :
  (e ==>b b) -> (BNot e ==>b negb b)
| E_BAnd (e1 e2 : bexp) (n1 n2 : bool) :
  (e1 ==>b n1) -> (e2 ==>b n2) -> (BAnd e1 e2) ==>b (n1 && n2)

where "e '==>b' b" := (bevalR e b) : type_scope.

Lemma beval_iff_bevalR : forall b bv,
  b ==>b bv <-> beval b = bv.
Proof.
    split.
    -intros H; induction H; subst; try reflexivity;
    try apply aeval_iff_aevalR in H; apply aeval_iff_aevalR in H0; try subst;
    try reflexivity.
    -generalize dependent bv; induction b; simpl; intros; subst;
    try constructor; try apply aeval_iff_aevalR; try apply IHb; 
    try apply IHb1; try apply IHb2; reflexivity.
Qed.

Inductive com : Type :=
  | CSkip
  | CAsgn (x : string) (a : aexp)
  | CSeq (c1 c2 : com)
  | CIf (b : bexp) (c1 c2 : com)
  | CWhile (b : bexp) (c : com).

Notation "'skip'"  := CSkip (in custom com at level 0) : com_scope.
Notation "x := y"  :=
    (CAsgn x y)
       (in custom com at level 0, x constr at level 0,
        y at level 85, no associativity) : com_scope.
Notation "x ; y" :=
    (CSeq x y)
      (in custom com at level 90, right associativity) : com_scope.
Notation "'if' x 'then' y 'else' z 'end'" :=
    (CIf x y z)
      (in custom com at level 89, x at level 99,
       y at level 99, z at level 99) : com_scope.
Notation "'while' x 'do' y 'end'" :=
    (CWhile x y)
       (in custom com at level 89, x at level 99, y at level 99) : com_scope.

End Test.