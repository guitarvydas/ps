---
chalkboard: true
theme: beige
---

# Synopsis
- Quickie Introduction To Text Compilation
- Diagrams As Front Ends To Text Compilers 
- Using Existing Tools To Compile Diagrams
- Error Messages
- SVG
- DaS
- Proposed Diagrammatic Syntax
- Notations Of Note
- The Secret Sauce
- Case Study: Draw.io

# Quickie Intro To Traditional Compilation

Mostly Based on Text
- due to mid-1950s concerns and biases

-  [[How A Compiler Works]]

---

## Scanner

- group characters to make words (also called *tokens*)
- skip whitespace
- e.g. 'H', 'e', 'l', 'l', 'o' -> *token*('Hello')
- *token* is usually a small, scalar entity (e.g. int)

See, also, [[Appendix - More On Scanners]]

---

## Parser

- check that word sequences make up valid phrases
- Also called *pattern matching*.
- Error checks for stupid mistakes and typos -> syntax errors.

- e.g. *token*('Hello') followed by *token*('World') is OK, but, token('World') *followed* by *token*('Hello') is not ok

- -> track history (AKA state machine)

---

## Semantic Analysis

1. collect up all definitions
2. check all usages against table of collected definitions

- Error checks for stupid mistakes and typos 
	- also called *type errors*.

---

## The Rest

- Allocation
- Code Emission
- blah, blah, blah

Don't care.

Transpile diagram to another, existing language.

Let the toolbox langage do the rest.

Build *design rules* to check for stupid mistakes related to the actual problem/solution.
- e.g. "boxes must not overlap" as opposed to "X isn't of type Y"

---
# Using Existing Tools to Compile Diagrams

Let another existing language do the heavy lifting.

3. Use Ohm-JS to transpile from source language to toolbox language.
2. Use Javascript, Python, PROLOG, etc. to convert diagram to text code.
1. Employ normalization and anti-efficiency[^eff][^iyuiiwbo]

[^eff]: Machines don't care about readability.  Machines don't care about mundane-ness.
[^iyuiiwbo]: If you use it, it will be optimized.  Worry only about the big picture, let someone else optimize it (Production Engineering).

---

# Error Messages
- `throw` is not an error message
- A useful error message tells programmer where to look
	- 1 line
- give as many error messages as possible
---
## Error Messages - useless error messages
- too much information (e.g. `throw`)
- gives details about what went wrong *inside* the compiler, instead of what is wrong with the programmer's program
- or, too little information 
- if you are going to give up, at least show the context of the incoming program
- if the incoming program is *text* show text, not some internal form

---
## Error Messages - give as many error messages as possible
- don't stop after first error
- insert fixup then continue 
- e.g. 
	- delete to-end-of-line
	- then insert expected *token*s
	- restart parser from that point

---
## Error Messages - UX, UX, UX

Most current programming languages are text.

A text editor is the UX.

Theoretical handling usually converts incoming text to lambdas (or some kind of internal form).

Error messages should be in the form of the original UX, i.e. text, line numbers, details that can be used in a text editor.

If you propose to use something other than text, provide an editor.

---

# SVG
- rectangles
- ellipses
- lines
- text

Ignore the rest.  Syntactic noise.

---
# DaS

Diagrams as Syntax.

DaS is a hyrid of diagrams+text.

DaS is *not* full-blown Visual Programming.

Use existing SVG editors, like draw.io.

---
# Proposed Diagrammatic Syntax
---
## Two New Constructs

1. Containment
2. Concurrency

- containment for nesting, synchrony, inheritance
- boxes with ports and lines for concurrency

---

## Proposed DaS Syntax: Nesting, Synchrony, Inheritance

![[containment.png]]

B inherits all of A's environment.

B executes after A

box contains:
- one (1) textual statement
- one (1) box (recursively)
- (see *special forms* below)

---

## Proposed DaS Syntax: Concurrency

![[concurrency.png]]

---
## Proposed DaS Syntax: Special Forms
Control Flow:
	box that contains more than one box
		- Cond
		- OR / AND

Data Structuring
	- Single datum
	- List

---
# Notations Of Note
- Drakon
- Statecharts
- Nested Sequential Diagrams (WIP)
- ASCs - asynchronous software components (WIP)

[[Drakon Diagram Transpilation - Start Here]]
[[../Papers I Love/Statecharts]]
[[Nested Sequential Diagrams]]
ASC Introduction - [[../hamburgerworkbench0D/Hamburger Workbench 0D]] (WIP)

---
# The Secret Sauce

How are diagrams perceived by humans vs. how are they implemented by programmers?

---

## The Secret Sauce - Diagrams

To normal people ...

diagrams mean
- independent units
- -> concurrency

---

## The Secret Sauce - Textual Programming Languages

- based on pervasive synchrony
- defy human intuition 
	- for concurrency
	- by using under-the-hood synchrony

Concurrency *can* be described using synchronous paradigm, but is unnatural and harder-than-necessary.

Devolution of concurrency into synchronous steps is good for theoretical analysis, but not-so-good as UX for non-theorists.

---

# Case Study: Draw.io
- compressed mxGraph format
- mxGraph -> early variant of SVG
- lots of syntactic sugar

---

## Syntactic Sugar in Diagrams

Syntactic sugar ≣ graphics layout details, but, not needed to analyze the *meaning* of a program.

Semantically interesting ≣ boxes, lines, edges(source,target).

---

## Inferring Semantics

Missing semantics can be *inferred* using exhaustive search, e.g. PROLOG and backtracking, using high-school math, like *intersection*, *containment*, *bounding boxes*, *AI*, etc.

Editors can make inferencing easy, or, they can make inferencing necessary.

---

### Backtracking

PROLOG is an assembler for relational programming[^mk].  

PEG, also, does backtracking, but doesn't need to use PROLOG.

Easiest (IMO) explanation of PROLOG innards: [Nils Holm PROLOG Control in 6 Slides](https://www.t3x.org/bits/prolog6.html)

[^mk]: See, also, miniKanren, core.logic, etc.

---
