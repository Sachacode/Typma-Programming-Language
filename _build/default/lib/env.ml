open Core

(* You may use whatever type that
   encodes a mapping
   from variable names [string]
   to arithmetic expressions [aexp]. *)
type store = (string * int) list

(* TODO: more helpful errors *)
type oops = UnboundVar of string | Stop | Div0

(** [string_of_oops err] is an error message for oops. *)
(* TODO *)
let string_of_oops (o : oops) : string =
match o with
  | UnboundVar str -> "Unbound var " ^ str
  | Stop -> "End"
  | Div0 -> "Divide by 0"

(** [string_of_store s] is a string-representation of store [s]. *)
(* TODO *)
let rec string_of_store (s : store) : string =
match s with
| [] -> ""
| (str, a)::n -> str ^ " -> " ^ string_of_int a ^ "\n" ^ string_of_store n

(** [lookup x s] is an (optional) expression bound to [x] in store [s]. *)
(* TODO *)
let rec lookup (l : string) (s : store) : (int, oops) Result.t =
match s with
| [] -> Error (UnboundVar l)
| (str, a)::n -> if String.equal str l then Ok a else lookup l n

(** [update x e s] is s with [x] now bound to [e]. *)
(* TODO *)
let rec update (l : string) (n : int) (s : store) : store =
match s with
| [] -> (l, n)::[]
| (str, a)::s -> if String.equal str l then (str, n)::s else (str, a)::(update l n s)
