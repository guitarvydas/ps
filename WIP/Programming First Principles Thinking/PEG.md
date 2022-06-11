Balanced parens.

Theory vs. DSL for parser-building.


YACC -> theory for language -> parser from language spec.

PEG -> DSL for parser coding -> parser from transpilation of DSL.

Examples

LR(k): `a+` means one-or-more `a`s in the language. -> code created to match one-or-more `a`s.

PEG: `a+` means create code to pattern-match one-or-more `a`s