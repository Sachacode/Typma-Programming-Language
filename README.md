# README

## Replication Instructions

This project uses OCaml and Coq, OCaml is a depenancy for Coq, and all commands are for a Mac system because I work on Mac.

Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Install Opam: this installs OCaml
```
brew install gpatch
brew install opam
```
Create switch for Coq enviornment
```
opam switch create coq-8.12.0 ocaml-base-compiler.4.11.0
```
Utop contains many important dependancies.
```
opam install utop
```
Install Coq
```
opam pin add coq 8.12.0
```
Check installation
```
coqtop
```

[Install VSCode](https://code.visualstudio.com/)

[Install Coq plugin](https://marketplace.visualstudio.com/items?itemName=maximedenes.vscoq)

## Running the Interpreter

Before running the Typma interpreter, run this command in the project file directory and to install any dependencies for the codebase
```
dune install
```

This command complies the code without running it, the extraction is ran in this command
```
make
```

This command deletes the build files
```
make clean
```

To run one of the test Typma programs, run this command in the project file directory, change the number to the desired file.
```
dune exec ./bin/main.exe -- -typma tests/test0.typ
```

To run the fuzzing program, run this command in the project file directory, change the number to the desired amount of iterations.
```
dune exec ./bin/main.exe -- -fuzz 100
```

## Code Architecture Overview

This project's organization is based on a simple OCaml project design.

The main directory has five folders: build, tests, lib, dep, and bin. 

The build file is where the OCaml code is complied, and all of the files in the build folder are generated and were not written by me. 

The tests file is where the basic Typma test programs are found. 

The lib file is where the parser and lexer are located: 
- lexer.mll: takes in the string with the text from a Typma program and turns it into tokens. 
- parser.mly: takes the tokens and parses them into an AST to be used by the evaluation code. 
- toString.ml: outputs the string representation of the AST.

Typma's parser is an application of the libraries OCamllex and Menhir, and does not deviate from a basic application of those tools. The dune file here and in every other folder is apart of the dune build system for compiling the OCaml code and contains the libraries each folder uses.

The dep file is where the Coq files are located and extracted into OCaml files and has 3 sub folders: build, lib, and extarct.

The dep/lib folder has the files Typma.v and Sus.v:
- Typma.v: the file for the evaluation and proofs for Typma containing the syntax rules, Typma calculus conversions and operations, expression evaluation, inductive proposition, and proof, and command evaluation, inductive proposition, and proofs.
- Sus.v: the wrapper type for strings to avoid extraction issues that cause bugged OCaml code

The proof for command statements is split into three parts: ceval_step__ceval, ceval__ceval_step, ceval_and_ceval_step_coincide. c_step_more is used for some cases of ceval__ceval_step. This is needed because writing this as a single proof leads to a case of infinite recursion resulting from an infinite while loop. An extra parameter is added to the function, inductive proposition, and proofs which is a number that decrements every time a recursive call is made, eventually this will hit zero and the function will return none indicating an infinite loop and bypassing the infinite recursion. ceval_step__ceval and c_step_more are lifted from Software Foundations: Logical Foundations chapter ImpCEvalFun.v but modified to work with the Typma type. ceval__ceval_step is my answer to the exercise from that section and is my original code.

The dep/extract folder has Extract.v:
- Extract.v: the extraction process is carried out and explicitly changes the order of the arguments of the substring function to be compitable with OCaml and OCaml print statements are added

The dep/build folder is where the results of the extraction are located. There are a lot of generated files but the main ones are Typma.ml and Sus.ml, which are the OCaml versions of the Coq code without the inductive propositions and the proofs.

The bin folder has main.ml:
- main.ml: this is the file that brings all the pieces together, the command line arguments are defined here and the required functions from the other files are placed in a pipeline to be used

Here is a diagram of how the files are used when a command is ran.
```
dune exec ./bin/main.exe -- -typma tests/test0.typ
```
main.ml -> test0.typ -> lexer.mll -> parser.mly -> Typma.ml

```
dune exec ./bin/main.exe -- -fuzz 100
```
main.ml -> lexer.mll -> parser.mly
