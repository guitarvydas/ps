A *toolbox* language is a language that provides all of the atomic elements needed to compile any (most) programs, but has little syntax of its own.

Assembler languages are the traditional toolbox languages.  Assembler statements are line-oriented triples:
1. operator
2. subject operand
3. object operand

E.G. `MOV R0,R1` is a triple, with a clean separation between the operator (`MOV`) and the supplied operands (`R0` and `R1`).

Lisp is very much like this.  The "syntax" of Lisp is normalized.  Everything looks like a function call (except atoms, Lisp isn't perfect) and every apparent function call results in a value.  Lisp is an *expression language*.

Other languages tangle bits of syntax up with their utility as toolbox languages.  Most other languages are not *expression languages* and require explicit `return` syntax for creating non-void values.

I argue that it is possible to create a - very simple - syntax that can be transpiled into most any existing language.  The benefits of doing this are:
1. portability
2. no need to write full-blown compilers - existing compilers can be used 
3. rapid creation of new languages, with an attendant change in attitude as to how languages might be used.  I argue that a single project should have multiple, application-specific sub-languages, designed for it and all aspects of the solution.  I use the term SCN (Solution Centric Notation) for these sub-languages, to emphasize that they are lighter-weight than our current notion of what a programming language is.

To devise such a portable syntax, we need:
- operations
- operands
- lists of operands
- verbatim ("don't touch me") embedded syntax.

These requirements boil down to a very simple syntax:
- operations can be any phrases, and, can be transpiled by the likes of Ohm-JS into existing languages
- operations can be nested, like `cond`, to contain, recursively, other low-level operations and phrases
- operands can be fashioned on existing techniques for describing Objects, and, Object attributes and methods
- backquote [[../2022-06-05-Lisp Backquote]] to allow for "don't touch me, except ..." syntax.

Based on the above considerations, we might imagine a *toolbox language* to have the following syntax:

## Operands
An operand is 
- a name
- a dotted name (recursively)
- a low-level atomic string of characters surrounded by double and single quotes
- a low-level atomic number consisting of one-or-more digits
- - *symbols*

## Lists of Operands
- a list of operands is enclosed in square brackets `[` ... `]`
## Dictionaries of Operands
- a dictionary is enclosed in brace bracket `{` ... `}`
- a dictionary contains a set of pairs, whitespace separated (no commas)
- each pair consists of a *symbol*, a colon `:` character, an operand 
## Operations
## Verbatim
```
❮ d e f ❯
```
## Backquote Verbatim
Unlike Lisp, we are not mixing quoting with evaluating.  We are not creating lists, we are creating text and always splicing the result in.  Hmm.
```
a b c ❮ d e f ❯ g h i ⟪ d e f ⟫
```



