From Coq Require Strings.String. Import String.

(* type synonym for strings to avoid extraction bugs *)

Definition sus := string.
Definition susappend := append.
Definition suslength := length.
Definition suseqb := eqb.
Definition sussub := substring.

Definition pacer: sus := "The FitnessGram Pacer Test is a multistage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in 30 seconds. Line up at the start. The running speed starts slowly, but gets faster each minute after you hear this signal. [beep] A single lap should be completed each time you hear this sound. [ding] Remember to run in a straight line, and run as long as possible. The second time you fail to complete a lap before the sound, your test is over. The test will begin on the word start. On your mark, get ready, start."%string.
Definition succ: sus := "succ"%string.
Definition no_succ: sus := "no succ"%string.
Definition fs: sus := "false"%string.
Definition ts: sus := "true"%string.
Definition ms: sus := "star"%string.
Definition nots: sus := "!"%string.
Definition ands: sus := "&&"%string.
Definition ors: sus := "||"%string.