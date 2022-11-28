Set Warnings "-notation-overridden,-parsing,-deprecated-hint-without-locality".
From Coq Require Import Bool.Bool.
From Coq Require Import Init.Nat.
From Coq Require Import Arith.Arith.
From Coq Require Import Arith.EqNat. Import Nat.
From Coq Require Import Lia.
From Coq Require Import Lists.List. Import ListNotations.
Require TypmaEval.Sus.

(* the typma type that blends everything together*)
Inductive typma : Type :=
  | TNat (n : nat)
  | TBool (b : bool)
  | TStr (s : Sus.sus).

(* settting up map for later *)
Definition total_map (A : Type) := Sus.sus -> A.
Definition state := total_map typma.
Definition t_empty {A : Type} (v : A) : total_map A := (fun _ => v).
Definition t_update {A : Type} (m : total_map A) (x : Sus.sus) (v : A) :=
fun x' => if Sus.suseqb x x' then v else m x'.

(* conversion from any typma type to TNat *)
Definition to_nat (t : typma) : nat :=
  match t with
  | TNat n => n
  | TBool true => 1
  | TBool false => 0
  | TStr s => Sus.suslength s
  end.

(* conversion from any typma type to TBool *)
Definition to_bool (t : typma) : bool :=
  match t with
  | TNat n => (0 <? n)
  | TBool b => b
  | TStr s => (0 <? Sus.suslength s) 
  end.

(* conversion from any typma type to TStr *)
Definition to_str (t : typma) : Sus.sus :=
  match t with
  | TNat n => if (0 <? n) then Sus.no_succ else Sus.succ
  | TBool b =>
    match b with
    | false => Sus.fs
    | true => Sus.ts
    end
  | TStr s => s
  end.

(*conversion examples, asyemtirc , add optimizations, hore logic*)

