From Coq Require extraction.Extraction.
Require Export Coq.extraction.ExtrOcamlBasic.
Require Export Coq.extraction.ExtrOcamlNativeString.
Require Export Coq.extraction.ExtrOcamlNatInt.

(** Extraction of [nat] to [Zarith]'s [Z.t]. *)
(*Extract Inductive nat => "Z.t" ["Z.zero" "Z.succ"].*)

(*Extract Inlined Constant plus => "Z.add".*)

Extract Inlined Constant String.substring => "fun n1 n2 s -> String.sub s n1 n2".

Require TypmaEval.Typma.
(* for extra files change below*)
Separate Extraction TypmaEval.Typma TypmaEval.Sus.