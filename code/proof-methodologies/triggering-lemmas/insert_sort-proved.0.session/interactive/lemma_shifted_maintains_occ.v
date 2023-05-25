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

(* Why3 assumption *)
Inductive addr :=
  | addr'mk : Numbers.BinNums.Z -> Numbers.BinNums.Z -> addr.
Axiom addr_WhyType : WhyType addr.
Existing Instance addr_WhyType.

(* Why3 assumption *)
Definition base (v:addr) : Numbers.BinNums.Z :=
  match v with
  | addr'mk x x1 => x
  end.

(* Why3 assumption *)
Definition offset (v:addr) : Numbers.BinNums.Z :=
  match v with
  | addr'mk x x1 => x1
  end.

Parameter addr_le: addr -> addr -> Prop.

Parameter addr_lt: addr -> addr -> Prop.

Parameter addr_le_bool: addr -> addr -> Init.Datatypes.bool.

Parameter addr_lt_bool: addr -> addr -> Init.Datatypes.bool.

Axiom addr_le_def :
  forall (p:addr) (q:addr), ((base p) = (base q)) ->
  addr_le p q <-> ((offset p) <= (offset q))%Z.

Axiom addr_lt_def :
  forall (p:addr) (q:addr), ((base p) = (base q)) ->
  addr_lt p q <-> ((offset p) < (offset q))%Z.

Axiom addr_le_bool_def :
  forall (p:addr) (q:addr),
  addr_le p q <-> ((addr_le_bool p q) = Init.Datatypes.true).

Axiom addr_lt_bool_def :
  forall (p:addr) (q:addr),
  addr_lt p q <-> ((addr_lt_bool p q) = Init.Datatypes.true).

(* Why3 assumption *)
Definition null : addr := addr'mk 0%Z 0%Z.

(* Why3 assumption *)
Definition global (b:Numbers.BinNums.Z) : addr := addr'mk b 0%Z.

(* Why3 assumption *)
Definition shift (p:addr) (k:Numbers.BinNums.Z) : addr :=
  addr'mk (base p) ((offset p) + k)%Z.

(* Why3 assumption *)
Definition included (p:addr) (a:Numbers.BinNums.Z) (q:addr)
    (b:Numbers.BinNums.Z) : Prop :=
  (0%Z < a)%Z ->
  (0%Z <= b)%Z /\
  ((base p) = (base q)) /\
  ((offset q) <= (offset p))%Z /\
  (((offset p) + a)%Z <= ((offset q) + b)%Z)%Z.

(* Why3 assumption *)
Definition separated (p:addr) (a:Numbers.BinNums.Z) (q:addr)
    (b:Numbers.BinNums.Z) : Prop :=
  (a <= 0%Z)%Z \/
  (b <= 0%Z)%Z \/
  ~ ((base p) = (base q)) \/
  (((offset q) + b)%Z <= (offset p))%Z \/
  (((offset p) + a)%Z <= (offset q))%Z.

(* Why3 assumption *)
Definition eqmem {a:Type} {a_WT:WhyType a} (m1:addr -> a) (m2:addr -> a)
    (p:addr) (a1:Numbers.BinNums.Z) : Prop :=
  forall (q:addr), included q 1%Z p a1 -> ((m1 q) = (m2 q)).

Parameter havoc:
  forall {a:Type} {a_WT:WhyType a}, (addr -> a) -> (addr -> a) -> addr ->
  Numbers.BinNums.Z -> addr -> a.

(* Why3 assumption *)
Definition valid_rw (m:Numbers.BinNums.Z -> Numbers.BinNums.Z) (p:addr)
    (n:Numbers.BinNums.Z) : Prop :=
  (0%Z < n)%Z ->
  (0%Z < (base p))%Z /\
  (0%Z <= (offset p))%Z /\ (((offset p) + n)%Z <= (m (base p)))%Z.

(* Why3 assumption *)
Definition valid_rd (m:Numbers.BinNums.Z -> Numbers.BinNums.Z) (p:addr)
    (n:Numbers.BinNums.Z) : Prop :=
  (0%Z < n)%Z ->
  ~ (0%Z = (base p)) /\
  (0%Z <= (offset p))%Z /\ (((offset p) + n)%Z <= (m (base p)))%Z.

(* Why3 assumption *)
Definition valid_obj (m:Numbers.BinNums.Z -> Numbers.BinNums.Z) (p:addr)
    (n:Numbers.BinNums.Z) : Prop :=
  (0%Z < n)%Z ->
  (p = null) \/
  ~ (0%Z = (base p)) /\
  (0%Z <= (offset p))%Z /\ (((offset p) + n)%Z <= (1%Z + (m (base p)))%Z)%Z.