(* system of math for typma addition *)
Definition typma_add (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TNat (n1 + n2)
  | TNat n, TBool b => TNat (n + to_nat t2)
  | TNat n, TStr s => TNat (n + to_nat t2)
  | TBool b, TNat n => TNat (n + to_nat t1)
  | TBool b1, TBool b2 => TNat (to_nat t1 + to_nat t2)
  | TBool b, TStr s => TStr (Sus.susappend (to_str t1) s)
  | TStr s, TNat n => TStr (Sus.susappend s (to_str t2))
  | TStr s, TBool b => TStr (Sus.susappend s (to_str t2))
  | TStr s1, TStr s2 => TStr (Sus.susappend s1 s2)
  end.

(* system of math for typma subtraction *)
Definition typma_minus (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TNat (n1 - n2)
  | TNat n, TBool b => TNat (n - to_nat t2)
  | TNat n, TStr s => TNat (n - to_nat t2)
  | TBool b, TNat n => TNat (to_nat t1 - n)
  | TBool b1, TBool b2 => TNat (to_nat t1 - to_nat t2)
  | TBool b, TStr s => TNat (to_nat t1 - to_nat t2)
  | TStr s, TNat n => TStr (Sus.sussub 0 (Sus.suslength s - n) s)
  | TStr s, TBool b => TNat (to_nat t1 - to_nat t2)
  | TStr s1, TStr s2 => TNat (to_nat t1 - to_nat t2)
end.

(* system of math for typma multiplication *)
Definition typma_mult (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TNat (n1 * n2)
  | TNat n, TBool b => TNat (n * to_nat t2)
  | TNat n, TStr s => TNat (n * to_nat t2)
  | TBool b, TNat n => TNat (n * to_nat t1)
  | TBool b1, TBool b2 => TNat (to_nat t1 * to_nat t2)
  | TBool b, TStr s => TNat (to_nat t1 * to_nat t2)
  | TStr s, TNat n => TStr (Sus.susappend s (Sus.susappend Sus.ms (to_str t2)))
  | TStr s, TBool b => TStr (Sus.susappend s (Sus.susappend Sus.ms (to_str t2)))
  | TStr s1, TStr s2 => TStr (Sus.susappend s1 (Sus.susappend Sus.ms s2))
end.

(* system of math for typma division proofs for interesting for weird div*)
Definition typma_div (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => if (n2 =? 0) then TStr Sus.pacer else TNat (n1 / n2)
  | TNat n, TBool false => TStr Sus.pacer
  | TNat n, TBool b => TNat (n / (to_nat (TBool b)))
  | TNat n, TStr s => if (0 <? Sus.suslength s) then TNat (n / (to_nat (TStr s))) else TStr Sus.pacer
  | TBool b, TNat n => if (n =? 0) then TStr Sus.pacer else TNat (n / (to_nat (TBool b)))
  | TBool b, TBool false => TStr Sus.pacer
  | TBool b1, TBool b2 => TNat ((to_nat (TBool b1)) / (to_nat (TBool b2)))
  | TBool b, TStr s => if (0 <? Sus.suslength s) then TNat ((to_nat (TBool b)) / (to_nat (TStr s))) else TStr Sus.pacer
  | TStr s, TNat n => if (n =? 0) then TStr Sus.pacer else TNat ((to_nat (TStr s)) / n)
  | TStr s, TBool false => TStr Sus.pacer
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
  | TBool b, TStr s => TBool (Bool.eqb b (to_bool (TStr s)))
  | TStr s, TNat n => TBool (to_nat (TStr s) =? n)
  | TStr s1, TStr s2 => TBool (Sus.suseqb s1 s2)
end.

Definition typma_le (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TBool (n1 <? n2)
  | TNat n, TBool b => TBool (n <? (to_nat (TBool b)))
  | TNat n, TStr s => TBool (n <? (to_nat (TStr s)))
  | TBool b, TNat n => TBool ((to_nat (TBool b)) <? n)
  | TBool b1, TBool b2 => TBool ((to_nat (TBool b1)) <? (to_nat (TBool b2)))
  | TBool b, TStr s => TBool ((to_nat (TStr (to_str (TBool b)))) <? (to_nat (TStr s)))
  | TStr s, TNat n => TBool (to_nat (TStr s) <? n)
  | TStr s, TBool b => TBool ((to_nat (TStr s)) <? (to_nat (TStr (to_str (TBool b)))))
  | TStr s1, TStr s2 => TBool ((to_nat (TStr s1)) <? (to_nat (TStr s2)))
end.

Fixpoint fact (n : nat) : nat :=
  match n with
  | 0 => S 0
  | S n' => n * fact (n')
  end.

Definition typma_not (t : typma) : typma :=
  match t with
  | TNat n => TNat (fact n)
  | TBool true => TBool false
  | TBool false => TBool true
  | TStr s => TStr (Sus.susappend Sus.ts s)
  end.

Definition typma_and (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TBool (to_bool (TNat n1) && to_bool (TNat n2))
  | TNat n, TBool b 
  | TBool b, TNat n => TBool (to_bool (TNat n) && b)
  | TNat n, TStr s 
  | TStr s, TNat n => TBool (to_bool (TNat n) && to_bool (TStr s))
  | TBool b1, TBool b2 => TBool (b1 && b2)
  | TBool b, TStr s => TStr (Sus.susappend (to_str (TBool b)) s)
  | TStr s, TBool b => TStr (Sus.susappend s (to_str (TBool b)))
  | TStr s1, TStr s2 => TStr (Sus.susappend s1 (Sus.susappend Sus.ands s2))
  end.

Definition typma_or (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TBool (to_bool (TNat n1) || to_bool (TNat n2))
  | TNat n, TBool b 
  | TBool b, TNat n => TBool (to_bool (TNat n) || b)
  | TNat n, TStr s 
  | TStr s, TNat n => TBool (to_bool (TNat n) || to_bool (TStr s))
  | TBool b1, TBool b2 => TBool (b1 || b2)
  | TBool b, TStr s
  | TStr s, TBool b => TBool (b || to_bool (TStr s))
  | TStr s1, TStr s2 => TStr (Sus.susappend s1 (Sus.susappend Sus.ors s2))
end.

(* syntax definition for exp *)
Inductive exp : Type :=
  | ENat (n : nat)
  | EBool (b : bool)
  | EStr (s : Sus.sus)
  | EId (x : Sus.sus)
  | EPlus (e1 e2 : exp)
  | EMinus (e1 e2 : exp)
  | EMult (e1 e2 : exp)
  | EDiv (e1 e2 : exp)
  | EEq (e1 e2 : exp)
  | ELe (e1 e2 : exp)
  | ENot (e : exp)
  | EAnd (e1 e2 : exp)
  | EOr (e1 e2 : exp).

(* function for evaulating expressions *)
Fixpoint exeval (st : state) (e : exp) : typma :=
  match e with
  | ENat n => TNat n
  | EBool b => TBool b
  | EStr x => TStr x
  | EId x => st x                                
  | EPlus e1 e2 => typma_add (exeval st e1) (exeval st e2)
  | EMinus e1 e2 => typma_minus (exeval st e1) (exeval st e2)
  | EMult e1 e2 => typma_mult (exeval st e1) (exeval st e2)
  | EDiv e1 e2 => typma_div (exeval st e1) (exeval st e2)
  | EEq e1 e2 => typma_equal (exeval st e1) (exeval st e2)
  | ELe e1 e2 => typma_le (exeval st e1) (exeval st e2)
  | ENot e => typma_not (exeval st e)
  | EAnd e1 e2 => typma_and (exeval st e1) (exeval st e2)
  | EOr e1 e2 => typma_or (exeval st e1) (exeval st e2)
  end.

Inductive exevalR : exp -> state -> typma -> Prop :=
  | E_ENat (n : nat) (st : state):
    exevalR (ENat n) st (TNat n)
  | E_EBool (b : bool) (st : state):
    exevalR (EBool b) st (TBool b)
  | E_EStr (s : Sus.sus) (st : state):
    exevalR (EStr s) st (TStr s)
  | E_EId (x : Sus.sus) (st : state):
    exevalR (EId x) st (st x)
  | E_EPlus (e1 e2 : exp) (t1 t2 : typma) (st : state)
  (H1 : exevalR e1 st t1) (H2 : exevalR e2 st t2):
    exevalR (EPlus e1 e2) st (typma_add t1 t2)
  | E_EMinus (e1 e2 : exp) (t1 t2 : typma) (st : state)
  (H1 : exevalR e1 st t1) (H2 : exevalR e2 st t2):
    exevalR (EMinus e1 e2) st (typma_minus t1 t2)
  | E_EMult (e1 e2 : exp) (t1 t2 : typma) (st : state)
  (H1 : exevalR e1 st t1) (H2 : exevalR e2 st t2):
    exevalR (EMult e1 e2) st (typma_mult t1 t2)
  | E_EDiv (e1 e2 : exp) (t1 t2 : typma) (st : state)
  (H1 : exevalR e1 st t1) (H2 : exevalR e2 st t2):
    exevalR (EDiv e1 e2) st (typma_div t1 t2)
  | E_EEq (e1 e2 : exp) (t1 t2 : typma) (st : state)
  (H1 : exevalR e1 st t1) (H2 : exevalR e2 st t2):
    exevalR (EEq e1 e2) st (typma_equal t1 t2)
  | E_ELe (e1 e2 : exp) (t1 t2 : typma) (st : state)
  (H1 : exevalR e1 st t1) (H2 : exevalR e2 st t2):
    exevalR (ELe e1 e2) st (typma_le t1 t2)
  | E_ENot (e : exp) (t : typma) (st : state)
  (H1 : exevalR e st t):
    exevalR (ENot e) st (typma_not t)
  | E_EAnd (e1 e2 : exp) (t1 t2 : typma) (st : state)
  (H1 : exevalR e1 st t1) (H2 : exevalR e2 st t2):
    exevalR (EAnd e1 e2) st (typma_and t1 t2)
  | E_EOr (e1 e2 : exp) (t1 t2 : typma) (st : state)
  (H1 : exevalR e1 st t1) (H2 : exevalR e2 st t2):
    exevalR (EOr e1 e2) st (typma_or t1 t2). 

Theorem exeval_iff_exevalR : forall e st t,
  (exevalR e st t) <-> exeval st e = t.
Proof.
  split.
  -intros H.
  induction H; simpl; subst; try reflexivity.
  -generalize dependent t0; induction e; simpl; intros; subst; try constructor;
  try (apply IHe1; reflexivity); try (apply IHe2; reflexivity); try (apply IHe; reflexivity).
Qed.

Inductive com : Type :=
  | CSkip
  | CAsgn (x : Sus.sus) (e : exp)
  | CPrint (e : exp)
  | CSeq (c1 c2 : com)
  | CIf (e : exp) (c1 c2 : com)
  | CWhile (e : exp) (c : com).

(*figure out print statement*)

Definition t_print {A : Type} (v : A) : total_map A := (fun _ => v).
Definition t_print' {A : Type} (v : A) : total_map A := (fun _ => v).

Inductive ceval : com -> state -> state -> Prop :=
  | E_Skip : forall st,
    ceval CSkip st st
  | E_Asgn : forall st e t x,
    exeval st e = t ->
    ceval (CAsgn x e) st (t_update st x t)
  | E_Print : forall st e t,
    exeval st e = t ->
    ceval (CPrint e) st (t_print t)
  | E_Seq : forall c1 c2 st st' st'',
    ceval c1 st st' ->
    ceval c2 st' st'' ->
    ceval (CSeq c1 c2) st st''
  | E_IfTrue : forall st st' t c1 c2,
    to_bool (exeval st t) = true ->
    ceval c1 st st' ->
    ceval (CIf t c1 c2) st st'
  | E_IfFalse : forall st st' t c1 c2,
    to_bool (exeval st t) = false ->
    ceval c2 st st' ->
    ceval (CIf t c1 c2) st st'
  | E_WhileFalse : forall t st c,
    to_bool (exeval st t) = false ->
    ceval (CWhile t c) st st
  | E_WhileTrue : forall st st' st'' t c,
    to_bool (exeval st t) = true ->
    ceval c st st' ->
    ceval (CWhile t c) st' st'' ->
    ceval (CWhile t c) st st''.

Fixpoint ceval_step (st : state) (c : com) (i : nat) : option state :=
match i with
  | O => None
  | S i' =>
  match c with
    | CSkip => 
    Some st
    | CAsgn l e1 =>
    Some (t_update st l (exeval st e1))
    | CPrint e =>
    Some (t_print (exeval st e))
    | CSeq c1 c2 =>
    match (ceval_step st c1 i') with
      | Some st' => ceval_step st' c2 i'
      | None => None
    end
  | CIf t c1 c2 =>
  if to_bool (exeval st t)
  then ceval_step st c1 i'
  else ceval_step st c2 i'
  | CWhile t1 c1 =>
  if to_bool (exeval st t1)
  then match (ceval_step st c1 i') with
  | Some st' => ceval_step st' c i'
  | None => None
  end
  else Some st
  end
end.

Theorem ceval_step__ceval: forall c st st',
  (exists i, ceval_step st c i = Some st') -> ceval c st st'.
Proof.
  intros c st st' H.
  inversion H as [i E].
  clear H.
  generalize dependent st'.
  generalize dependent st.
  generalize dependent c.
  induction i as [| i' ].
  -intros c st st' H. discriminate H.
  -intros c st st' H. destruct c;
         simpl in H; inversion H; subst; clear H.
    + (* skip *) apply E_Skip.
    + (* := *) apply E_Asgn. reflexivity.
    + apply E_Print. reflexivity.

    + (* ; *)
      destruct (ceval_step st c1 i') eqn:Heqr1.
      * (* Evaluation of r1 terminates normally *)
        apply E_Seq with s.
          apply IHi'. rewrite Heqr1. reflexivity.
          apply IHi'. assumption.
      * (* Otherwise -- contradiction *)
        discriminate H1.

    + (* if *)
      destruct (to_bool (exeval st e)) eqn:Heqr.
      * (* r = true *)
        apply E_IfTrue. rewrite Heqr. reflexivity.
        apply IHi'. assumption.
      * (* r = false *)
        apply E_IfFalse. rewrite Heqr. reflexivity.
        apply IHi'. assumption.

    + (* while *) destruct (to_bool (exeval st e)) eqn :Heqr.
      * (* r = true *)
       destruct (ceval_step st c i') eqn:Heqr1.
       { (* r1 = Some s *)
         apply E_WhileTrue with s. rewrite Heqr.
         reflexivity.
         apply IHi'. rewrite Heqr1. reflexivity.
         apply IHi'. assumption. }
       { (* r1 = None *) discriminate H1. }
      * (* r = false *)
        injection H1 as H2. rewrite <- H2.
        apply E_WhileFalse. apply Heqr.
Qed.

Theorem ceval_step_more: forall i1 i2 st st' c,
  i1 <= i2 ->
  ceval_step st c i1 = Some st' ->
  ceval_step st c i2 = Some st'.
Proof.
induction i1 as [|i1']; intros i2 st st' c Hle Hceval.
  - (* i1 = 0 *)
    simpl in Hceval. discriminate Hceval.
  - (* i1 = S i1' *)
    destruct i2 as [|i2']. inversion Hle.
    assert (Hle': i1' <= i2') by lia.
    destruct c.
    + (* skip *)
      simpl in Hceval. inversion Hceval.
      reflexivity.
    + (* := *)
      simpl in Hceval. inversion Hceval.
      reflexivity.
    +simpl in Hceval. inversion Hceval.
    reflexivity.
    + (* ; *)
      simpl in Hceval. simpl.
      destruct (ceval_step st c1 i1') eqn:Heqst1'o.
      * (* st1'o = Some *)
        apply (IHi1' i2') in Heqst1'o; try assumption.
        rewrite Heqst1'o. simpl. simpl in Hceval.
        apply (IHi1' i2') in Hceval; try assumption.
      * (* st1'o = None *)
        discriminate Hceval.

    + (* if *)
      simpl in Hceval. simpl.
      destruct (to_bool (exeval st e)); apply (IHi1' i2') in Hceval;
        assumption.

    + (* while *)
      simpl in Hceval. simpl.
      destruct (to_bool (exeval st e)); try assumption.
      destruct (ceval_step st c i1') eqn: Heqst1'o.
      * (* st1'o = Some *)
        apply (IHi1' i2') in Heqst1'o; try assumption.
        rewrite -> Heqst1'o. simpl. simpl in Hceval.
        apply (IHi1' i2') in Hceval; try assumption.
      * (* i1'o = None *)
        simpl in Hceval. discriminate Hceval. 
Qed.

Theorem ceval__ceval_step: forall c st st',
  ceval c st st' ->
  exists i, ceval_step st c i = Some st'.
Proof.
  intros c st st' Hce.
  induction Hce.
  -exists 1. reflexivity.
  -exists 1. simpl. rewrite H. reflexivity.
  (*print*)
  -exists 1. simpl. rewrite H. reflexivity.
  -destruct IHHce1. destruct IHHce2. exists (S (x + x0)). cbn.
  assert (H': x <= x + x0) by lia.
  pose proof ceval_step_more _ _ _ _ _ H' H. rewrite H1.
  assert (H'': x0 <= x + x0) by lia.
  pose proof ceval_step_more _ _ _ _ _ H'' H0. apply H2.
  -destruct IHHce. exists (S x). cbn. rewrite H. apply H0.
  -destruct IHHce. exists (S x). cbn. rewrite H. apply H0.
  -exists 1. simpl. rewrite H. reflexivity.
  -destruct IHHce1. destruct IHHce2. exists (S (x + x0)). cbn.
  rewrite H. assert (H': x <= x + x0) by lia. assert (H'': x0 <= x + x0) by lia.
  pose proof ceval_step_more _ _ _ _ _ H' H0. rewrite H2.
  pose proof ceval_step_more _ _ _ _ _ H'' H1. apply H3.
Qed.

Theorem ceval_and_ceval_step_coincide: forall c st st',
  ceval c st st'
  <-> exists i, ceval_step st c i = Some st'.
Proof.
  intros c st st'.
  split. apply ceval__ceval_step. apply ceval_step__ceval.
Qed.

Theorem ceval_deterministic' : forall c st st1 st2,
  ceval c st st1 ->
  ceval c st st2 ->
  st1 = st2.
Proof.
  intros c st st1 st2 He1 He2.
  apply ceval__ceval_step in He1.
  apply ceval__ceval_step in He2.
  inversion He1 as [i1 E1].
  inversion He2 as [i2 E2].
  apply ceval_step_more with (i2 := i1 + i2) in E1.
  apply ceval_step_more with (i2 := i1 + i2) in E2.
  rewrite E1 in E2. inversion E2. reflexivity.
  lia. lia.  Qed.