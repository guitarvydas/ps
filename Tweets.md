#ProgrammingSimplicity 

lisp thinking: macros instead of full-blown compilers, 10 minutes instead of 10 months

Disagree.  1950s lesson #1: today's expensive is tomorrow's cheap.  Lesson #2:  Programmers' time is wasted using 1950's compiler-appeasement biases.  >> Bloatware instead of simple solutions to 20xx problems. It's time for a re-think.

0D, and, FIFOs not LIFOs, and, eschew implicit sync.

Computers: 20xx Reality is very different from 1950 Reality. No CPU ("central"), no Loop (internet), no  stacks LIFOs (internet), async (internet).  Cheap PUs.  Cheap memory.  No need for compiler-appeasement.

Gray code: solve exactly 1 problem at a time.  Programming = (a) Program Design (b) Optimization of Already-Working Program.  Dynamic languages = a, while compiler-appeasement languages = a+b (premature optimization)

Disagree: Programmers' time is wasted using 1950's compiler-appeasement biases.  Produces bloatware instead of simple solutions to 20xx problems. It's time for a re-think.

Ohm-JS: macros for languages beyond Lisp.

Lisp Macros - a style of thinking: create MVP syntax parser, then let the toolbox (lisp) do the heavy lifting

Lisp Macros - no need to build a full-blown compiler, just build a syntax

Compiler = ad-hoc macro expander for text instead of trees (lists)

Readility: (1) Human Readability (2) Machine Readability

Lisp: tree-oriented assembler (machine readable/writable)

Sector Lisp: FP made beautiful again

Sector Lisp: GC is 40-bytes[sic]

Sector Lisp: deeper than just assembler tricks

Most modern programming languages: use LIFOs.  20xx: need FIFOs.  "Send" instead of "Call/Return".

quote: new languages should use existing languages as assembler

assembler: machine-readability/writability emphasized

new languages: build them with Ohm-JS + machine writable Lisp


(1) ideal program = 1 line, (2) less-than-ideal <= 5 lines (3) ridiculously complicated > 5 lines 

PLs = everything-but-the-kitchen-sink instead of many simple notations ; ideal = use many notations, then plumb them together to make an app

Feynman diagrams: example of side-stepping complication by inventing simpler notation

FP is a notation, not a programming language

Q: How to use existing languages as assembler? A: Ohm-JS for building transpilers ; lisper macro mind-set

Simple Example of Compiler Appeasement: declaration-before-use.  The only reason that I can't put the most important code at the top is to appease the compiler.  In 1950, it was thought to be good to have 1-pass compilers.

Gray Code: change only 1 item at a time https://en.wikipedia.org/wiki/Gray_code, developed for electronics, useful for software development

General Purpose Programming Languages result in bloatware.  Use SCNs (Solution Centric Notations - mini-DSLs).

Statecharts: Harel, PWL

Disagree: today's expensive = tomorrow's cheap.  Programmers still saddled with premature optimizations from 1950's 

1950's premature optimizations: LIFOs, sync, compiler-appeasement languages, strict grids of non-overlapping small bitmaps ---> bloatware in 20xx

Programmers saddled with applying languages of 1950s hw to 20xx hardware.  New Reality.  Old:  Cpu, loop, recursion, sync, lifos.  New: Dpu, async, fifos, 0D.

profile: DaS, using existing languages as assembler for new languages

statement: hierarchical state machines are better than behavior trees