(* Why3 assumption *)
Definition invalid (m:Numbers.BinNums.Z -> Numbers.BinNums.Z) (p:addr)
    (n:Numbers.BinNums.Z) : Prop :=
  (n <= 0%Z)%Z \/
  ((base p) = 0%Z) \/
  ((m (base p)) <= (offset p))%Z \/ (((offset p) + n)%Z <= 0%Z)%Z.

Axiom valid_rw_rd :
  forall (m:Numbers.BinNums.Z -> Numbers.BinNums.Z), forall (p:addr),
  forall (n:Numbers.BinNums.Z), valid_rw m p n -> valid_rd m p n.

Axiom valid_string :
  forall (m:Numbers.BinNums.Z -> Numbers.BinNums.Z), forall (p:addr),
  ((base p) < 0%Z)%Z ->
  (0%Z <= (offset p))%Z /\ ((offset p) < (m (base p)))%Z ->
  valid_rd m p 1%Z /\ ~ valid_rw m p 1%Z.

Axiom separated_1 :
  forall (p:addr) (q:addr),
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z) (i:Numbers.BinNums.Z)
    (j:Numbers.BinNums.Z),
  separated p a q b -> ((offset p) <= i)%Z /\ (i < ((offset p) + a)%Z)%Z ->
  ((offset q) <= j)%Z /\ (j < ((offset q) + b)%Z)%Z ->
  ~ ((addr'mk (base p) i) = (addr'mk (base q) j)).

Parameter region: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter linked: (Numbers.BinNums.Z -> Numbers.BinNums.Z) -> Prop.

Parameter sconst: (addr -> Numbers.BinNums.Z) -> Prop.

(* Why3 assumption *)
Definition framed (m:addr -> addr) : Prop :=
  forall (p:addr), ((region (base p)) <= 0%Z)%Z ->
  ((region (base (m p))) <= 0%Z)%Z.

Axiom separated_included :
  forall (p:addr) (q:addr),
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z), (0%Z < a)%Z ->
  (0%Z < b)%Z -> separated p a q b -> ~ included p a q b.

Axiom included_trans :
  forall (p:addr) (q:addr) (r:addr),
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z) (c:Numbers.BinNums.Z),
  included p a q b -> included q b r c -> included p a r c.

Axiom separated_trans :
  forall (p:addr) (q:addr) (r:addr),
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z) (c:Numbers.BinNums.Z),
  included p a q b -> separated q b r c -> separated p a r c.

Axiom separated_sym :
  forall (p:addr) (q:addr),
  forall (a:Numbers.BinNums.Z) (b:Numbers.BinNums.Z),
  separated p a q b <-> separated q b p a.

Axiom eqmem_included :
  forall {a:Type} {a_WT:WhyType a},
  forall (m1:addr -> a) (m2:addr -> a), forall (p:addr) (q:addr),
  forall (a1:Numbers.BinNums.Z) (b:Numbers.BinNums.Z), included p a1 q b ->
  eqmem m1 m2 q b -> eqmem m1 m2 p a1.

Axiom eqmem_sym :
  forall {a:Type} {a_WT:WhyType a},
  forall (m1:addr -> a) (m2:addr -> a), forall (p:addr),
  forall (a1:Numbers.BinNums.Z), eqmem m1 m2 p a1 -> eqmem m2 m1 p a1.

Axiom havoc_access :
  forall {a:Type} {a_WT:WhyType a},
  forall (m0:addr -> a) (m1:addr -> a), forall (q:addr) (p:addr),
  forall (a1:Numbers.BinNums.Z),
  (separated q 1%Z p a1 -> ((havoc m0 m1 p a1 q) = (m1 q))) /\
  (~ separated q 1%Z p a1 -> ((havoc m0 m1 p a1 q) = (m0 q))).

Parameter cinits: (addr -> Init.Datatypes.bool) -> Prop.

(* Why3 assumption *)
Definition is_init_range (m:addr -> Init.Datatypes.bool) (p:addr)
    (l:Numbers.BinNums.Z) : Prop :=
  forall (i:Numbers.BinNums.Z), (0%Z <= i)%Z /\ (i < l)%Z ->
  ((m (shift p i)) = Init.Datatypes.true).

Parameter set_init:
  (addr -> Init.Datatypes.bool) -> addr -> Numbers.BinNums.Z ->
  addr -> Init.Datatypes.bool.

