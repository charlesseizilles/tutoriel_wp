(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require bool.Bool.
Require int.Int.
Require int.Abs.
Require int.ComputerDivision.
Require real.Real.
Require real.RealInfix.
Require real.FromInt.
Require map.Map.

Parameter eqb:
  forall {a:Type} {a_WT:WhyType a}, a -> a -> Init.Datatypes.bool.

Axiom eqb1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (y:a), ((eqb x y) = Init.Datatypes.true) <-> (x = y).

Axiom eqb_false :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (y:a), ((eqb x y) = Init.Datatypes.false) <-> ~ (x = y).

Parameter neqb:
  forall {a:Type} {a_WT:WhyType a}, a -> a -> Init.Datatypes.bool.

Axiom neqb1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (y:a), ((neqb x y) = Init.Datatypes.true) <-> ~ (x = y).

Parameter zlt: Numbers.BinNums.Z -> Numbers.BinNums.Z -> Init.Datatypes.bool.

Parameter zleq:
  Numbers.BinNums.Z -> Numbers.BinNums.Z -> Init.Datatypes.bool.

Axiom zlt1 :
  forall (x:Numbers.BinNums.Z) (y:Numbers.BinNums.Z),
  ((zlt x y) = Init.Datatypes.true) <-> (x < y)%Z.

Axiom zleq1 :
  forall (x:Numbers.BinNums.Z) (y:Numbers.BinNums.Z),
  ((zleq x y) = Init.Datatypes.true) <-> (x <= y)%Z.

Parameter rlt:
  Reals.Rdefinitions.R -> Reals.Rdefinitions.R -> Init.Datatypes.bool.

Parameter rleq:
  Reals.Rdefinitions.R -> Reals.Rdefinitions.R -> Init.Datatypes.bool.

Axiom rlt1 :
  forall (x:Reals.Rdefinitions.R) (y:Reals.Rdefinitions.R),
  ((rlt x y) = Init.Datatypes.true) <-> (x < y)%R.

Axiom rleq1 :
  forall (x:Reals.Rdefinitions.R) (y:Reals.Rdefinitions.R),
  ((rleq x y) = Init.Datatypes.true) <-> (x <= y)%R.

(* Why3 assumption *)
Definition real_of_int (x:Numbers.BinNums.Z) : Reals.Rdefinitions.R :=
  BuiltIn.IZR x.

Axiom c_euclidian :
  forall (n:Numbers.BinNums.Z) (d:Numbers.BinNums.Z), ~ (d = 0%Z) ->
  (n = (((ZArith.BinInt.Z.quot n d) * d)%Z + (ZArith.BinInt.Z.rem n d))%Z).

Axiom cmod_remainder :
  forall (n:Numbers.BinNums.Z) (d:Numbers.BinNums.Z),
  ((0%Z <= n)%Z -> (0%Z < d)%Z ->
   (0%Z <= (ZArith.BinInt.Z.rem n d))%Z /\ ((ZArith.BinInt.Z.rem n d) < d)%Z) /\
  ((n <= 0%Z)%Z -> (0%Z < d)%Z ->
   ((-d)%Z < (ZArith.BinInt.Z.rem n d))%Z /\
   ((ZArith.BinInt.Z.rem n d) <= 0%Z)%Z) /\
  ((0%Z <= n)%Z -> (d < 0%Z)%Z ->
   (0%Z <= (ZArith.BinInt.Z.rem n d))%Z /\
   ((ZArith.BinInt.Z.rem n d) < (-d)%Z)%Z) /\
  ((n <= 0%Z)%Z -> (d < 0%Z)%Z ->
   (d < (ZArith.BinInt.Z.rem n d))%Z /\ ((ZArith.BinInt.Z.rem n d) <= 0%Z)%Z).

Axiom cdiv_neutral :
  forall (a:Numbers.BinNums.Z), ((ZArith.BinInt.Z.quot a 1%Z) = a).

Axiom cdiv_inv :
  forall (a:Numbers.BinNums.Z), ~ (a = 0%Z) ->
  ((ZArith.BinInt.Z.quot a a) = 1%Z).

Axiom cdiv_closed_remainder :
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z) (n:Numbers.BinNums.Z),
  (0%Z <= a)%Z -> (0%Z <= b)%Z ->
  (0%Z <= (b - a)%Z)%Z /\ ((b - a)%Z < n)%Z ->
  ((ZArith.BinInt.Z.rem a n) = (ZArith.BinInt.Z.rem b n)) -> (a = b).

Parameter L_sum_n: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Axiom Q_nul : ((L_sum_n 0%Z) = 0%Z).

Axiom Q_not_nul :
  forall (n:Numbers.BinNums.Z), (0%Z < n)%Z ->
  ((n + (L_sum_n ((-1%Z)%Z + n)%Z))%Z = (L_sum_n n)).

Theorem Z_induction(m : Z)(P : Z -> Prop) :
  (forall n, (n <= m)%Z -> P n ) ->
  (forall n, (n >= m)%Z -> P n -> P (n+1)%Z) ->
  (forall n, P n).
Proof.
  intros.
  induction (Z_le_dec n m) ; auto with zarith.
  apply Z.le_ind with (n := m) ; auto with zarith.
  unfold Morphisms.Proper.
  unfold Morphisms.respectful.
  intros. rewrite H1. intuition.
  intros. apply H0; auto with zarith.
Qed.

(* Why3 goal *)
Theorem wp_goal :
  forall (i:Numbers.BinNums.Z), (0%Z <= i)%Z ->
  ((i * (1%Z + i)%Z)%Z = (2%Z * (L_sum_n i))%Z).
Proof.
  Require Import Psatz.

  intros i Hi.
  induction i using Z_induction with (m := 0%Z).
  + assert (i = 0%Z) by lia ; subst.
    rewrite Q_nul ; lia.
  + rewrite <- Q_not_nul by lia.
    replace (- (1) + (i + 1))%Z with i by lia.
    lia.
Qed.

