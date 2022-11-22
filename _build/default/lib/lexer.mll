{
	open Parser
}

(* add strings, helper stuff*)

let id = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9']*
let num = ['0'-'9'] ['0'-'9']*
let str = ['a'-'z' 'A'-'Z' '0'-'9']*
let whitespace = [' ' '\t' '\n']

rule tokenize = parse
     | whitespace { tokenize lexbuf }
     | "(" { LPAREN }
     | ")" { RPAREN }
     | "{" { LBRACE }
     | "}" { RBRACE }
     | '"' { read_string (Buffer.create 17) lexbuf }
     | "+" { ADD }
     | "-" { SUB }
     | "*" { MUL }
     | "/" { DIV }
     | "!" { NOT }
     | "||" { OR }
     | "&&" { AND }
     | "==" { EQ }
     | "<" { LT }
     | "skip" { SKIP }
     (*| "print" { PRINT }*)
     | ":=" { ASGN }
     | ";" { SEMICOLON }
     | "if" { IF }
     | "else" { ELSE }
     | "while" { WHILE }
     | "true" { BOOL true }
     | "false" { BOOL false }
     | num as z { INT (int_of_string z) }
     | id as x { VAR x }
     | eof { EOF }

and read_string buf =
  parse
  | '"'       { STR (Buffer.contents buf) }
  | '\\' '/'  { Buffer.add_char buf '/'; read_string buf lexbuf }
  | '\\' '\\' { Buffer.add_char buf '\\'; read_string buf lexbuf }
  | '\\' 'b'  { Buffer.add_char buf '\b'; read_string buf lexbuf }
  | '\\' 'f'  { Buffer.add_char buf '\012'; read_string buf lexbuf }
  | '\\' 'n'  { Buffer.add_char buf '\n'; read_string buf lexbuf }
  | '\\' 'r'  { Buffer.add_char buf '\r'; read_string buf lexbuf }
  | '\\' 't'  { Buffer.add_char buf '\t'; read_string buf lexbuf }
  | [^ '"' '\\']+
    { Buffer.add_string buf (Lexing.lexeme lexbuf);
      read_string buf lexbuf
    }
  (*| _ { raise (SyntaxError ("Illegal string character: " ^ Lexing.lexeme lexbuf)) }
  | eof { raise (SyntaxError ("String is not terminated")) }*)