# The Great Reset


### Paul Tarvydas
### October 25, 2022

---
# The Coming Great Reset in Programming
- programming is becoming harder
- current techniques result in bloatware
	- e.g. installing Linux to control my ice-maker
		- d'uh
		- could be done cheaper using just a few electronics components
- programming restricted to select few
- spreadsheets were a break-through in UX
	- allowed more people to acces programming
- Hypercard
- BASIC

---
# Goal of Programming

## What is The Goal of programming?
The Goal of programming is to control a machine using any means possible, and, to reduce our burden in doing so.

## Corollary: Not The Goal
Fixating on a single notation, based on glyphs invented for clay-tablets, is Not a Goal of programming. 

At best, this is a sub-goal of programming.

---
# 1950s Reality
---
# 2022 Reality
---
# Current Technology
---
# Canaries in the Coal Mines
- Descript
- Kinopio
- etc.
# Bloatware

---
# Programming Languages Are IDEs
- invented in 1950s for single-CPU mentality
- textual phrases (only text)
- culled prose
---
# Type Checking vs. Syntax Checking
---
# Mathematics
1. notation
2. thinking
---
# Mathematical Notation
- invented for clay tablets, pen and paper
- Microsoft Word® provides all features of mathematical notation
	- Find and Replace
	- no side-effects
	- referential transparency
---
# New Notation
---
# Multiple Notations (Syntax Skins)
- Ohm-JS
- Parsing Explorer
---
# DaS
---
# SVG

---
# Backtracking
- PROLOG
- miniKanren - feed forward instead of backtracking
- core.logic (Clojure)
- TXL
- Ohm-JS & PEG - backtracking 
	- maybe feed forward can be used instead of backtracking?
---
# PEG
- Parsing Expression Grammars
	- looks like BNF and LR(k) and Language Theory
	- PEG is a DSL for building Parsers
		- instead of deriving Parsers from Language Specification
		- capable of actions not embodied in Language Theory
			- e.g. matching brackets
			- *verbatim*
			- identifiers containing spaces
- Ohm-JS
- various PEG libraries
	- ESRAP (Common Lisp)
	- peg.js, etc.
---
# Syntax is Cheap
- a single project can use multiple skins (syntaxes)
- bowl of candy - grab a handful
- Paradigms are important, syntax skins are cheap
	- wrap paradigms in multiple sub-project-specific syntaxes
---
# Orthogonal Programming Languages
- 100% separation of Control Flow from Operands
- related idea used in GCC
	- Fraser/Davidson's RTL
		- peepholing optimizer
- related idea in OCG
	- Orthogonal Code Generator, Cordy
	- like RTL, except uses Data Descriptors instead of Registers
	- invented Condition Descriptors - much like λ Calculus applied to programming
	- MISTs
---
# S/SL
- handles
---
# Optimization in Compilers
takeaway - generate rough generic code, optimize after-the-fact
- pattern-match for idioms 
	- project specific
	- -> Design Rules compilable documentation
		- like pre- and post-conditions and assertions
---
# Concurrency and Greenspun's 10th Rule
---
# Avoid If-Then-Else
# Macros for Non-Lisp Language
# FAB
# Mutation
# Thread Safety
# GC
# Allocation
- declare allocation in identifiers
	- don't force compilers to infer this info
	- build syntax to give "better" UXs, but, devolve to explicit allocation operand syntax
---
# Layers of Notation
- Assembler HLL notation for VLSI
- VLSI: HLL notation for transistor electronics
- Transistors: HLL notation for ad-hoc electronics
- "molecules": notation for structuring atoms
- "atoms": notation for structuring sub-atomic particles
- fractals all the way down
	- why do we insist on using flat notations instead of layered notation (fractals)?
	- relativity, no absolutes
---
# Clockwork
---
# DIRT
- Design Intent Round Trip
- cparse
- transpile phrases into code
- for now
	- scrape existing apps and DI-ify them
	- re-emit same code from DI-ified pseudo-code
	- very S/SL-ish
	- no ability to define data
	- DSL for control-flow only
	- do chunks of code need to be sequential or can they be executed simultaneously?
- later
	- write DI-ified code directly, don't write 3GL code
---
# 0D
---
# Structured Message Passing
# Engineering
Tort Law
Engineers don't write code
	- Engineers think through details to realize a product
	- Engineers make trade-offs (optimize an idea) to reduce final costs
	- Engineers specialize, Engineers don't generalize
		- e.g. build a bridge over a certain river at a certain point
			- soil conditions
			- bank height
			- design for load, multiply by 10 for exceptions

---
# Notes:

- lambda is a simple wrapper, affects runtime uses CPU cycles in production instead of development
- global variables due to textual notation, wouldn't bother to create globals if diagrams were used
- 5-line programs
- film industry - independent assets, joined up in layers
- efficiency - development and production
- robotics
	- blobs of functionality sequenced by uber-sequencer
- blockchain
- internet
- IoT
- human mind
	- self1, self2
	- consciousness == uber-sequencer
- Takeaways - first-principles thinking
- AI - AI Winter of 1980s - got the T-Shirt
- No-Code = RAD - got the T-Shirt
- OOP is text-editing, can be done by editor, why waste runtime cycles?
- generalization -> runtime inefficiency, specialization -> optimized generalization to remove runtime inefficiency
- Forth <- de Bruijn indexing in lambda calculus
	postscript <- Forth, part of Apple's success (install ps in printers, enabling Desktop Publishing segment)
- maybe Software is simply a prototyping tool for hardware products?
- measurements - what is the throughput of an app?  What is the throughput of a library used in an app? What is the memory footprint of that library? What guarantess are placed on the library? Types -> too much complexity to characterize (easily), so we drop characterization and/or concentrate only on one kind of characterization (called "efficiency" - but "efficiency" for what? Product or Dev?)
- Sector Lisp - not just a bag of assembler tricks, something deeper
- Org Charts
- ALGOL Bottleneck
- Synthesis - what is the next step? what is The Answer? No Silver Bullet, many Silver Bullets (depending on need)