A *parser* is an app (program) that walks input text and produces a data structure.

The data structure is usually called a *parse tree*.

There are at least two (2) kinds of parse trees:
- AST
	- abstract parse tree
	- lists *all* possible patterns for matching input text
	- used as the internal structure for parsers, compilers, etc.
- CST
	- concrete parse tree
	- a data structure that represents the input program
	- usually created by applying the AST to the input program
	- a CST is a strict subset of the original AST, but pruned to contain only nodes that pertain to the specific input


A parser creates a bare parse (usually a tree) and leaves holes in it for hooks, like semantics checking, code emission, etc.
