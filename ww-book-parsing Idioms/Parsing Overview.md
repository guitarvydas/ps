Parsing is like walking a tree.

Making a language transpiler is like adding methods to an OO object.

A *parse tree* is like an OO object, that has a certain structure.  The structure isn't magic, but, it has taken years of experience to hone the structure into its most common form:

[[Parse Tree]]

In OO, we define general data structures, like trees and lists, etc.

In parsing, thwe build a data structure that is of a very specific form - a parse tree.

A parser converts input data - usually text - into output data, a parse tree.

In parsing, there are two (2) kinds of trees
- AST - abstract syntax tree
- CST - concrete syntax tree.

An AST "covers all bases".  An AST describes all *possible* combinations of valid input.

A CST, on the other hand, describes the *exact* match of a specific input to the AST.  A CST contains no extra detail of "what could have been" and instead contains detail about "what is really there".

For example, a compiler writer creates an AST of possibilities.  When programmers use the compiler, they feed a specific program (say a C++ program) into the compiler.  The compiler checks the program against its internal AST and creates a CST which represents the input program, and, prunes out all of the possibilities that weren't actually in the program.

Compiler-writers' jobs consist of hanging bits of code onto the nodes of the AST.  "If you see one of these, do this".  "If you see many of these, do this, but do it repeatedly / recursively".  Etc, etc.

To make life simpler, compiler-writers use the principles of *divide and conquer*.  In the simplest case, compiler-writers attach baubles of code to nodes of the AST.  In the spirit of divide-and-conquer, compiler writers might re-use the AST and hang different sets of baubles onto the tree, to do different tasks.  For example, 
- One task might consist of looking for all definitions of functions, and, recording them.  
- Another task might consist of looking for all definitions of local variables within each function.  
- Another task might consist of checking every *use* of each function.  A first-order check might be to see that the correct number of arguments is passed to each function call.  A deeper check might be to see that the arguments have the correct type, etc.
- Another task might be to check every *use* of every variable.  A first-order check might be to confirm that the variable name is "in scope" and hasn't been mis-typed.  A deeper check might be to see that every variable has a consistent type and is used the same way everywhere.
- Another task might be to assign (allocate) a location for each variable.  Figure out if the variable is local or global or a parameter.  Figure out *where* in the space it belongs (for example if global variables are stored in RAM, then figure out the byte index for each unique global ; if the variable is a parameter, figure out its De Bruijn index ; etc.)
- Another task might be to figure out the assembler phrasing that will access each variable.
- Another task might be to optimize accesses to variables.  If the CPU needs to expend CPU time to figure out where a variable is (e.g. using indirection), then optimize the code so that the calculation is done only once and re-used.
- Another task might be to *peephole* the assembler code.  Pattern match sequences of instructions and replace common patterns by more-efficient patterns.
- etc.


[[Syntax Directed Translation]]