Axiom set_init_access :
  forall (m:addr -> Init.Datatypes.bool), forall (q:addr) (p:addr),
  forall (a:Numbers.BinNums.Z),
  (separated q 1%Z p a -> ((set_init m p a q) = (m q))) /\
  (~ separated q 1%Z p a -> ((set_init m p a q) = Init.Datatypes.true)).

(* Why3 assumption *)
Definition monotonic_init (m1:addr -> Init.Datatypes.bool)
    (m2:addr -> Init.Datatypes.bool) : Prop :=
  forall (p:addr), ((m1 p) = Init.Datatypes.true) ->
  ((m2 p) = Init.Datatypes.true).

Parameter int_of_addr: addr -> Numbers.BinNums.Z.

Parameter addr_of_int: Numbers.BinNums.Z -> addr.

Axiom table : Type.
Parameter table_WhyType : WhyType table.
Existing Instance table_WhyType.

Parameter table_of_base: Numbers.BinNums.Z -> table.

Parameter table_to_offset: table -> Numbers.BinNums.Z -> Numbers.BinNums.Z.

Axiom table_to_offset_zero :
  forall (t:table), ((table_to_offset t 0%Z) = 0%Z).

Axiom table_to_offset_monotonic :
  forall (t:table), forall (o1:Numbers.BinNums.Z) (o2:Numbers.BinNums.Z),
  (o1 <= o2)%Z <-> ((table_to_offset t o1) <= (table_to_offset t o2))%Z.

Axiom int_of_addr_bijection :
  forall (a:Numbers.BinNums.Z), ((int_of_addr (addr_of_int a)) = a).

Axiom addr_of_int_bijection :
  forall (p:addr), ((addr_of_int (int_of_addr p)) = p).

Axiom addr_of_null : ((int_of_addr null) = 0%Z).

(* Why3 assumption *)
Definition is_bool (x:Numbers.BinNums.Z) : Prop := (x = 0%Z) \/ (x = 1%Z).

(* Why3 assumption *)
Definition is_uint8 (x:Numbers.BinNums.Z) : Prop :=
  (0%Z <= x)%Z /\ (x < 256%Z)%Z.

(* Why3 assumption *)
Definition is_sint8 (x:Numbers.BinNums.Z) : Prop :=
  ((-128%Z)%Z <= x)%Z /\ (x < 128%Z)%Z.

(* Why3 assumption *)
Definition is_uint16 (x:Numbers.BinNums.Z) : Prop :=
  (0%Z <= x)%Z /\ (x < 65536%Z)%Z.

(* Why3 assumption *)
Definition is_sint16 (x:Numbers.BinNums.Z) : Prop :=
  ((-32768%Z)%Z <= x)%Z /\ (x < 32768%Z)%Z.

(* Why3 assumption *)
Definition is_uint32 (x:Numbers.BinNums.Z) : Prop :=
  (0%Z <= x)%Z /\ (x < 4294967296%Z)%Z.

(* Why3 assumption *)
Definition is_sint32 (x:Numbers.BinNums.Z) : Prop :=
  ((-2147483648%Z)%Z <= x)%Z /\ (x < 2147483648%Z)%Z.

(* Why3 assumption *)
Definition is_uint64 (x:Numbers.BinNums.Z) : Prop :=
  (0%Z <= x)%Z /\ (x < 18446744073709551616%Z)%Z.

(* Why3 assumption *)
Definition is_sint64 (x:Numbers.BinNums.Z) : Prop :=
  ((-9223372036854775808%Z)%Z <= x)%Z /\ (x < 9223372036854775808%Z)%Z.

Axiom is_bool0 : is_bool 0%Z.

Axiom is_bool1 : is_bool 1%Z.

Parameter to_bool: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Axiom to_bool'def :
  forall (x:Numbers.BinNums.Z),
  ((x = 0%Z) -> ((to_bool x) = 0%Z)) /\ (~ (x = 0%Z) -> ((to_bool x) = 1%Z)).

Parameter to_uint8: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_sint8: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_uint16: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_sint16: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_uint32: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_sint32: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_uint64: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_sint64: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter two_power_abs: Numbers.BinNums.Z -> Numbers.BinNums.Z.

Axiom two_power_abs_is_positive :
  forall (n:Numbers.BinNums.Z), (0%Z < (two_power_abs n))%Z.

