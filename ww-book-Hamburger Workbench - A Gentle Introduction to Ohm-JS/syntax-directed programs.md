Syntax-directed programming is a variant (a superclass?) of *pattern-matching* - a technique which is currently favoured by the functional programming camp.

Parsing is *pattern-matching*.

Grokking is *pattern-matching*.

Parsing was explored in the compiler development camp, but was subsequently tainted as a compiler-only paradigm.

We use REGEX in modern programming languages, but we don't think of REGEX as a compiler-only DSL.  However, REGEX was originally used in compiler development (scanners, tokenizers, LEX).

Now, Ohm-JS allows us to jailbreak more compiler technology out and use it for day-to-day programming instead of using it just for compiler-building.

Syntax-directed programming is the idea of building a lot of little DSLs and feeding them to each other in a pipeline.  

Building DSLs is a breeze in Ohm-JS using the Ohm Editor.  

Anyone can do it, not just compiler gurus.

We hang "hooks" off of the DSL syntaxes and cause chain reactions of snippets of code, driven by incoming serialized parse trees.

Each *pass* in the pipeline does one job, and emits a modified, new DSL for downstream consumption.  For example, the semantics front-end of a compiler might gather up all declarations and expunge declaration syntax from the newly-generated DSL.  Downstream passes don't need to worry about (nor skip over) declaration code, since it gets filtered out of the pipeline.

An early form of this technique can be seen in the PT Pascal Compiler (and subsequent compilers for various languages).

RNA (the molecule associated with reading DNA) is a parser - a syntax-directed parser (where the DNA is the "syntax").