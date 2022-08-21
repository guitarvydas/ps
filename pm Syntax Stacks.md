Using top-down-parsing technologies and advances like PEG and Ohm-JS, it is possible to build textual programming languages in small, stackable steps.

At the bottom-most layer, I define *verbatim* code.

The idea of *verbatim* code is to allow inclusion of code snippets in any language in a program script.  This idea has been seen before in the form of `#asm` statements in the C programming language.

For example
```
temp ⟪g.createSemantics ()⟫ ⇉ sem
```
consists of a `temp` declaration and contains a snippet of Javascript *verbatim* code `g.createSemantics ()`.  The meaning and format of this `temp` declaration is discussed elsewhere.  For purposes of this note, only the embedded *verbatim code* is of interest.

# Syntax Stacks
SCNs[^scn] - my word for "mini-DSLs" - can be built up in an incremental, layered manner at the syntactic level.

Each syntactic layer defines one SCN that is aimed for one - and only one - specific purpose.  This is contrary to the notion of GPLs (General Purpose Languages).

For example, the code (see appendix) defines only the bare minimum necessary to
1. define software components (`comp`, ports, `leaf`, etc.)
2. a set of common programming language constructs expected to be supported by most existing programming languages, e.g. `temp`, `do`, `if`, `send`.

In most cases, the above subset is not enough to specify a full program.  In such cases, we embed *verbatim code* in some other programming language to "do the rest".

Our SCN specifies the bare minimum to support software components, then is transpiled to a target language (in this case Javascript).  The *verbatim code* is left as-is, and, only the *verbatim* brackets are stripped off.  The result is a full program in the target language (in this case Javascript) which can then be compiled using existing compilers.

We should be able to *stack* such SCNs and produce a final resulting program.  In the example below, the stack is three (3) deep
1. transpile higher-level *component* code to lower-level target code (in this case Javascript, I imagine that it would be possible to target Python, Rust, etc.)
2. convert compound identifiers into a form accepted by the target language, e.g. in this case, I targetted Javascript, so I converted all spaces in names to underscores `_`
3. strip off *verbatim* brackets.

Note that step (1) could transpile to toolbox code, which would necessitate the addition of at least one more transpiler to the stack - transpilation of toolbox code to the target language.  I imagine that the toolbox pseudo-code language would contain constructs common to all modern programming languages, like first-class functions, persistent variables, etc.  TODO: define a basic toolbox language based on the union of common functionality found in modern programming languages.  TODO: rename this software-component language to something other than `.tbx`, e.g. `ctbx`, which transpiles into `.tbx`.

[^scn]: SCN mean Solution Centric Notation

# Github
[tbx (toolbox)](https://github.com/guitarvydas/tbx)

See the Makefile, and, `transpiler.tbx`.

The formattting program code in this directory is written in `.fmt` syntax.  This syntax is a shortcut for generating `.js` *semantics* code for Ohm-JS programs.  The code could be written out in longhand as Javascript namespaces containing functions, as required by Ohm-JS, but the shortcut syntax is used to elide boiler-plate details that clouds the explanation of the bare essence of this conversion process.