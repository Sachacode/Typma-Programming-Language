{
	open Parser
}

let id = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9']*
let num = ['0'-'9'] ['0'-'9']*
let whitespace = [' ' '\t' '\n']

rule tokenize = parse
     | whitespace { tokenize lexbuf }
     | "(" { LPAREN }
     | ")" { RPAREN }
     | "{" { LBRACE }
     | "}" { RBRACE }
     | "+" { ADD }
     | "-" { SUB }
     | "*" { MUL }
     | "/" { DIV }
     | "!" { NOT }
     | "or" { OR }
     | "and" { AND }
     | "=?" { EQ }
     | "<?" { LT }
     | "skip" { SKIP }
     | "print" { PRINT }
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
