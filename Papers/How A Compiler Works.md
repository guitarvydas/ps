---
chalkboard: true
theme: beige
---
# Synopsis
- Overview of steps in compilation
	- scanner
	- parser
	- semantics analysis
	- allocation
	- code emission
- Triples, 
	- Orthogonal Code Generation, 
	- Relationship to `λ`-Calculus
- Machine Translation
	- What Makes It Easier to Compile/Transpile?
- Language Theory For Creating Parsers
- Parser DSLs For Creating Parsers
- Error Messages

::: <!-- element align="left" -->

# Traditional Compilation

Based on Text

- due to mid-1950s biases
- #mid1900sbiases 


Traditional Model
- LEX+YACC -> transpiler from HLL to *Assembler*
- *Assembler* -> machine code

---

## Scanner

- group characters to make words (also called *tokens*)

- skip whitespace

- e.g. 'H', 'e', 'l', 'l', 'o' -> *token*('Hello')

---

## Parser

- check that word sequences make up valid phrases

- Also called *pattern matching*.

- Error checks for stupid mistakes and typos -> syntax errors.

- e.g. token('Hello') followed by token('World') is OK, but, token('World') followed by token('Hello') is not ok

- -> track history (AKA state machine)

---

## Semantic Analysis

1. collect up all definitions
2. check all usages against table of collected definitions

- Error checks for stupid mistakes and typos 
	- also called *type errors*.

---

## Allocation

- Where does this datum belong?
	- stack (temporary)
	- parameter
	- global
	- heap
	- belongs-to scope
	- shape (byte, word, long, user-defined -> types)

---

## Code Emission
- emit
- global optimization
- local optimization
- output assembler, later output binary machine code

- Emit in two (2) steps:
	1. figure out control flow (operations)
	2. figure out data descriptors (operands).

- See Cordy's Orthogonal Code Generator.
- See Holt's Data Descriptors.
 - [*GCC's RTL, invented by Fraser-Davidson, is a special case of OCG and Data Descriptors*]

---
# NB
---

## Triples

- Assembler is triples 
	- `MOV R0,R1`
	- Operator ≣ `MOV`
	- Operand (*subject*) ≣ `R0`
	- Operand (*object*) ≣ `R1`

- In Lisp 
	- `(mov r0 r1)`

- In PROLOG
	- `mov(R0,R1)`

---
## Orthogonal Code Generation
- Operator is orthogonal (unrelated) to Operands.
- *Operands* can be described by OOP.
- *Operators* can be described by syntax
	-  text (if-then-else, while, for, ...)
	- DaS
	- Drakon
	- Statecharts
	- etc.

---
::: <!-- element align="left" -->
## Relationship to `λ`-Calculus

- All operands are operators 
	- callable functions, with destructured parameters

- Operators (callable functions) can have 2 parts:
	- true part
	- false part

- The 2 "parts" are stored as separate slots (parameters) on the stack.

Such operators can be plumbed together using DeMorgan's Laws.  (See, also, Condition Descriptors in OCG thesis).

---

# Machine Translation
- What Makes It Easier to Compile/Transpile programs?

---
## What Makes It Easier to Compile/Transpile programs?
- compilation/transpilation is aided by normalization
- boring code, looks inefficient
- mundane (boring, repeatable, no exceptions (no edge cases))

---

## Inefficiency

Originally, programming languages (HLLs) "looked" inefficient, but, now, very few programmers bother to use assembler instead.

If you use it, it will be optimized.

---
--- 
[[On Bloatware]]

---

# Language Theory -> Parser

LR(k)[^kr] can be used to describe a language.

That description can be transpiled into a state machine.

(Like REGEX on steroids).

[^lr]: Substitute your favourite language theory.
---

# Parser DSL -> Parser

DSL describes a pattern-matching state machine.

That description can be transpiled into a state machine.

The "language" is whatever the parser will match.

A parser DSL is theoretically less sound than LR(k)[^lr], but, might be able to match languages that Theory cannot describe, e.g. PEG can pattern-match for balanced parentheses, LR(k) can't.

If your goal is to build a program to pattern-match various input texts, then Parser DSLs might be more pragmatic than resorting to Theory.  If Theory can describe *everything* you need to match, then there is no need to use the DSL in lieue of generating the program from a theory-based specification.

Balanced-parenthesis matching can be very powerful and succinct, a way to build "quickie" pattern matchers, e.g. something like "find all function definitions and prefix all of the function names with 'x'.  Then, find all function calls and change them to use the prefixed versions." (Question to reader: what is the pattern for function definition?  What is the pattern for function-calling?  Do you need to describe every bit of the language, or, can you skip over unintesting bits?)

# Error Messages
- `throw` is not an error message
- A useful error message tells programmer where to look
	- 1 line of information
- A useless error message
	- too much information (e.g. `throw`)
	- gives details about what went wrong *inside* the compiler, instead of what is wrong with the programmer's program
	- or, too little information
	- or, information that doesn't fit the original UX

## Example
see [[On Syntax Errors]]
