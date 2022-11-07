From Coq Require extraction.Extraction.
Require Export Coq.extraction.ExtrOcamlBasic.
Require Export Coq.extraction.ExtrOcamlString.
Require Export Coq.extraction.ExtrOcamlNatInt.

(** Extraction of [nat] to [Zarith]'s [Z.t]. *)
(*Extract Inductive nat => "Z.t" ["Z.zero" "Z.succ"].*)

(*Extract Inlined Constant plus => "Z.add".*)

Require TypmaEval.Typma.
(* for extra files change below*)
Separate Extraction TypmaEval.Typma.