open Core

let rec r_exp (x : int) (g : int): string =
  match g with
  | 0 -> "0"
  | _ ->
    match x with
    | 0 ->  string_of_int (Random.int 1000)
    | 1 ->  string_of_bool (Random.bool ())
    | 2 ->  Char.to_string (Char.unsafe_of_int (97 + (Random.int 26)))
    | 3 ->  if (Random.bool ()) then ("\"" ^ (Char.to_string (Char.unsafe_of_int (97 + (Random.int 26)))) ^ "\"") else "\"\""
    | 4 ->  "(" ^ r_exp (Random.int 12) (g - 1) ^ " + " ^ r_exp (Random.int 12) (g - 1) ^ ")"
    | 5 ->  "(" ^ r_exp (Random.int 12) (g - 1) ^ " - " ^ r_exp (Random.int 12) (g - 1) ^ ")"
    | 6 ->  "(" ^ r_exp (Random.int 12) (g - 1) ^ " * " ^ r_exp (Random.int 12) (g - 1) ^ ")"
    | 7 ->  "(" ^ r_exp (Random.int 12) (g - 1) ^ " / " ^ r_exp (Random.int 12) (g - 1) ^ ")"
    | 8 ->  "(" ^ r_exp (Random.int 12) (g - 1) ^ " == " ^ r_exp (Random.int 12) (g - 1) ^ ")"
    | 9 ->  "(" ^ r_exp (Random.int 12) (g - 1) ^ " < " ^ r_exp (Random.int 12) (g - 1) ^ ")"
    | 10 -> "( ! " ^ r_exp (Random.int 12) (g - 1) ^ " )"
    | 11 ->  "(" ^ r_exp (Random.int 12) (g - 1) ^ " && " ^ r_exp (Random.int 12) (g - 1) ^ ")"
    | _ ->  "(" ^ r_exp (Random.int 12) (g - 1) ^ " || " ^ r_exp (Random.int 12) (g - 1) ^ ")"

let rec r_cmd (x : int) (g : int): string =
  match g with
  | 0 -> "skip"
  | _ ->
    match x with
    | 0 -> "skip"
    | 1 -> "print " ^ r_exp (Random.int 12) (5)
    | 2 -> Char.to_string (Char.unsafe_of_int (97 + (Random.int 26))) ^ " := " ^ r_exp (Random.int 12) (5)
    | 3 -> r_cmd (Random.int 5) (g - 1) ^ ";\n" ^ r_cmd (Random.int 5) (g - 1)
    | 4 -> "if " ^ r_exp (Random.int 12) (5) ^ " {" ^ r_cmd (Random.int 5) (g - 1) ^ "} else {" ^ r_cmd (Random.int 5) (g - 1) ^ "}"
    | _ -> "while " ^ r_exp (Random.int 12) (5) ^ " {" ^ r_cmd (Random.int 5) (g - 1) ^ "}"