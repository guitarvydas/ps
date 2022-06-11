Both, REGEX and parsing are pattern-matchers.

REGEX is a DSL for pattern-matching characters in a string.

PEG is a DSL for pattern-matching characters in a string, plus, its syntax allows making recursive subroutines for matching.  

LR(k) (YACC, etc.) is *not* a DSL for pattern-matching, but is a formal description of programming languages.  LR describes languages from the bottom-up, whereas LL describes languages from the top-down.  

You can use formal descriptions of programming languages to create parsers, but this is not the same as using DSLs for generating parser code.

In many ways, the results are the same, but, not at the edges.

PEG can describe language parsers that can match balanced parentheses, e.g. "(" ... ")".

REGEX cannot describe matches that need nested parentheses, since REGEX does not use a push-down stack for recursion.

LR cannot describe languages that need matched parentheses, because of the kinds of formalisms used.

REGEX DSL syntax is succinct, albeit usually write-only.  It is easier to write a pattern match in REGEX syntax, but, it is more difficult to understand what someone else has written.

PEG syntax - akin to BNF - is less succinct but can express matches that can't be easily expressed in REGEX.

PEG can describe matches that can't be described using LL and LR language specifications.

Ohm-JS is a better PEG.

Ohm-JS (PEG) opens up new possibilities for pattern-matching languages.  Using Ohm-JS, it is possible to create syntax stacks succinctly.  This kind of matching is not easy (or impossible) with REGEX.  Language theory - LR and LL - makes it necessary to specify every nuance in the language, which makes it difficult to create syntax stacks.

For example, Ohm-JS can be used to parse matched parentheses and "anything else in between" without needing to know what the "anything else" is.  With Ohm-JS, you don't have to specify what the contents of "anything else" are, you simply specify that no parentheses appear within the "anything else".  If parentheses do appear in the "anything else", the pattern can be re-started and applied recursively.

A parenthesis matcher might be written as
```
balanced {
  main = matchedparens
  matchedparens =
    | matchedparens? "(" matchedparens ")" matchedparens? -- rec
    | anythingelse+                                       -- bottom
  anythingelse = ~"(" ~")" any
}
```
A screenshot of this pattern matcher is seen below

![[balanced paren Screen Shot 2022-06-06 at 6.17.49 PM.png]]
One of the possible uses of a balanced-braces parser might be to insert path-testing code after every open brace in a C program.  Using a balanced-braces parser means that you don't have to write a grammar the understands all of C, but only looks for brace brackets.

[[Snake Game]]

[REGEX](https://guitarvydas.github.io/2021/04/24/REGEX.html)