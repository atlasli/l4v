(* THIS FILE WAS AUTOMATICALLY GENERATED. DO NOT EDIT. *)
(* instead, see the skeleton file ArchStateData_H.thy *)
(*
 * Copyright 2014, General Dynamics C4 Systems
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(GD_GPL)
 *)

(* 
	Kernel state and kernel monads, imports everything that SEL4.Model needs.
*)

chapter "Architecture Specific Kernel State and Monads"

theory ArchStateData_H
imports
  Arch_Structs_B
  ArchTypes_H
  ArchStructures_H
begin

context Arch begin global_naming X64_H

datatype kernel_state =
    X64KernelState "asid \<Rightarrow> ((machine_word) option)" "asid \<Rightarrow> ((machine_word) option)" machine_word "machine_word list" "machine_word list" "machine_word list"

primrec
  x64KSGlobalPDs :: "kernel_state \<Rightarrow> machine_word list"
where
  "x64KSGlobalPDs (X64KernelState v0 v1 v2 v3 v4 v5) = v4"

primrec
  x64KSASIDMap :: "kernel_state \<Rightarrow> asid \<Rightarrow> ((machine_word) option)"
where
  "x64KSASIDMap (X64KernelState v0 v1 v2 v3 v4 v5) = v1"

primrec
  x64KSASIDTable :: "kernel_state \<Rightarrow> asid \<Rightarrow> ((machine_word) option)"
where
  "x64KSASIDTable (X64KernelState v0 v1 v2 v3 v4 v5) = v0"

primrec
  x64KSGlobalPDPTs :: "kernel_state \<Rightarrow> machine_word list"
where
  "x64KSGlobalPDPTs (X64KernelState v0 v1 v2 v3 v4 v5) = v3"

primrec
  x64KSGlobalPML4 :: "kernel_state \<Rightarrow> machine_word"
where
  "x64KSGlobalPML4 (X64KernelState v0 v1 v2 v3 v4 v5) = v2"

primrec
  x64KSGlobalPTs :: "kernel_state \<Rightarrow> machine_word list"
where
  "x64KSGlobalPTs (X64KernelState v0 v1 v2 v3 v4 v5) = v5"

primrec
  x64KSGlobalPDs_update :: "((machine_word list) \<Rightarrow> (machine_word list)) \<Rightarrow> kernel_state \<Rightarrow> kernel_state"
where
  "x64KSGlobalPDs_update f (X64KernelState v0 v1 v2 v3 v4 v5) = X64KernelState v0 v1 v2 v3 (f v4) v5"

primrec
  x64KSASIDMap_update :: "((asid \<Rightarrow> ((machine_word) option)) \<Rightarrow> (asid \<Rightarrow> ((machine_word) option))) \<Rightarrow> kernel_state \<Rightarrow> kernel_state"
where
  "x64KSASIDMap_update f (X64KernelState v0 v1 v2 v3 v4 v5) = X64KernelState v0 (f v1) v2 v3 v4 v5"

primrec
  x64KSASIDTable_update :: "((asid \<Rightarrow> ((machine_word) option)) \<Rightarrow> (asid \<Rightarrow> ((machine_word) option))) \<Rightarrow> kernel_state \<Rightarrow> kernel_state"
where
  "x64KSASIDTable_update f (X64KernelState v0 v1 v2 v3 v4 v5) = X64KernelState (f v0) v1 v2 v3 v4 v5"

primrec
  x64KSGlobalPDPTs_update :: "((machine_word list) \<Rightarrow> (machine_word list)) \<Rightarrow> kernel_state \<Rightarrow> kernel_state"
where
  "x64KSGlobalPDPTs_update f (X64KernelState v0 v1 v2 v3 v4 v5) = X64KernelState v0 v1 v2 (f v3) v4 v5"

primrec
  x64KSGlobalPML4_update :: "(machine_word \<Rightarrow> machine_word) \<Rightarrow> kernel_state \<Rightarrow> kernel_state"
where
  "x64KSGlobalPML4_update f (X64KernelState v0 v1 v2 v3 v4 v5) = X64KernelState v0 v1 (f v2) v3 v4 v5"

primrec
  x64KSGlobalPTs_update :: "((machine_word list) \<Rightarrow> (machine_word list)) \<Rightarrow> kernel_state \<Rightarrow> kernel_state"
where
  "x64KSGlobalPTs_update f (X64KernelState v0 v1 v2 v3 v4 v5) = X64KernelState v0 v1 v2 v3 v4 (f v5)"

