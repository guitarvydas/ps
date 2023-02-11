Title: No Code  
Author: Paul Tarvydas

# No-Code #

No-Code can only work for problems we have already beaten down (3 times, see Mythical Man-Month), e.g. accounting packages and websites.

CASE[^fn1] "died" because it could only handle problems that were beaten down at the time, e.g. accounting packages.

No-Code will also "die" because it can only add websites to the mix of already-beaten-down problems.

No-Code cannot handle "new problems".  Historically, programming has attacked "new problems".  That's why software is hard to estimate - software attacks the kinds of problems that have never been solved before.

Handling "new problems" was done by creating HLLs which spit out assembler.  Assembler programmers hated HLLs.  Then they retired.

The way forward is: assume that ALL current programming languages are assemblers, and create new-breed HLLs that emit such assemblers.  "Good" assembler languages are ones that are easy to emit, e.g. languages that do not require declaration-before-use, that do not have strong-typing, that provide 1st class functions, that provide anonymous functions.  E.g. Lisp and JavaScript.

The "new and unexplored" domains are concurrency (concurrency is not parallelism - see Rob Pike's talk), isolation,[^fn2] diagrammatic syntax.  Diagrams that compile to code, not the other way around (like plantUML, GraphViz, etc.).  I call this DaS (Diagrams as Syntax).

[Aside: I know that concurrency, isolation and diagrammatic syntax are possible, since I've built big (production, not toy) systems like this.  I am willing to share this knowledge.].

FBP[^fn3] is about concurrency.  EVERY component is concurrent.

HTML webworkers are about concurrency.

New-breed HLLs will riff on these ideas: concurrency, isolation, DaS.



[^fn1]: Computer Aided Software Engineering.  In vogue in the 1980's.

[^fn2]: Isolation - my word - is uber-encapsulation, first tried in UNIX and other operating systems.

[^fn3]: FBP = Flow Based Programming, https://jpaulm.github.io/fbp/
	
	fbphq.slack.com
	
	https://groups.google.com/g/flow-based-programming