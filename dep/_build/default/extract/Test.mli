
type 'a vic =
| Coq_vnil
| Coq_vcons of Z.t * 'a * 'a vic

val vic_rect :
  'a2 -> (Z.t -> 'a1 -> 'a1 vic -> 'a2 -> 'a2) -> Z.t -> 'a1 vic -> 'a2

val vic_rec :
  'a2 -> (Z.t -> 'a1 -> 'a1 vic -> 'a2 -> 'a2) -> Z.t -> 'a1 vic -> 'a2

val vappend : Z.t -> Z.t -> 'a1 vic -> 'a1 vic -> 'a1 vic
