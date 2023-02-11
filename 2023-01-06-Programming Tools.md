![[Excalidraw/2023-01-06-Programming Tools 2023-01-06 06.49.25.excalidraw]]

![[Excalidraw/2023-01-06-Programming Tools 2023-01-06 07.05.13.excalidraw]]

## Characteristics
- bloatware
- efficiency-centric, Production Engineering uber alles
- one language to rule them all - single notation
- synchronous

Programmers need to appease compilers by rearranging their code due to 1950s biases.  For example, *declaraction before use* was needed to make compilers lean in 1950s, but, *declaraction before use* is no longer needed in 2022++ hardware.

In fact, *decaration after use* was common in 1950s - in assemblers.  Assemblers required multiple passes to gather and process information.  *Declaration after use* was lanced when higher-level languages were developed.  Issue of non-terminating, fractal-like declarations was solved (*paper??? UNIX asm*).

### Synchronous
Single threaded design is easy, but, the rest is more difficult, e.g. multitasking
### Single Notation vs. Nothing is Complicated
Complication is a symptom of poor choice of notation.

For example, FP makes it easy to correctly build elaborate calculators, but, FP makes it difficult to deal with concurrency.  Epicycles, such as preemption, are required for concurrency.

# Bloatware

## Too Much Detail
```
class ... { ... float x; ...}
```
instead of
```
number x;
```
Don't need to know details about "x", only the methods that it supports.

## Type Checking - Bloatware is Similar to the State Explosion Problem
We want to write:
```
function add (x, y) {
  return x + y;
}
```
instead of
```
function addIntInt (int x, int y) {
  return x + y;
}
function addIntFoat (int x, float y) {
  return x + y;
}
function addFloatInt (float x, int y) {
  return x + y;
}
function addFloatFloat (float x, float y) {
  return x + y;
}
```
- typelessness = "bad" for Production Engineering, "good" for Design (Architecture, DI)
- over-use of typing -> State Explosion Problem

Some use of types helps Design thinking, over-use of types discourages Design thinking (makes thinking too cumbersome).
# Improving Tools
![[Excalidraw/2023-01-06-Programming Tools 2023-01-06 06.53.37.excalidraw]]

## requirements: 
1. must be backward compatible with existing libs/code/apps
2. iterative design: "back to the drawing board" on a whim, must encourage erasing and rewriting, discourage code-worship 
3. bolt multiple nano-DSLs together
4. must make development 10x easier
5. must trickle-down to end-user apps

OK to burn CPU cycles to assist development.
	- meaning of "efficiency" is different for Development vs. End-User apps
	- Development "efficiency" - is it "fast enough" for quicker turn-around on souped-up dev system
	- End-User "efficiency" - how can cost be reduced?  (cheaper hardware, software optimized to use cheaper hardware)

## solutions:
- 0D
- FDD
    - code that writes code
- DaS
- SCNs (Solution Centric Notations)
    - BRED
    - FAB + Ohm-JS

# Subtle Improvements
- encourage out-of-the-box thinking instead of discouraging certain avenues
- example: building Parsers from CFG specifications instead of PEG specifications:
	- CFG elides "time"
		- ordering cannot be used to define parser code
		- cannot parse "matching brackets" (need context.  Context is lost in bottom-up approach).
		- gotchas - grammars must be rewritten to satisfy CFG constraints
	- PEG allows specification of Order
		- can parse "matching brackets" - Context Dependent parsing
	- CFG is useful, but you must know its limitations and not use it "for everything"
