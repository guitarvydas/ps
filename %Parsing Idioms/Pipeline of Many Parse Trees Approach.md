![[grammarmap-tree transformation.png]]

1. Use a parser to match an incoming text file
	1. create a new text file (which is a flattened tree, a *stream*) for use by the next pass in the pipeline
2. The next pass focuses on exactly one task and is driven by walking its input and firing *hooks*
	- The tree for this second pass is not exactly the same as the original tree, the 1st pass has pruned *syntactic sugar* from the tree, to make it easier for this 2nd pass to parse / operate and to focus on only one specific task
	- this 2nd pass creates yet another new text file for use by the next (3rd) pass
	- example: collect up all function definitions
	- example: collect up all global variables
	- example: collect up all parameters to functions
	- example: collect up all local variables declared inside functions (and stick them into a map related to the corresponding function)
3. Successive passes are much like the 2nd pass
	- each pass "modifies" the tree and passes down the pipeline
	- each pass focuses on doing only one specific task
	- example: check that every variable used has been declared, e.g. as a global, a local, a parameter, etc.
	- example: determine scoping within functions, maybe make maps of maps that describe the scopes and the local variables declared within them
	- example: create (emit) code that corresponds 

In the above diagram
- each arrow is a unique mini-DSL
- each cone is a parse tree
- each pass contains a parser and a bunch of hooks that correspond to one task
- each pass is composed of a parser which reads the input mini-DSL and creates an internal parse tree, the parser pattern-matches the mini-DSL against its internal AST and creates a pruned CST, then walks the CST and calls hooks that correspond to a specific task
- the sequencing of the hook-calling is driven by the mini-DSL
	- this is called syntax-directed translation
	- it's that same as calling *methods* on an OO object, but the time-sequencing is built into the mini-DSL
		- I find it easier to follow the intended control flow by reading an AST than by reading an abstract OO class definition
		- in fact, I think of OO classes as static data, whereas I think of parse trees and walking parse trees as *control flow* (AKA sequencing) [[Control Flow in Parsing]]
	- 