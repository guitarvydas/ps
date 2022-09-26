# Short Programs - As Short As Possible
For me, the ultimate program is 1 line long.

5 lines is “acceptable” but not as good.

6 lines or more is “ridiculously complicated”.

Static typing and compiler-appeasement languages try to solve the problem of how to allow programs to be >5 lines long.

I am interested in a different problem - how to keep ALL programs to <= 5 lines long.  Hiding types (eliding them) allows programs to be shorter .  The programmer should not be forced to help the compiler figure out types (maybe this is what I mean about ML type inferencing).  Especially when this means making programs longer.

(I don’t mean 5 and 6 iterally, but those numbers make people laugh out loud (uncomfortably) and think (I hope)).  I probably mean "eye-full" where a WHOLE program fits on one screen / or one window.  The meaning of this changes as hardware gets better (and is changing again, as I get older and need to use reading glasses :-)).  If I can see the whole program in one window, I can see all of the "types" within a program, and, I can use simpler type-checkers

# Sector Lisp
Sector Lisp has EXACTLY 2 types - Atom and List.  This needs only 1 bit to represent, and, causes little in the way of code bloat due to type unrolling.

S/SL and Lisp showed me - early on - that it is POSSIBLE to elide types.  Not to eliminate types, but to push them down to a lower layer, allowing the upper layers to be written while "in the zone" (aka "flow") without sweating the details, knowing that the details will be handled later.

My exposure to State Machines taught me that State Explosion is a bad problem.  I see the same thing happening in the Static Language world. David Harel fixed State Machines in StateCharts.  I argue that we need to fix types in a similar way (layers, ellision, type stacks, type pipelines).

Lisp + Ohm-JS combines to solve the problem that I think is important - how to write a program using very few lines of code, while retaining full power.  To me, diagrams are more expressive than text, so, to me, diagrams as syntax (DaS) are part of the answer.  My ideas about FDD (Failure Driven Development) also aim at this problem.  I don't just write programs, I write programs that write programs.  When I write a program that writes a program, I can get a whole lot of power with very little "code".  I can keep crushing the "code" down to be just 1 line long and have Ohm-JS expand it out it a big pile of executable code.  PEG (hence, Ohm-JS) lets me do this in layers - I can do a little bit of writing-code-that-writes-code at a time, and build up from there. 

Lisp macros are a lot like that, but, Lisp macros only work on trees (aka Lists).  Ohm-JS works on characters.

My infatuation with PROLOG has a similar bent.  PROLOG uses very few lines to express grokking.  The PROLOG engine does the work, I don't.  I get to think and express solutions at a higher level.

An undercurrent in my thinking, is the belief that it is impossible to deal with all of the issues using only ONE language (notation, SCN).  Given that belief, it is easy for me to imagine picking-and-choosing what I find useful in various languages and solving partial problems (aka Divide and Conquer).  Then, plumbing all of such mini-solutions into one big whole solution.

UNIX /bin/sh (bash, etc.) allows you to think that way, but, with restrictions (pesky, limited textual syntax, again).

Maybe the biggest problem-to-be-solved is what I now call 0D - zero dependencies.  Everything I've been exposed to - except programming - is composed of truly independent units (electronics, human interaction, business ORG charts, LEGO, etc.).  

Programmers recognize dependencies at a big-grain level, but, fail to recognize the small-grain, insidious forms of dependency - things like CALL/RETURN and that functions are state machines that block.  It is easy to fix small-grain coupling, but, you need to recognize that you want to fix this.  A: use FIFOs instead of LIFOs.  Or use FIFOs in addition to LIFOs.  Use SEND in addition to CALL/RETURN.

Static languages breed compiler appeasement.  We want to analyze programs statically, but, we don't need to build programs like that. When you build static programs, everything works like it is built in a clockwork manner. If one gear-tooth breaks anywhere, the whole system stops working.  Software is, currently, like that. Brittle.

Static languages led to the realization that Recursion is better than Looping.  In the New Reality, though, we want neither.  Recursion implies use of a stack (LIFO), but modern hardware is distributed and does not support Stacks as inter-processor language mediums.  Incremental clockwork thinking led to RPC as a workaround to enable a one-size-fits-all notation.  

