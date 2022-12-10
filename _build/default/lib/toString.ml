open Core
open Typ.Typma

let rec string_of_exp (e: exp) : string =
  match e with
  | ENat n -> string_of_int n
  | EBool b -> Stdlib.Bool.to_string b
  | EStr s -> "\"" ^ s ^ "\""
  | EId x -> x
  | EPlus (e1, e2) ->  "(" ^ string_of_exp e1 ^ " + " ^ string_of_exp e2 ^ ")"
  | EMinus (e1, e2) ->  "(" ^ string_of_exp e1 ^ " - " ^ string_of_exp e2 ^ ")"
  | EMult (e1, e2) ->  "(" ^ string_of_exp e1 ^ " * " ^ string_of_exp e2 ^ ")"
  | EDiv (e1, e2) ->  "(" ^ string_of_exp e1 ^ " / " ^ string_of_exp e2 ^ ")"
  | EEq (e1, e2) ->  "(" ^ string_of_exp e1 ^ " == " ^ string_of_exp e2 ^ ")"
  | ELe (e1, e2) ->  "(" ^ string_of_exp e1 ^ " < " ^ string_of_exp e2 ^ ")"
  | ENot e -> "( ! " ^ string_of_exp e ^ " )"
  | EAnd (e1, e2) ->  "(" ^ string_of_exp e1 ^ " && " ^ string_of_exp e2 ^ ")"
  | EOr (e1, e2) ->  "(" ^ string_of_exp e1 ^ " || " ^ string_of_exp e2 ^ ")"

let rec string_of_com (c : com) : string =
  match c with
  | CSkip -> "skip"
  | CPrint e -> "print " ^ string_of_exp e
  | CAsgn (s, e) -> s ^ " := " ^ string_of_exp e
  | CSeq (c1, c2) -> string_of_com c1 ^ ";\n" ^ string_of_com c2
  | CIf (e, c1, c2) -> "if " ^ string_of_exp e ^ " {" ^ string_of_com c1 ^ "} else {" ^ string_of_com c2 ^ "}"
  | CWhile (e, c) -> "while " ^ string_of_exp e ^ " {" ^ string_of_com c ^ "}"