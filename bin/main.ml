(** The file for using extracted cor functions *)
open Core

let ast filename =
  let c = filename
          |> Stdlib.open_in
          |> Lexing.from_channel
          |> Parser.prog Lexer.tokenize in
  print_endline ("Program parsed as: " ^ string_of_cmd c); c

let bs c =
    print_endline
      begin match Typ.eval [] c with
        | Ok s ->
          "Terminated with store " ^
          Env.string_of_store s
        | Error err ->
          "Runtime error! " ^ Env.string_of_oops err
      end

let runbs =
  Command.basic
    ~summary:"Big-step evaluation."
    Command.Param.(
      map
        (anon ("filename"%: string))
        ~f:(fun fn _ -> fn |> ast |> bs))