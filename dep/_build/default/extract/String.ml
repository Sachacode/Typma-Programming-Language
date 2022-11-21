
(** val length : string -> int **)

let rec length s =
  (* If this appears, you're using String internals. Please don't *)
 (fun f0 f1 s ->
    let l = String.length s in
    if l = 0 then f0 else f1 (String.get s 0) (String.sub s 1 (l-1)))

    (fun _ -> 0)
    (fun _ s' -> Pervasives.succ (length s'))
    s

(** val substring : int -> int -> string -> string **)

let rec substring n m s =
  (fun fO fS n -> if n=0 then fO () else fS (n-1))
    (fun _ ->
    (fun fO fS n -> if n=0 then fO () else fS (n-1))
      (fun _ -> "")
      (fun m' ->
      (* If this appears, you're using String internals. Please don't *)
 (fun f0 f1 s ->
    let l = String.length s in
    if l = 0 then f0 else f1 (String.get s 0) (String.sub s 1 (l-1)))

        (fun _ -> s)
        (fun c s' ->
        (* If this appears, you're using String internals. Please don't *)
  (fun (c, s) -> String.make 1 c ^ s)

        (c, (substring 0 m' s')))
        s)
      m)
    (fun n' ->
    (* If this appears, you're using String internals. Please don't *)
 (fun f0 f1 s ->
    let l = String.length s in
    if l = 0 then f0 else f1 (String.get s 0) (String.sub s 1 (l-1)))

      (fun _ -> s)
      (fun _ s' -> substring n' m s')
      s)
    n