abbreviation (input)
  X64KernelState_trans :: "(asid \<Rightarrow> ((machine_word) option)) \<Rightarrow> (asid \<Rightarrow> ((machine_word) option)) \<Rightarrow> (machine_word) \<Rightarrow> (machine_word list) \<Rightarrow> (machine_word list) \<Rightarrow> (machine_word list) \<Rightarrow> kernel_state" ("X64KernelState'_ \<lparr> x64KSASIDTable= _, x64KSASIDMap= _, x64KSGlobalPML4= _, x64KSGlobalPDPTs= _, x64KSGlobalPDs= _, x64KSGlobalPTs= _ \<rparr>")
where
  "X64KernelState_ \<lparr> x64KSASIDTable= v0, x64KSASIDMap= v1, x64KSGlobalPML4= v2, x64KSGlobalPDPTs= v3, x64KSGlobalPDs= v4, x64KSGlobalPTs= v5 \<rparr> == X64KernelState v0 v1 v2 v3 v4 v5"

lemma x64KSGlobalPDs_x64KSGlobalPDs_update [simp]:
  "x64KSGlobalPDs (x64KSGlobalPDs_update f v) = f (x64KSGlobalPDs v)"
  by (cases v) simp

lemma x64KSGlobalPDs_x64KSASIDMap_update [simp]:
  "x64KSGlobalPDs (x64KSASIDMap_update f v) = x64KSGlobalPDs v"
  by (cases v) simp

lemma x64KSGlobalPDs_x64KSASIDTable_update [simp]:
  "x64KSGlobalPDs (x64KSASIDTable_update f v) = x64KSGlobalPDs v"
  by (cases v) simp

lemma x64KSGlobalPDs_x64KSGlobalPDPTs_update [simp]:
  "x64KSGlobalPDs (x64KSGlobalPDPTs_update f v) = x64KSGlobalPDs v"
  by (cases v) simp

lemma x64KSGlobalPDs_x64KSGlobalPML4_update [simp]:
  "x64KSGlobalPDs (x64KSGlobalPML4_update f v) = x64KSGlobalPDs v"
  by (cases v) simp

lemma x64KSGlobalPDs_x64KSGlobalPTs_update [simp]:
  "x64KSGlobalPDs (x64KSGlobalPTs_update f v) = x64KSGlobalPDs v"
  by (cases v) simp

lemma x64KSASIDMap_x64KSGlobalPDs_update [simp]:
  "x64KSASIDMap (x64KSGlobalPDs_update f v) = x64KSASIDMap v"
  by (cases v) simp

lemma x64KSASIDMap_x64KSASIDMap_update [simp]:
  "x64KSASIDMap (x64KSASIDMap_update f v) = f (x64KSASIDMap v)"
  by (cases v) simp

lemma x64KSASIDMap_x64KSASIDTable_update [simp]:
  "x64KSASIDMap (x64KSASIDTable_update f v) = x64KSASIDMap v"
  by (cases v) simp

lemma x64KSASIDMap_x64KSGlobalPDPTs_update [simp]:
  "x64KSASIDMap (x64KSGlobalPDPTs_update f v) = x64KSASIDMap v"
  by (cases v) simp

lemma x64KSASIDMap_x64KSGlobalPML4_update [simp]:
  "x64KSASIDMap (x64KSGlobalPML4_update f v) = x64KSASIDMap v"
  by (cases v) simp

lemma x64KSASIDMap_x64KSGlobalPTs_update [simp]:
  "x64KSASIDMap (x64KSGlobalPTs_update f v) = x64KSASIDMap v"
  by (cases v) simp

lemma x64KSASIDTable_x64KSGlobalPDs_update [simp]:
  "x64KSASIDTable (x64KSGlobalPDs_update f v) = x64KSASIDTable v"
  by (cases v) simp

lemma x64KSASIDTable_x64KSASIDMap_update [simp]:
  "x64KSASIDTable (x64KSASIDMap_update f v) = x64KSASIDTable v"
  by (cases v) simp

lemma x64KSASIDTable_x64KSASIDTable_update [simp]:
  "x64KSASIDTable (x64KSASIDTable_update f v) = f (x64KSASIDTable v)"
  by (cases v) simp

lemma x64KSASIDTable_x64KSGlobalPDPTs_update [simp]:
  "x64KSASIDTable (x64KSGlobalPDPTs_update f v) = x64KSASIDTable v"
  by (cases v) simp

lemma x64KSASIDTable_x64KSGlobalPML4_update [simp]:
  "x64KSASIDTable (x64KSGlobalPML4_update f v) = x64KSASIDTable v"
  by (cases v) simp