Axiom two_power_abs_plus_pos :
  forall (n:Numbers.BinNums.Z) (m:Numbers.BinNums.Z), (0%Z <= n)%Z ->
  (0%Z <= m)%Z ->
  ((two_power_abs (n + m)%Z) = ((two_power_abs n) * (two_power_abs m))%Z).

Axiom two_power_abs_plus_one :
  forall (n:Numbers.BinNums.Z), (0%Z <= n)%Z ->
  ((two_power_abs (n + 1%Z)%Z) = (2%Z * (two_power_abs n))%Z).

(* Why3 assumption *)
Definition is_uint (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z) : Prop :=
  (0%Z <= x)%Z /\ (x < (two_power_abs n))%Z.

(* Why3 assumption *)
Definition is_sint (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z) : Prop :=
  ((-(two_power_abs n))%Z <= x)%Z /\ (x < (two_power_abs n))%Z.

Parameter to_uint:
  Numbers.BinNums.Z -> Numbers.BinNums.Z -> Numbers.BinNums.Z.

Parameter to_sint:
  Numbers.BinNums.Z -> Numbers.BinNums.Z -> Numbers.BinNums.Z.

Axiom is_to_uint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z), is_uint n (to_uint n x).

Axiom is_to_sint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z), is_sint n (to_sint n x).

Axiom is_to_uint8 : forall (x:Numbers.BinNums.Z), is_uint8 (to_uint8 x).

Axiom is_to_sint8 : forall (x:Numbers.BinNums.Z), is_sint8 (to_sint8 x).

Axiom is_to_uint16 : forall (x:Numbers.BinNums.Z), is_uint16 (to_uint16 x).

Axiom is_to_sint16 : forall (x:Numbers.BinNums.Z), is_sint16 (to_sint16 x).

Axiom is_to_uint32 : forall (x:Numbers.BinNums.Z), is_uint32 (to_uint32 x).

Axiom is_to_sint32 : forall (x:Numbers.BinNums.Z), is_sint32 (to_sint32 x).

Axiom is_to_uint64 : forall (x:Numbers.BinNums.Z), is_uint64 (to_uint64 x).

Axiom is_to_sint64 : forall (x:Numbers.BinNums.Z), is_sint64 (to_sint64 x).

Axiom id_uint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  is_uint n x <-> ((to_uint n x) = x).

Axiom id_sint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  is_sint n x <-> ((to_sint n x) = x).

Axiom id_uint8 :
  forall (x:Numbers.BinNums.Z), is_uint8 x -> ((to_uint8 x) = x).

Axiom id_sint8 :
  forall (x:Numbers.BinNums.Z), is_sint8 x -> ((to_sint8 x) = x).

Axiom id_uint16 :
  forall (x:Numbers.BinNums.Z), is_uint16 x -> ((to_uint16 x) = x).

Axiom id_sint16 :
  forall (x:Numbers.BinNums.Z), is_sint16 x -> ((to_sint16 x) = x).

Axiom id_uint32 :
  forall (x:Numbers.BinNums.Z), is_uint32 x -> ((to_uint32 x) = x).

Axiom id_sint32 :
  forall (x:Numbers.BinNums.Z), is_sint32 x -> ((to_sint32 x) = x).

Axiom id_uint64 :
  forall (x:Numbers.BinNums.Z), is_uint64 x -> ((to_uint64 x) = x).

Axiom id_sint64 :
  forall (x:Numbers.BinNums.Z), is_sint64 x -> ((to_sint64 x) = x).

Axiom proj_uint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  ((to_uint n (to_uint n x)) = (to_uint n x)).

Axiom proj_sint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  ((to_sint n (to_sint n x)) = (to_sint n x)).

Axiom proj_uint8 :
  forall (x:Numbers.BinNums.Z), ((to_uint8 (to_uint8 x)) = (to_uint8 x)).

Axiom proj_sint8 :
  forall (x:Numbers.BinNums.Z), ((to_sint8 (to_sint8 x)) = (to_sint8 x)).

Axiom proj_uint16 :
  forall (x:Numbers.BinNums.Z), ((to_uint16 (to_uint16 x)) = (to_uint16 x)).

Axiom proj_sint16 :
  forall (x:Numbers.BinNums.Z), ((to_sint16 (to_sint16 x)) = (to_sint16 x)).

Axiom proj_uint32 :
  forall (x:Numbers.BinNums.Z), ((to_uint32 (to_uint32 x)) = (to_uint32 x)).

Axiom proj_sint32 :
  forall (x:Numbers.BinNums.Z), ((to_sint32 (to_sint32 x)) = (to_sint32 x)).

