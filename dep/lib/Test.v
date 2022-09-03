Section Test.
Variable (A : Set).

Inductive typ : nat -> Set :=
| tnil : typ 0
| tcons : forall (n : nat), A -> typ n -> typ (S n).