lemma x64KSASIDTable_x64KSGlobalPTs_update [simp]:
  "x64KSASIDTable (x64KSGlobalPTs_update f v) = x64KSASIDTable v"
  by (cases v) simp

lemma x64KSGlobalPDPTs_x64KSGlobalPDs_update [simp]:
  "x64KSGlobalPDPTs (x64KSGlobalPDs_update f v) = x64KSGlobalPDPTs v"
  by (cases v) simp

lemma x64KSGlobalPDPTs_x64KSASIDMap_update [simp]:
  "x64KSGlobalPDPTs (x64KSASIDMap_update f v) = x64KSGlobalPDPTs v"
  by (cases v) simp

lemma x64KSGlobalPDPTs_x64KSASIDTable_update [simp]:
  "x64KSGlobalPDPTs (x64KSASIDTable_update f v) = x64KSGlobalPDPTs v"
  by (cases v) simp

lemma x64KSGlobalPDPTs_x64KSGlobalPDPTs_update [simp]:
  "x64KSGlobalPDPTs (x64KSGlobalPDPTs_update f v) = f (x64KSGlobalPDPTs v)"
  by (cases v) simp

lemma x64KSGlobalPDPTs_x64KSGlobalPML4_update [simp]:
  "x64KSGlobalPDPTs (x64KSGlobalPML4_update f v) = x64KSGlobalPDPTs v"
  by (cases v) simp

lemma x64KSGlobalPDPTs_x64KSGlobalPTs_update [simp]:
  "x64KSGlobalPDPTs (x64KSGlobalPTs_update f v) = x64KSGlobalPDPTs v"
  by (cases v) simp

lemma x64KSGlobalPML4_x64KSGlobalPDs_update [simp]:
  "x64KSGlobalPML4 (x64KSGlobalPDs_update f v) = x64KSGlobalPML4 v"
  by (cases v) simp

lemma x64KSGlobalPML4_x64KSASIDMap_update [simp]:
  "x64KSGlobalPML4 (x64KSASIDMap_update f v) = x64KSGlobalPML4 v"
  by (cases v) simp

lemma x64KSGlobalPML4_x64KSASIDTable_update [simp]:
  "x64KSGlobalPML4 (x64KSASIDTable_update f v) = x64KSGlobalPML4 v"
  by (cases v) simp

lemma x64KSGlobalPML4_x64KSGlobalPDPTs_update [simp]:
  "x64KSGlobalPML4 (x64KSGlobalPDPTs_update f v) = x64KSGlobalPML4 v"
  by (cases v) simp

lemma x64KSGlobalPML4_x64KSGlobalPML4_update [simp]:
  "x64KSGlobalPML4 (x64KSGlobalPML4_update f v) = f (x64KSGlobalPML4 v)"
  by (cases v) simp

lemma x64KSGlobalPML4_x64KSGlobalPTs_update [simp]:
  "x64KSGlobalPML4 (x64KSGlobalPTs_update f v) = x64KSGlobalPML4 v"
  by (cases v) simp

lemma x64KSGlobalPTs_x64KSGlobalPDs_update [simp]:
  "x64KSGlobalPTs (x64KSGlobalPDs_update f v) = x64KSGlobalPTs v"
  by (cases v) simp

lemma x64KSGlobalPTs_x64KSASIDMap_update [simp]:
  "x64KSGlobalPTs (x64KSASIDMap_update f v) = x64KSGlobalPTs v"
  by (cases v) simp

lemma x64KSGlobalPTs_x64KSASIDTable_update [simp]:
  "x64KSGlobalPTs (x64KSASIDTable_update f v) = x64KSGlobalPTs v"
  by (cases v) simp

lemma x64KSGlobalPTs_x64KSGlobalPDPTs_update [simp]:
  "x64KSGlobalPTs (x64KSGlobalPDPTs_update f v) = x64KSGlobalPTs v"
  by (cases v) simp

lemma x64KSGlobalPTs_x64KSGlobalPML4_update [simp]:
  "x64KSGlobalPTs (x64KSGlobalPML4_update f v) = x64KSGlobalPTs v"
  by (cases v) simp

lemma x64KSGlobalPTs_x64KSGlobalPTs_update [simp]:
  "x64KSGlobalPTs (x64KSGlobalPTs_update f v) = f (x64KSGlobalPTs v)"
  by (cases v) simp

definition
gdteBits :: "nat"
where
"gdteBits \<equiv> 3"

definition
newKernelState :: "paddr \<Rightarrow> (kernel_state * paddr list)"
where
"newKernelState arg1 \<equiv> error []"


end
end