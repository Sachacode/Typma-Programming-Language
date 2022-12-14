(** The file for using extracted cor functions *)
open Core
open Lig
open Typ.Typma

(* let expression for reading file and generated the AST *)
let ast filename =
  let c = filename
          |> Stdlib.open_in
          |> Lexing.from_channel
          |> Parser.prog Lexer.tokenize in
  print_endline ("\nProgram parsed as:\n" ^ ToString.string_of_com c); c
  (*print_endline ("0");
  let c = Stdlib.open_in filename in print_endline ("1");
  let d = Lexing.from_channel c in print_endline ("2");
  let f = Parser.prog Lexer.tokenize d in print_endline ("Program parsed as: " ^ ToString.string_of_com f); f*)

(* let expression for evaluating an AST and printing the output *)
let bs c =
    print_endline
      begin match ceval_step (t_empty (TNat 0)) c 256 with
        | Some _ ->
          "owarida/finished"
        | None ->
          "My name is Yoshikage Kira. I'm 33 years old. My house is in the northeast section of Morioh, where all the villas are, and I am not married. I work as an employee for the Kame Yu department stores, and I get home every day by 8 PM at the latest. I don't smoke, but I occasionally drink. I'm in bed by 11 PM, and make sure I get eight hours of sleep, no matter what. After having a glass of warm milk and doing about twenty minutes of stretches before going to bed, I usually have no problems sleeping until morning. Just like a baby, I wake up without any fatigue or stress in the morning. I was told there were no issues at my last check-up. I'm trying to explain that I'm a person who wishes to live a very quiet life. I take care not to trouble myself with any enemies, like winning and losing, that would cause me to lose sleep at night. That is how I deal with society, and I know that is what brings me happiness. Although, if I were to fight I wouldn't lose to anyone."
      end

(* let expression for fuzzing the parser*)
let ast_fuzz x =
  print_endline ("\n" ^ string_of_int x ^ " iterations");
  for i = x downto 1 do
    print_endline ("Program " ^ string_of_int (x-i+1));
    let p = Fuzz.r_cmd (Random.int 5) 5 in print_endline (p);
    let c = p
            |> Lexing.from_string
            |> Parser.prog Lexer.tokenize in
    print_endline ("\nProgram parsed as:\n" ^ ToString.string_of_com c ^ "\n")
  done

(* command for running a file *)
let runbs =
  Command.basic
    ~summary:"typma evaluation."
    Command.Param.(
      map
        (anon ("filename"%: string))
        ~f:(fun fn _ -> fn |> ast |> bs))

(* command for fuzzing *)
let runfuzz =
  Command.basic
    ~summary:"typma parser fuzzer."
    Command.Param.(
      map
        (anon ("x"%: int))
        ~f:(fun fn _ -> fn |> ast_fuzz))

(* cerates the commands *)
let command =
  Command.group
    ~summary:"An interpreter for typma."
    ["-typma",runbs; "-fuzz",runfuzz]
  
let () = Command_unix.run ~version:"1.0" command