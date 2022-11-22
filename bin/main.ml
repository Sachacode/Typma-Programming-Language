(** The file for using extracted cor functions *)
open Core
open Lig
open Typ.Typma

let ast filename =
  let c = filename
          |> Stdlib.open_in
          |> Lexing.from_channel
          |> Parser.prog Lexer.tokenize in
  print_endline ("Program parsed as: " ^ ToString.string_of_com c); c

let bs c =
    print_endline
      begin match ceval_step (t_empty (TNat 0)) c 256 with
        | Some _ ->
          ":)"
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