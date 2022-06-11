Oh, the irony!

The premature-optimization clique convinced programmers that interpreters were "too slow" and that compilers should be used instead.

Now, 50+ years down the road, we find that premature-optimization has resulted in:
- workflows that are too slow
- Mb of bloatware
- techniques that are so complicated that they can't be explained to the majority of professional programmers (think website makers, game makers, JS crafters, etc.)
- acceptance of buggy products - programmers just ship and update weekly, forgetting Q/A

The implication is obvious:
- don't use compilers until you have designs fleshed out and fully working[^dyn][^pl]

[^dyn]: It is OK to use dynamic languages to experiment with and develop designs.  The idea that you know everything about a design without experimentation is called The Waterfall Method.  This, The Waterfall Method, is what is considered to be "programming" currently. Programmers dive into a project with the assumption that they will succeed.  The infrastructure for intermediate failures is not built up, programmers jump directly to optimizing designs (which are, at first, untested designs).

[^pl]: Note that this statement does *not* say "do not use programming languages".  It simply says that compilers are for optimization and that optimization is the final step in productizing a software app. (I say "don't use programming languages", elsewhere 😀)

Use compilers only when you need to Production Engineer a Design.

Failing that, buy a faster development system and keep complaining...

# Efficiency

"Efficiency" is in the eye of the beholder. 
1. If you are Designing a piece of software, then "efficiency" equates to turn-around time based on using a souped-up development machine.
2. If you are Production Engineering a piece of software to hand to clients, "efficiency" means making the result runnable on low-cost hardware (or lowering the cost-to-the-user)

# Sector Lisp, FP in < 512 Bytes
FP (Functional Programming) can be small and beautiful.  

Sector Lisp is smaller than 512 bytes ([sic], not K, not M, not G, but bytes) on current hardware.

Explain why your favourite language *needs* to be larger and slower than this.

Compiler-writer addage: the only good optimization is one that makes the overall code smaller, when the code for the optimization is included in the code base.

# Forgotten
Programming is about making (electronic) machines do repetitive tasks for humans, in any way possible.

There is no rule that says that programmers *must* use characters and text to write programs.  

CEOs and visionaries use white-boards and napkins.  

We would *prefer* that our machines would tighten-up the process of Design, at least a bit.

We can use manual methods until automated transpilers appear.

# Notation Worship
Programming language design has become a cult of notation-worship, where, for no good reason, it is presumed that programming notation must consist of grids of non-overlapping sequential small bitmaps, as invented in the mid-1900s.

This technique hasn't been updated to take into account 202x hardware advances.

# Error Checking - Silly Mistakes
Yes, we would prefer that machines check our work for silly mistakes.  

We already have syntax checkers.  

Types are more-of-the-same kind of checking, but, currently, result in bloatware.  

In developing projects in JavaScript, I found that a large majority of my bugs could have been caught - rapidly, using few CPU resources - if the system simply checked for simple type violations, like number-of-parameters to functions.

I didn't need full-blown type-checking, I didn't need TypeScript.  I just needed something that would have caught my typos and alerted me to them (e.g. "function defined to take 3 args, but only 2 args were given in line XXX").

Most programming languages already do this.  JavaScript doesn't[^strict].  JavaScript provides a default value for missing parameters (i.e. "undefined").

[^strict]: I am purposefully ignoring *strict mode* and *typescript*.

# 5-Line Programs
Programs that are only 5 lines long don't need type-checking and local variables.  

The goal shouldn't be to appease the act of building 6-line programs, but, to ensure that programs do not grow beyond 5 lines in length.  

Silly?  Q: What is the average length of a TensorFlow script written in Python?

[5 is just a ball-park number meant for emphasis.  Font size and window size play roles in locality-of-reference.]

[[Essays/5 Line Programs]]

# Why Don't We Use Diagrams For Programming?

Why don't we use diagrams for writing programs?  

A: because mid-1900s hardware did not support inexpensive overlapping bitmaps.

# Dependencies
Why do we have *any* dependencies between software components?  

Our programming languages, supposedly higher-level than assembler, should inhibit, not encourage, the creation of dependencies.  

Depedencies come in several flavours, e.g.
- hard-wired names of called functions
- synchronocity-under-the-hood
- CALL/RETURN.

Programmers can make it their goal to expunge all dependencies.  

Eating dogfood: expunge the use of *make*, *npm*, *packages*, *package managers*, using CALL/RETURN to invoke code libraries.

## Gedanken Exercises
1. You have an apple and a ball on the table. You cut the apple in half. What happens to the ball? Does the ball depend on the apple?  

2. You have a 2-story castle built out of LEGO pieces.  You carefully remove the top-most piece and cut it in half.  What happens to the castle? 

3. You have a main piece of software that calls a library.  You make a change to the library.  What happens to the main piece of software? Can you *guarantee* that the main piece does not change?

Humans understand the notion of independence and free will.  Programming does not, easily, support independence and defies human intuition.  I argue that this is a main reason as to why programming is considered difficult - programming defies our intuition.

# Simplicity - How Do You Build A Light Airplane?

How do you build a light airplane? 

1. Build an airplane, 
2. Add lightness. 
 
L. J. (Ted) Rootham.

I.E. If you want something simple, start out with something simple.  Adding baubles will not make something simpler.

The things that we call *programming languages* are simply notations for viewing and describing aspects of programming.  As soon as a notation appears "difficult", programmers should switch to another notation instead of trying to force-fit all views of a problem into one notation.  As already mentioned, Sector Lisp is an example of how simple a notation can be and how complex that same notation can become when force-fitted into situations that it does not describe well (e.g. functional programming vs. mutation and heaps and distributed programming and etc.).

What else is considered "difficult" today and could use a different notation?  Multi-tasking, for one. The presence of dependencies, for another.

# Suggestion: Type Checking Design Rules
Another suggestion: Do what compiler-writers did when they only wanted YACC to help, but didn't want all of the niggly details that came with using YACC.  They used YACC to error-check their grammars, then they rewrote the grammars in another programming language.  

Likewise, if ultra-type-checking helps you create a Design, use a language that gives you ultra-type-checking (e.g. Haskell) to check the consistency of a Design, then rewrite the code in some other language (e.g. JavaScript).  You are responsible to not hack on the rewritten code, if you ever want to change the Design and have it re-checked.  This is not a huge problem.  If programmers were to use Haskell->other-language-transpilation enough, someone would automate the process.  Better yet, someone will find a better way to express type-checking than using full-blown Haskell.

Yes, it would be nice to have type-checking integrated into the Design loop, separated from compilation, but we're not there yet.  

Still, some kind of checkable design rules might might be more useful than ad-hoc white-boarding.  

ATM, I draw my designs in draw.io, then hand-compile to JS/Python.  With Ohm-JS to help me, this is so easy that I haven't bothered to close the loop to use diagram-parsing technology to automate these steps.

# Warping Programming Languages To Allow Compilation
Don't let the premature-optimization clique tell you what techniques can and cannot be used (e.g. REPLs) for programming.  

Ask them them to build lint-ers instead of arguing that programming languages need to be altered for their whims.

Ohm-JS, PEG, TXL make the process of writing syntax-driven lint-ers easier. 

# Appendix References
[Sector Lisp](https://justine.lol/sectorlisp/)