Axiom proj_uint64 :
  forall (x:Numbers.BinNums.Z), ((to_uint64 (to_uint64 x)) = (to_uint64 x)).

Axiom proj_sint64 :
  forall (x:Numbers.BinNums.Z), ((to_sint64 (to_sint64 x)) = (to_sint64 x)).

Axiom proj_su :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  ((to_sint n (to_uint n x)) = (to_uint n x)).

Axiom incl_su :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z), is_uint n x ->
  is_sint n x.

Axiom proj_su_uint :
  forall (n:Numbers.BinNums.Z) (m:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= m)%Z ->
  ((to_sint (m + n)%Z (to_uint n x)) = (to_uint n x)).

Axiom proj_su_sint :
  forall (n:Numbers.BinNums.Z) (m:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= m)%Z ->
  ((to_sint n (to_uint (m + (n + 1%Z)%Z)%Z x)) = (to_sint n x)).

Axiom proj_int8 :
  forall (x:Numbers.BinNums.Z), ((to_sint8 (to_uint8 x)) = (to_sint8 x)).

Axiom proj_int16 :
  forall (x:Numbers.BinNums.Z), ((to_sint16 (to_uint16 x)) = (to_sint16 x)).

Axiom proj_int32 :
  forall (x:Numbers.BinNums.Z), ((to_sint32 (to_uint32 x)) = (to_sint32 x)).

Axiom proj_int64 :
  forall (x:Numbers.BinNums.Z), ((to_sint64 (to_uint64 x)) = (to_sint64 x)).

Axiom proj_us_uint :
  forall (n:Numbers.BinNums.Z) (m:Numbers.BinNums.Z) (x:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= m)%Z ->
  ((to_uint (n + 1%Z)%Z (to_sint (m + n)%Z x)) = (to_uint (n + 1%Z)%Z x)).

Axiom incl_uint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z) (i:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= i)%Z -> is_uint n x -> is_uint (n + i)%Z x.

Axiom incl_sint :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z) (i:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= i)%Z -> is_sint n x -> is_sint (n + i)%Z x.

Axiom incl_int :
  forall (n:Numbers.BinNums.Z) (x:Numbers.BinNums.Z) (i:Numbers.BinNums.Z),
  (0%Z <= n)%Z -> (0%Z <= i)%Z -> is_uint n x -> is_sint (n + i)%Z x.

(* Why3 assumption *)
Definition is_sint32_chunk (m:addr -> Numbers.BinNums.Z) : Prop :=
  forall (a:addr), is_sint32 (m a).

Parameter L_l_occurrences_of:
  (addr -> Numbers.BinNums.Z) -> Numbers.BinNums.Z -> addr ->
  Numbers.BinNums.Z -> Numbers.BinNums.Z -> Numbers.BinNums.Z.

Axiom Q_occurrences_empty_range :
  forall (Mint:addr -> Numbers.BinNums.Z) (v:Numbers.BinNums.Z) (in1:addr)
    (from:Numbers.BinNums.Z) (to:Numbers.BinNums.Z),
  (to <= from)%Z -> is_sint32_chunk Mint -> is_sint32 v ->
  ((L_l_occurrences_of Mint v in1 from to) = 0%Z).

Axiom Q_occurrences_positive_range_with_element :
  forall (Mint:addr -> Numbers.BinNums.Z) (v:Numbers.BinNums.Z) (in1:addr)
    (from:Numbers.BinNums.Z) (to:Numbers.BinNums.Z),
  let x := ((-1%Z)%Z + to)%Z in
  let x1 := Mint (shift in1 x) in
  (x1 = v) -> (from < to)%Z -> is_sint32_chunk Mint -> is_sint32 v ->
  is_sint32 x1 ->
  ((1%Z + (L_l_occurrences_of Mint v in1 from x))%Z =
   (L_l_occurrences_of Mint v in1 from to)).

Axiom Q_occurrences_positive_range_without_element :
  forall (Mint:addr -> Numbers.BinNums.Z) (v:Numbers.BinNums.Z) (in1:addr)
    (from:Numbers.BinNums.Z) (to:Numbers.BinNums.Z),
  let x := ((-1%Z)%Z + to)%Z in
  let x1 := Mint (shift in1 x) in
  ~ (x1 = v) -> (from < to)%Z -> is_sint32_chunk Mint -> is_sint32 v ->
  is_sint32 x1 ->
  ((L_l_occurrences_of Mint v in1 from x) =
   (L_l_occurrences_of Mint v in1 from to)).

