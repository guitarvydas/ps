![[plsuccessiverefinement.png]]

The final structured text
- contains primitives for creating λs
- contains *phrases* (macros) in some macro language.


Emit JS
- convert λs to JavaScript
- convert phrases to JavaScript


In the end, we want to target a *toolbox* language - an assembler-like language that provides conveniences like first-class functions, etc.  Syntax should be split into two (2) orthogonal parts
1. operations (phrases)
2. operands (OOP-like objects)

The *toolbox language* should have as little syntax as possible (to make emitting to it easy) and should not insist on declaration-before-use.  Like assembler, a *toolbox language* should be multi-pass:
1. collect definitions
2. check references to defined entities.

It is easier if the toolbox language is *dynamic*.  Humans should not have to use the *toolbox language* directly.  Pre-processors/transpilers/compilers can check syntax and types, then emit machine-readable *toolbox* code.

*Static* languages are *dynamic* languages that have been optimized.

As with present-day compilers, optimization should be performed by machines, hence, the *toolbox language* should be machine-readable-and-writable, and, should not appease human users.

Portability.  Portability should be provided by plugging different emitters into the chain, instead of hard-wiring features into the higher-level languages (like *pragmas*, *features*, etc.)