In the New Reality, CPUs are cheap and memory is cheap and plentiful, but, we remain stuck using 1950's biases for programming 20xx's hardware.  Actually, there is nothing Central about PUs anymore.  Even our language - CPUs instead of PUs - forces us into using old-fashioned ideas for programming new-fashioned hardware.

I argue that macros and GC are significant advances in programming technology.  Both were invented in dynamic language paradigms, not static language paradigms.  Note the deliberate use of the word "invented" instead of "implemented".

I argue that Sector Lisp embodies the most beautiful form of functional-based garbage collection (40 byte garbage collector).  McCarthy was on the right path and Tunney cleaned it up.  Why did this take so long and require so many epicycles?  I would argue that the "one-size-fits-all" clockwork mentality led us off of the path.  If we'd have taken FP at face value - no mutation - maybe we would have created Sector Lisp sooner, instead of trying to force anti-FP concepts into our one-size-fits-all notations.  Sector Lisp is not just a pile of assembler-level tricks that lead to small code.  Sector Lisp sticks to the pure-FP paradigm and, thus, prunes epicycles and bloatware from our trees of techniques.

"Processes" are epicycles for working around the limitations of clockwork thinking.  I argue that concurrency is simple and takes about 10 lines of code whereas the concept of "processes" added complications and drove us into futher epicyclic-thinking, e.g. the requirement for the use of Operating Systems.

# Not Just Programming
We see the deliterious effects of clockwork thinking in other fields.

Nobel Laureate Ilya Prigogene estimates that functional thinking retarded Physics by 100 years, in his book "Order Out Of Chaos".

Maybe the shining example of clockwork analysis is the Copernican Cosmology.  We think that the Earth orbits the Sun, instead of thinking that the Universe orbits Earth.  Yet, this view of the Universe was resisted for some 2,000 years by the incremental  addition of workarounds - called "epicycles" - to the Ptolomaic Cosmological theory.

# One Size Fits All (Not)
If we stick to only 1 paradigm, we spin our wheels.  

or example, ignoring Science and analysis caused us to describe The Universe with hand-waving explanations like "magic".  

Switching hole-hog to Science, though, is causing blind spots, too.  For example, Physics explains everything, except the 85% of the Universe called "Dark Matter".

What's the answer?  Avoid the one-size-fits-all mentality and use multiple paradigms / notations / SCNs.  Invent a way to smoothly go from Creativity to Analysis.  In programming, that might mean using Dynamic languages at first, then tightening up designs by the gradual application of static languages.

# S/SL

S/SL (syntax-semantic language - Holt, et al) is a shining example of how this can be done.  Design first without specifying low-level details (such as types), then implement the details underneath.  Lisp macros are another way to think like this.  Ohm-JS and PEG lift macros into other-language domains, allowing  macros to be used in languages other than Lisp.

# Functions
Functions have similar goals - elide details by encapsulation. But...

# Waterfall Design
Static languages embody Waterfall Design methods - also known as dreaded premature optimization. 

If you Design a program using a static language, then you are using the Waterfall method.  You think that you already know everything there is to know about a solution and that you can code up appropriate data structures and operators to effect the solution without needing further exploration and iteration.  

If you Optimize an already-existing program using a static language, then you are engaged in Production Engineering, not Design.

# The Ideal Design Language

An ideal Design language would contain only 2 types
1. Things, and,
2. Lists-of-Things.

For example, during Design, Numbers are just Things.  During Production Engineering, though, Numbers are ints, floats, double-floats, etc., etc. The choices are affected by the desire for speed, size, cost, etc.  Making such low-level choices should not affect Design.


## Iteration
Figuring out the Requirements - what I consider to be a part of Design - requires iteration.  Static languages impede iteration and calcify bits of the Design too early, i.e. "premature optimization" at the Design level.  

When you calcify a part of a Design, by spending effort to polish and optimize a piece of the Design, you feel reluctant to discard all of that hard work when you learn new details about the target problem.  You feel compelled to tweak existing code instead of throwing it all out and starting from scratch with the new knowledge.  There is a desire to move forward without retrenching.  

This is Waterfall thinking.  

Good money after Bad.

## Very Little Code
The ideal is to write very little code during Design (and Requirements Gathering).  Throwing away small amounts of code is much easier than throwing away large lumps of code.

