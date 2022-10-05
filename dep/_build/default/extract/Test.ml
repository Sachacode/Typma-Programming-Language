
type 'a vic =
| Coq_vnil
| Coq_vcons of Z.t * 'a * 'a vic

(** val vic_rect :
    'a2 -> (Z.t -> 'a1 -> 'a1 vic -> 'a2 -> 'a2) -> Z.t -> 'a1 vic -> 'a2 **)

let rec vic_rect f f0 _ = function
| Coq_vnil -> f
| Coq_vcons (n, a, v0) -> f0 n a v0 (vic_rect f f0 n v0)

(** val vic_rec :
    'a2 -> (Z.t -> 'a1 -> 'a1 vic -> 'a2 -> 'a2) -> Z.t -> 'a1 vic -> 'a2 **)

let rec vic_rec f f0 _ = function
| Coq_vnil -> f
| Coq_vcons (n, a, v0) -> f0 n a v0 (vic_rec f f0 n v0)

(** val vappend : Z.t -> Z.t -> 'a1 vic -> 'a1 vic -> 'a1 vic **)

let rec vappend _ n v_UU2081_ v_UU2082_ =
  match v_UU2081_ with
  | Coq_vnil -> v_UU2082_
  | Coq_vcons (n0, a, v_UU2081_0) ->
    Coq_vcons ((Z.add n0 n), a, (vappend n0 n v_UU2081_0 v_UU2082_))
