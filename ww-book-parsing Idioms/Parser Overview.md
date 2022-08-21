![[parsing-parser.png]]

A parser converts input text into a tree - a CST.

Programmers use AST's to help with building, and specifying, parsers.

Some parsers are built using Language Theory, using language specifications to drive the construction of parsing programs.

Some parsers are built using ad-hoc techniques in GPLs (General Purpose Languages).  "Parsing combinators" were invented to help make parser-building less ad-hoc.

Some parsers are built using parser-building DSLs.  PEG, and Ohm-JS, are DSLs for describing parser programs.

Language Theory does not describe all languages and, hence, can only build parsers for a subset of languages (called CFGs).

Ad-hoc parsers result in the most general and flexible parsers, but, the process of building programs in an ad-hoc manner results in bugs and unanticipated gotchas.

PEG-based parser generators can describe more languages than Language Theoretic methods.  An interesting case is that PEG-based parsers can match balanced brackets, whereas Language Theoretic parsers cannot express such concepts.  

The ability to match balanced brackets enables a different way of thinking and a new class of pattern-matching operations.  I describe one such program in #parsingC. 