### Example: YACC
An example of premature optimization and paralysis-by-analysis is YACC - the basic compiler tool that generates parts of compilers from formal language specifications.

YACC solves the State Explosion Problem by hiding it.  YACC generates a State Machine, but the programmer doesn't need to think about State Machines.  YACC uses sophisticated - i.e. complex - methods to automatically cordon-off groups of States and rein-in the inherent State Explosion.

## PEG, Ohm-JS, Backtracking
We knew about Recursive Descent Parsing for decades, and we knew about backtracking for decades, but we ignored these ideas due to our 1950's concerns for "optimization".

In 2004, Ford published a paper on PEG - Parsing Expression Grammars - that turned parsing on its head.  

PEG uses recursive descent and it uses backtracking.  

The result is a much-easier-to-use DSL for creating text parsers.  

PEG led to the invention of Ohm-JS, which is currently, my favourite parsing technology.  Ohm-JS elides bothersome details, like "where do the spaces go?" and lets you Design a parser at a higher level of thought.

## Matching Brackets
Furthermore, a feature of PEG is that it can express - and parse - matching brackets.  

YACC and language theory can't do this.  

### New Ways To Think About Syntax
Matching bracket parsing leads to new ways of thinking about syntax:
- parsers can call sub-parsers
- the concept of Verbatim snippets - bits of generated code can be inserted into the output stream and ignored like whitespace, but not ignored during output, allowing generated code to be constructed in little bits ("layers") instead of a whole-hog fashion (much more complicated to think about and design).

Can you do all of the above with static languages?  Yes.  Do you?  No.

Language - syntax - colours your thinking.

### Syntax is Cheap
Furthermore, Ohm-JS adds a new wrinkle to language design.  

Syntax is suddenly cheap. 

We can sprinkle syntax into projects in minutes.  Syntax is like a bowl of candy.  Reach in, grab a handful.

#### REGEXP - A Pale Imitation of Parsing
We can - almost - do this with REGEXP.  Ohm-JS has a less-ugly syntax - and, more importantly - we can write recursive syntax sub-routines in Ohm-JS, whereas this is not possible in REGEXP.

When you BELIEVE that syntax is cheap, you think about languages, notations, SCNs differently.  Instead of waiting for Guido to give you Python 4.0, you can simply invent multiple syntaxes and stick them into your project as parts of the overall solution.

Example: A game jam entry - Ghost Stars - was written as a bunch of JSON data structures that were grokked by laboriously-written Racket code.  Later, in 10-ish minutes, a mini-parser for the Ghost Stars scripts was written.  It transpiled scripts to JSON.  The scripts do not look like "programs".  With a further mind-shift, maybe the mini-parser could have generated Racket directly.  Maybe the game designer would have been completely freed of thinking about Racket, relegating the details to Engineer collaborators.

### Syntax Directed Translation
The BELIEF that syntax is cheap can lead to a different technique for building programs.  We can create a bunch of programming steps and give each one a unique input syntax to play with.  Form a pipeline of simple programming units, each driven by incoming text.  This technique was developed using S/SL for PT Pascal, but was too laborious to use on anything but very large problems.  Now, Ohm-JS makes it possible to throw together little languages and little parsers and to hang oprations off of them which do interesting things and pass results, like batons, on to the next little parser(s) in the chain.  

There is no inherent reason to arrange such designs in only a serial fashion.  A single stage might cause multiple other stages to fire in parallel.  Shades of internet, rPI, Arduino, blockchain, etc.

Aside: functional programming analysis techniques are - slowly - backing into the concepts of pattern-matching.  Pattern-matching was invented and explored in the 1960s.  Pattern-matching has - unrightfully - been relegated to "parsing" for compiler-building, but has much wider applicability if you break the clockwork mindset.

# Classes
Classes are just prototypes.  

If you think that your Design benefits from class-based thinking, then, there is nothing that stops you from using classes in a Dynamic Language.  

On the other hand, if you start out using a Static Language, you are simply not allowed to use anything but classes to structure your Design.



# GCC, RTL, OCG

GCC blew the doors off of assembler programming.  

Before GCC, programmers laughed at high-level languages and compilers.

After GCC, assembler programmers retired.  Few bother to use anything but high-level languages and compilers.