- example: PEG is simply recursive, top-down parsing
	- not a new concept
	- a new DSL for older concept of TDP
	- much more convenient - allows thinking about parsing in new ways
		- new thinking was *possible* using old TDP methods, but, too cumbersome and, therefore, discouraged freer thinking
		- abuse of no-time notation discourages freer thinking about variations on parsing
		- old-style ad-hoc parsing led to bizarre problems - what is the trade-off of CFG vs. PEG?
			- dimension of time?
			- non-programming example: classical matrices support multiplication but not division, Robert Distinti re-visited matrix notation and created matrices that support matrix division ("Vortrix Algebra" http://www.distinti.com/va.html), i.e. "mathematical" notation did not lead to better matrices
# Nothing New
- bits and pieces of these ideas already exist
	- Interfaces
	- multitasking
	- compilers
	- DSLs
	- ML type inferencing 
	- Actors
	- OOP
# Something New - DaS
- programming -> control electronic machine in any way possible
- no need to rely on only text
- hybrid programming
	1. text
	2. diagrams
- compile text to code
- compile diagrams to code
- compose compiled code into a whole solution
# Something New - 0D
- apply divide and conquer to multitasking
	1. decoupling (0D)
	2. simlultaneity ("parallelism")
# Something Old
- State Machines
	- make SMs first-class instead of being buried in Processes
	- Harel StateCharts
	- FBP
# Old + New
- Component Based Programming
	- each Component is decoupled from ALL other Components
	- each Component is a HSM (Hierarchical State Machine - StateCharts w/o concurrency)
	- arrows on diagram explicitly show 
	- 2 kinds of components
		- Leaf
		- Container (router, composer)
			- Container owns routing arrows, not Leaves
- Structured Message Passing
- Bred, FAB + Ohm-JS, + REGEX to make syntax skins
- make pipelines "more efficient" 
	- available at language level instead of only at O/S level
	- nested function calls are not the same as pipelines
		- Need FIFOs in addition to LIFOs (Queues + CallStack)
			- model = many single-threaded rPIs sending messages to each other on wire
				- no recursion
				- structuring (flat always grows then fails)
# notes
- OPL and gradual compilation
- verbatim
- syntax skinning, composing syntaxes
- Scientific Method Has No Clothes
	- scientific method promises to fix ad-hoc approach, but ...
	- scientific method == ad-hoc approach at a finer grain
	- mathematical notation -> 
		- helps de-ad-hoc-ize interpolation of some features
		- cannot extrapolate
		- good for what it's good for, makes other kinds of things harder
		- ignores *time* dimension
		- folds 4D down to 2D (x/y/z/t -> x/y (z modeled, t ignored))
		- expects function substitution to be instantaneous, but
			- ignores propagation delay in electronic hardware
	- example: Mars Pathfinder disaster - stack of epicycles broke on Mars, fixed later with bandaid approach (ad-hoc fix to progamming notation, due to notation-worship instead of simply inventing a new notation)
	- Richard Feyman - Nobel Laureate - need to break away from mathematical notation and invented "Feynman Diagrams" (instead of math)
	- Ilya Prigogene - Nobel Laureate - blames functional notation for setting Physics back by 100 years
	- notation worship === "fad"
		- need to use *any* notation that allows deep thought about the problem
		- need a way to compose solutions by composing micro-solutions in various notations
- mathematics == 2 things (div & conquer)
	1. thinking
	2. notation
- example
	- Ohm-JS / PEG 
		- notation for building parsers
		- whereas, CFG is a notation for describing Languages, then building parsers (ignoring t <- "CF")
	- fp parsing combinators
		- notation worship
			- workaround to allow modeling problem using stale notation
		- not better than nano-DSL made expressly for the purpose of parsing
	- textual Programming Languages
		- notation worship - use text at all cost
		- global variables
		- threads, thread safety, blocking
- Physics
	- Lesson 1 
		- invent notation by making simplifying assumptions
		- remember what the assumptions were, don't use notation outside its bounds
		- example: What are the assumptions behind FP?
			- clay tablets
			- sync
			- stacks
			- shared variable - The CallStack
- Compile don't Model
- Functions Block
	- fight with O/S
	- need O/S to put State and Time back into notation
	- O/S processes are wrappers
	- O/S processes == ad-hoc implementation of closures
	- O/S processes == ad-hoc implementation of State Machines
- routing