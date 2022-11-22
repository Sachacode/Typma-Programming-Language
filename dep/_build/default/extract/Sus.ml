open String

type sus = string

(** val susappend : string -> string -> string **)

let susappend =
  (^)

(** val suslength : string -> int **)

let suslength =
  length

(** val suseqb : string -> string -> bool **)

let suseqb =
  (=)

(** val sussub : int -> int -> string -> string **)

let sussub =
  fun n1 n2 s -> String.sub s n1 n2

(** val pacer : sus **)

let pacer =
  "The FitnessGram Pacer Test is a multistage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in 30 seconds. Line up at the start. The running speed starts slowly, but gets faster each minute after you hear this signal. [beep] A single lap should be completed each time you hear this sound. [ding] Remember to run in a straight line, and run as long as possible. The second time you fail to complete a lap before the sound, your test is over. The test will begin on the word start. On your mark, get ready, start."

(** val succ : sus **)

let succ =
  "succ"

(** val no_succ : sus **)

let no_succ =
  "no succ"

(** val fs : sus **)

let fs =
  "false"

(** val ts : sus **)

let ts =
  "true"

(** val ms : sus **)

let ms =
  "star"

(** val nots : sus **)

let nots =
  "!"

(** val ands : sus **)

let ands =
  "&&"

(** val ors : sus **)

let ors =
  "||"
