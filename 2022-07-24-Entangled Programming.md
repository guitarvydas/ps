# LEGO®
Programmers have been living under the delusion that they are building programs using LEGO®-block-like pieces of software.

Programmers are not building LEGO®-like programs.

Programmers wish for
- encapsulation
- message-passing

but mis-apply the above terminology and delude themselves as to what is really going on.

# Functions Are Blocking State Machines
The following simple sequence represents program code that blocks:
```
function caller (...) {
  ...
  f(x)
  ...
}
```

The function *caller* works like a state machine:
1. it executes some actions
2. it calls `f(x)` then blocks waiting for a response
3. it resumes and executes some more actions.

When we write such formulae down on clay tablets (or paper), we don't notice the blocking in step (2), because, our written formulae are based on the notion that function-calling takes 0 time.

Yet, when we implement such formulae on a computer, the basic assumption is violated.  Function-calling does not take 0 time on a computer.  Programs that contain function calls have hidden dependencies in them.

See also [[2022-07-25-Dependencies Due To Function Calling]].

# What Is The Difference Between EE and SW?
I used to build electronic circuits as a hobby.

Then, I went through EE schooling (after some schooling in Physics).

I built languages, compilers, interpreters, operating systems in software and was always troubled by the fact that I could design reliable electronics hardware, but, could not build reliable software.

What is the difference between the two activities?  They seem to be the same, but, reality says that electronics design works while software design doesn't work.

# Asynchronous vs. Synchronous

I used to think that the crucial difference was *asynchronocity* and *parallelism*.

Electronics circuits are fundamentally asynchronous, while software routines are fundamentally synchronous.

I used to use the word "parallelism", but, after watching Rob Pike's [talk](https://www.google.com/search?client=safari&rls=en&q=rob+pike+concurrency+is+not+parallelism&ie=UTF-8&oe=UTF-8), I began using the word "concurrency" to mean "something" deeper than "parallelism".

# Divide and Conquer
Divide and conquer can *always* be applied to a problem.

How can *concurrency* be divided and conquered?

# Concurrency
When I look at concurrency, I see it as two (2) concepts:
1. ordering, time-variance
2. 0D - zero dependency.

Ordering (1), is just an optimization.  Executing actions simultaneously produces a result which finishes sooner than the same process using sequential actions.[^ordering]

[^ordering]: Ordering can be further sub-divided (using Divide and Conquer).  One can sequence components that are exactly the same, or, one can sequence components that are not the same but start executing at the same time.

I believe that 0D (2) is the crucial element that separates Software Engineering from the rest of human endeavours.

I use the word 0D to mean "zero dependency".

Software has built up a culture composed of many epicycles which deal with N0D (non-zero dependency), like "thread safety", "make", "package management", "operating systems", etc., etc.

I believe that we need to rid ourselves of such epicycles, especially as we move from building calculators to building distributed applications (blockchain, IoT, robotics, internet, etc.)

To rid the field of these epicycles, we need to re-examine our assumptions about computing. 

Can we write software in a way that removes inter-dependencies?  *Remove* not *work around*.

Note that *functions* cause hidden dependencies.  See [[2022-07-25-Dependencies Due To Function Calling]].

Early computers did not have hardware-supported stacks and were not inherently based on the notion of recursive functions.

# The Ground Rules Have Changed
In the mid-1900s
- CPUs were very expensive and scarce
- Memory was very expensive and scarce.

It made sense to design programming notations for single-CPU systems.

In the early 2020s
- CPUs are cheap and abundant
- Memory is cheap and abundant.

It no longer makes sense to use techniques from the mid-1900s for programming mid-2020s computers.

The New Reality:
- CPUs can be used like bowls of candy
- Memory can be used like bowls of candy
- Hardware can process vector graphics, not just strict grids of non-overlapping bitmaps (AKA "characters").

Concepts that are no longer applicable:
- central CPUs
- memory re-use
- text-based programming languages
- desktops
- file systems (local)
- operating systems

# Single CPU vs Multiple CPU

# New Issues
- how do you teach 0D design?
- how do you bolt existing software into 0D systems?
- what is the notation for 0D (I favour a hybrid of diagrams+text, SVG-lite[^svglite])?
- blockchain, IoT, robotics, internet, etc. how do they change?
- what is a computer? (A device that runs operating systems, or a substrate for LEGO® blocks?), what is a phone?
- (x,y,t) technology instead of (x,y)
- replace big-O with analysis of: time (throughput), size (footprint), cheapness/cost
- what is an IDE for 0D?
- what is the smallest programming "language"?
- do you need to base all programming on only textual representations?
- where do whiteboards fit in?
- hierarchy
- layering
- "structured message-passing"


[^svglite]: [[2022-07-25-Parsing Text vs Parsing Diagrams]]

# Epicycles - Culture of Workarounds
- thread safety
- priorities (Mars Pathfinder disaster)
- garbage collection, mutation
- preemption

# Dependencies
All current software is teeming with dependencies under the hood.

I think that we need to concentrate on 0D (zero dependency) to move forward.

I used to use the word "parallelism", then "concurrency", but, the basic issue goes deeper than that.

The fact that (some) dependencies are hidden/elided makes us forget that they exist.