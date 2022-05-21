## How a Compiler Works
In more formal circles, the pattern-matching script is called a *grammar* and the implementation details script is called the *semantics*.  In general terms, this is what a *compiler* does:
1. a compiler pattern-matches incoming program text
2. a compiler rewrites and reformats the matched bits of the program text to produce a final script.

A compiler actually does a lot of work in step 2 (rewriting), such as checking for silly errors (AKA *type checking*) and figuring out what the rewritten code must look like for every target CPU (AKA code emission).  The principles are the same, but the details are different.