GCC was based on RTL - research of Fraser/Davidson into peephole optimization.

RTL is a sub-class of Orthogonal Code Generation (Cordy).

The main gist of RTL is to perform code generation in 2 steps:
1. Generate code, but, treat all operands as virtual CPU registers.
2. Fixup the generated code to expunge virtual CPU registers and to rewrite generated code to adhere to the abilities of the underlying hardware.  The task, in this stage, is to rewrite "fake" assembler code as realistic assembler code.  This stage doesn't need to worry about figuring out how to transpile the high-level language into assembler (fake or real).  Chunking the problem in this way makes each stage (1 & 2) easier to think about and easier to code-up correctly.

Cordy's OCG is similar to RTL, except that it uses "data decriptors" (Holt) instead of virtual registers.  Data descriptors are more general and contain information that can be used by the data allocation stage.  OCG, also,
- uses a declarative specification of various CPU architectures (MISTs)
- uses a concept called "Condition Descriptors" which are a lot like lambda-calculus doo-dads of the present day.

Again, OCG uses the strategy of divide-and-conquer
1. OCG generates code using Data Descriptors
2. OCG fixes up the generated code (by tree-walking MISTs) to match the reality of the underlying CPU.

# Agile, Etc.

Agile is a methodology aimed at gathering requirements about a problem using "short" cycles of iteration.

In Agile, "sprints" represent short cycles of iteration.  Sprints are often 2-weeks lng.

One should strive for 2-minute cycles, or less.

# REPLs

REPL means "Read Eval Print Loop".

REPLs allow programmers to "see results" immediately.  This shortens the turn-around time during exploration of a problem and possible solutions to the problem.  Again, understanding a problem and creating possible solutions to a problem is an iterative process.  The shorter the turn-around time, the faster one arrives at an understanding (e.g. the Requirements) and a possible solution which is "good enough".

A problem is usually not solved completely.  Iteration stops when a solution is "good enough".

When problems are solved completely, we move to attacking problems at higher levels.  For example, assembler solved the problem of electronic circuitry that is too complicated for general use.  High-level languages emerged when assembler was "well in hand".  First, Algol, Pascal and C emerged, then higher and higher level languages emerged.  We figured out how to detect one kind of problem - the correct sequencing of programming commands in phrases, i.e. "syntax checking".  Now, we are trying to figure out how to detect another kind of problem - making program units fit together in a clockwork manner, i.e. "type checking". What problems will we attack when we've solved that one?  I don't know yet.

REPL is a concept invented in the dynamic language paradigm.  

Later, REPLs were optimized to fit the static language paradigm, whilst discarding essential elements of iteration, such as convenient debugging using only a single language for both, programming and debugging.  For example, you cannot iterate freely if you are required to specify the structure of data structures by using type declarations.

## Worry-Dream
The main messages of the Worry-Dream paradigm (Bret Victor) are:
- Write programs using less code, e.g. using visuals instead of text to allow greater expression.
- Create REPLs for iteration.  REPLs need not be relegated to being text-only - a "slider" widget can be a REPL.


---
notes:

Ohm-JS - syntax is cheap, lots of parsers, pipelines of parsers, syntax-directed translation, FP pattern-matching

waterfall, clean-up using static
- x YACC vs PEG -> verbatim, layered grammars
- x OCG, GCC, RTL
- x classes are just prototypes - nothing stops you from using classes in Dynamic Languages, but free-wheeling prototypes are prohibited by Static Languages
Agile, etc.
Boogie board, button to wipe out existing work, yet, retain knowledge, 
- like Spreadsheet "what if" thinking
- grandkids scribble and learn small-motor skills - one button wipes out experimental scribbles and allows "try again"
- CEOs scribble visions on whiteboards, Engineers tighten up the visions through Engineering and Production Engineering and Test Engineering and ...
Verbatim
Syntax-Directed Pipelines
0D
FDD
Python indenter
DaS
declaration before use
engineering is about making trade-offs - solving a problem by shaving theoretical concerns off until the solution is a lean as possible (along some dimension)
debugging convenience
Worry-Dream
JS callbacks to cirumvent complicated epicycles re. concurrency
9-20-Bloatware Caused By ...
readability
cottage industry vs. engineering