(* Why3 assumption *)
Definition P_permutation (Mint:addr -> Numbers.BinNums.Z)
    (Mint1:addr -> Numbers.BinNums.Z) (in1:addr) (from:Numbers.BinNums.Z)
    (to:Numbers.BinNums.Z) : Prop :=
  forall (i:Numbers.BinNums.Z), is_sint32 i ->
  ((L_l_occurrences_of Mint1 i in1 from to) =
   (L_l_occurrences_of Mint i in1 from to)).

Axiom Q_transitive_permutation :
  forall (Mint:addr -> Numbers.BinNums.Z) (Mint1:addr -> Numbers.BinNums.Z)
    (Mint2:addr -> Numbers.BinNums.Z) (a:addr) (beg:Numbers.BinNums.Z)
    (end1:Numbers.BinNums.Z),
  is_sint32_chunk Mint -> is_sint32_chunk Mint2 -> is_sint32_chunk Mint1 ->
  P_permutation Mint Mint1 a beg end1 ->
  P_permutation Mint1 Mint2 a beg end1 -> P_permutation Mint Mint2 a beg end1.

Axiom Q_l_occurrences_of_union :
  forall (Mint:addr -> Numbers.BinNums.Z) (v:Numbers.BinNums.Z) (in1:addr)
    (from:Numbers.BinNums.Z) (split:Numbers.BinNums.Z) (to:Numbers.BinNums.Z),
  (from <= split)%Z -> (split <= to)%Z -> is_sint32_chunk Mint ->
  is_sint32 v ->
  (((L_l_occurrences_of Mint v in1 from split) +
    (L_l_occurrences_of Mint v in1 split to))%Z
   = (L_l_occurrences_of Mint v in1 from to)).

(* Why3 assumption *)
Definition P_shifted (Mint:addr -> Numbers.BinNums.Z)
    (Mint1:addr -> Numbers.BinNums.Z) (s:Numbers.BinNums.Z) (a:addr)
    (beg:Numbers.BinNums.Z) (end1:Numbers.BinNums.Z) : Prop :=
  forall (i:Numbers.BinNums.Z), (beg <= i)%Z -> (i < end1)%Z ->
  ((Mint (shift a (i + s)%Z)) = (Mint1 (shift a i))).

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
  forall (t:addr -> Numbers.BinNums.Z) (t1:addr -> Numbers.BinNums.Z)
    (a:addr) (i:Numbers.BinNums.Z) (i1:Numbers.BinNums.Z)
    (i2:Numbers.BinNums.Z) (i3:Numbers.BinNums.Z),
  is_sint32_chunk t1 -> is_sint32_chunk t -> is_sint32 i3 ->
  P_shifted t t1 i2 a i i1 ->
  ((L_l_occurrences_of t i3 a (i + i2)%Z (i1 + i2)%Z) =
   (L_l_occurrences_of t1 i3 a i i1)).
Proof.
  Require Import Psatz.

  Ltac norm := repeat(match goal with
  | [ _ : _ |- context [ (- (1) + (?i + 1))%Z ]] => replace (- (1) + (i + 1))%Z with i by lia
  | [ _ : _ |- context [ (- (1) + (?i + 1 + ?x))%Z ]] => replace (- (1) + (i + 1 + x))%Z with (i + x)%Z by lia
  end).
  intros M1 M2 a ba ea s v M2_int M1_int Hv H.
  induction ea using Z_induction with (m := ba).
  + rewrite Q_occurrences_empty_range ; auto.
    rewrite Q_occurrences_empty_range ; auto.
    lia.
  + assert (EqNeq: { M2 (shift a ea) = v } + { M2 (shift a ea) <> v }) by
      repeat(decide equality).
    assert (UP: P_shifted M1 M2 s a ba ea) by (intros i ; intros ; apply H ; lia).
    assert (Same: M1 (shift a (ea + s)) = M2 (shift a ea )) by (apply H ; lia).
    apply IHea in UP.
    inversion EqNeq as [ Eq | Neq ].
    - rewrite <- Q_occurrences_positive_range_with_element with (Mint := M1) ; auto ; norm ; try lia.
      rewrite <- Q_occurrences_positive_range_with_element with (Mint := M2) ; auto ; norm ; try lia.
    - rewrite <- Q_occurrences_positive_range_without_element with (Mint := M1) ; auto ; norm ; try lia.
      rewrite <- Q_occurrences_positive_range_without_element with (Mint := M2) ; auto ; norm ; try lia.
Qed.

