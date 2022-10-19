Section Typma.

Set Warnings "-notation-overridden,-parsing,-deprecated-hint-without-locality".
From Coq Require Import Bool.Bool.
From Coq Require Import Init.Nat.
From Coq Require Import Arith.Arith.
From Coq Require Import Arith.EqNat. Import Nat.
From Coq Require Import Lia.
From Coq Require Import Lists.List. Import ListNotations.
From Coq Require Import Strings.String.

Definition pacer: string := "The FitnessGram Pacer Test is a multistage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in 30 seconds. Line up at the start. The running speed starts slowly, but gets faster each minute after you hear this signal. [beep] A single lap should be completed each time you hear this sound. [ding] Remember to run in a straight line, and run as long as possible. The second time you fail to complete a lap before the sound, your test is over. The test will begin on the word start. On your mark, get ready, start.".

(* the typma type that blends everything together*)
Inductive typma : Type :=
  | TNat (n : nat)
  | TBool (b : bool)
  | TStr (s : string).

(* settting up map for later *)
Definition total_map (A : Type) := string -> A.
Definition state := total_map typma.

(* conversion from any typma type to TNat *)
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

(* conversion from any typma type to TBool *)
Definition to_bool (t : typma) : bool :=
  match t with
  | TNat n =>
    match n with
    | 0 => false
    | _ => true
    end
  | TBool b => b
  | TStr "false" => false
  | TStr s =>
    match s with
    | EmptyString => false
    | _ => true
    end
  end.

(* conversion from any typma type to TStr *)
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

(* system of math for typma multiplication *)
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

(* system of math for typma division *)
Definition typma_div (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n, TNat 0 => TStr pacer
  | TNat n1, TNat n2 => TNat (n1 / n2)
  | TNat n, TBool false => TStr pacer
  | TNat n, TBool b => TNat (n / (to_nat (TBool b)))
  | TNat n, TStr "" => TStr pacer
  | TNat n, TStr s => TNat (n / (to_nat (TStr s)))
  | TBool b, TNat 0 => TStr pacer
  | TBool b, TNat n => TNat (n / (to_nat (TBool b)))
  | TBool b, TBool false => TStr pacer
  | TBool b1, TBool b2 => TNat ((to_nat (TBool b1)) / (to_nat (TBool b2)))
  | TBool b, TStr "" => TStr pacer
  | TBool b, TStr s => TNat ((to_nat (TBool b)) / (to_nat (TStr s)))
  | TStr s, TNat 0 => TStr pacer
  | TStr s, TNat n => TNat ((to_nat (TStr s)) / n)
  | TStr s, TBool false => TStr pacer
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
  | TStr s => TStr ("!" ++ s)
  end.

Definition typma_and (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TBool (to_bool (TNat n1) && to_bool (TNat n2))
  | TNat n, TBool b 
  | TBool b, TNat n => TBool (to_bool (TNat n) && b)
  | TNat n, TStr s 
  | TStr s, TNat n => TBool (to_bool (TNat n) && to_bool (TStr s))
  | TBool b1, TBool b2 => TBool (b1 && b2)
  | TBool b, TStr s => TStr (to_str (TBool b) ++ s)
  | TStr s, TBool b => TStr (s ++ to_str (TBool b))
  | TStr s1, TStr s2 => TStr (s1 ++ "&&" ++ s2)
  end.

Definition typma_or (t1 t2 : typma) : typma :=
  match t1, t2 with
  | TNat n1, TNat n2 => TBool (to_bool (TNat n1) || to_bool (TNat n2))
  | TNat n, TBool b 
  | TBool b, TNat n => TBool (to_bool (TNat n) || b)
  | TNat n, TStr s 
  | TStr s, TNat n => TBool (to_bool (TNat n) || to_bool (TStr s))
  | TBool b1, TBool b2 => TBool (b1 || b2)
  | TBool b, TStr EmptyString
  | TStr EmptyString, TBool b
  | TBool b, TStr "false"
  | TStr "false", TBool b => TStr (to_str (TBool b))
  | TBool b, TStr s
  | TStr s, TBool b => TStr (s)
  | TStr s1, TStr s2 => TStr (s1 ++ "&&" ++ s2)
  end.

(* syntax definition for exp *)
Inductive exp : Type :=
  | ENat (n : nat)
  | EBool (b : bool)
  | EStr (s : string)
  | EId (x : string)
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
  | E_EStr (s : string) (st : state):
    exevalR (EStr s) st (TStr s)
  | E_EId (x : string) (st : state):
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
  -generalize dependent t0. induction e; simpl; intros; subst; try constructor;
  try (apply IHe1; reflexivity); try (apply IHe2; reflexivity); try (apply IHe; reflexivity).
Qed.

Inductive com : Type :=
  | CSkip
  | CAsgn (x : string) (e : exp)
  | CSeq (c1 c2 : com)
  | CIf (e : exp) (c1 c2 : com)
  | CWhile (e : exp) (c : com).



End Typma.