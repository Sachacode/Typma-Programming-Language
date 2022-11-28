(** The file for using extracted cor functions *)
open Core
open Lig
open Typ.Typma

let ast filename =
  let c = filename
          |> Stdlib.open_in
          |> Lexing.from_channel
          |> Parser.prog Lexer.tokenize in
  print_endline ("\nProgram parsed as: " ^ ToString.string_of_com c); c
  (*print_endline ("0");
  let c = Stdlib.open_in filename in print_endline ("1");
  let d = Lexing.from_channel c in print_endline ("2");
  let f = Parser.prog Lexer.tokenize d in print_endline ("Program parsed as: " ^ ToString.string_of_com f); f*)

let bs c =
    print_endline
      begin match ceval_step (t_empty (TNat 0)) c 256 with
        | Some _ ->
          "Terminated with store "
        | None ->
          "Yoshikage Kira"
      end

let runbs =
  Command.basic
    ~summary:"typma evaluation."
    Command.Param.(
      map
        (anon ("filename"%: string))
        ~f:(fun fn _ -> fn |> ast |> bs))

let command =
  Command.group
    ~summary:"An interpreter for typma."
    ["-typma",runbs]
  
let () = Command_unix.run ~version:"1.0" command