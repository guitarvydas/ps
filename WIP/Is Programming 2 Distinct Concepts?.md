goal: control a computer 
	-calculator
	-sequencer

---

- in the mid-1900s we chose to control computers with text
	- precedence - written language
	- precedence - mathematics (written, pen-and-paper)
	- hardware: support keyboards and characters, but not graphics

---

- in the mid-1900s we chose pervasive synchrony over asynchrony
	- precedence: mathematics (written, pen-and-paper)
	- fear: we wanted to control actions of machine, didn't think that machines should be allowed to work "independently" (async)
	- precedence for asynchrony: everything in real life
	- precedence for asynchrony: electronics design

---

- ethernet
	- ethernet is async not sync
	- ethernet uses asynchronous "random back off" strategy instead of explicit synchronization

---

robotics
- need for independent operations
- ROS

---

blockchain
- need for state machines
- need for independence
- need for synchronization of independent units
- 2 parts
	- 1. crypto math
	- 2 state machines, sync independent machines
- Turing award
	- for describing a simple state machine (hands tied behind back due to sync notation)

---

calculator
- take input
- produce result

---

DAW
- sequence sounds in time

---

iMovie
- sequence video in time
- sequence sound in time
- synchronize sound and video

---

internet
- independent machines
- synchronization
	- tried "calculator" model - ask, get response
		- not sufficient, invented stateful

---

Statecharts
- async notation
- sync analysis (1987 paper)
- conflates 2 notations
	- concurrency -> parallelism?
	- hierarchical state

---

UNIX
- hierarchy
- normalization (FDs)
- pipelines of indepent units (bash `|`)

---

Operating Systems
- epicycles
- use sync PLs to create closures (big == process)
- build async on top of sync
- preemption
	- neede only during development
	- or to stop poorly written/tested programs from harming other programs

---

computers
- our arbitrary insistence on using 1 computer for many tasks
- need to isolate tasks from one another (in case they are poorly written)

---

scratch, etc
- "visual"
- synchronous

---

VPL
- Visual Programming Languages
	- overkill
	- start "small"
- node-and-arrow notation
	- synchronous (not async)
- jump into massive graphics
	- small steps first
		- use boxes and arrows

---

Flowcharts
- sync
- Drakon

---

Assembler
- text
- sync
- prefix notation
- normalized notation

---

Lisp
- text
- sync
- prefix notation
- normalized notation
- invented macros
- invented GC
- invented JIT (originally called *fastcall*)
- invented anonymous functions (*lambda*) -> closures (compilable lambdas)

---

Smalltalk
- popularized OO
- popularized Vm
- popularized GC
- uses word *messages* but uses synchronous functions calls for implementation

---

Automation, Compilability, Scripting
- helped by normalized notation

---

Ohm-JS
- PEG
- backtracking pattern-matching
- pattern-matching of text
	- -> macros for text languages
	- -> convert non-text into text, then process using existing tools

---

Dependencies
- "Global Variable" problem of 2000's
- goal: 0 dependency software components (akin to electronics)
- UNIX "PATH" appeases dependency problem instead of solving it
- *make* appeases dependency problem instead of solving it
- *package managers* appease dependency problem instead of solving it
- dependency hell
- due to sync?
- `f(x)` implies dependency
	- `f` is hard-wired into the code
	- `f` should be indirect
	- `(*f)(...)` in C notation
	- DLLs
		- DLL indirection is in one direction only (caller -> callee)
		- but, DLLs rely on synchronous stack for return direction (callee -> caller)

---

Current Syntax:
- syntax `f(x)` implies sync-only
- `f(x,y,z)` means *one block* of data, desctructured, arriving in sync (all at once)
- `f(x,y,z)(u,v,w)(a,b,c)...` for async?
	- 3 blocks of data 
		- block 1 is destructured to `x,y,z`
		- block 2 is destructured to `u,v,w`
		- block 3 is destructured to `a,b,c`
	- diagrams - boxes with ports for async?
- return values
	- same idea - blocks of data sent in sync, destructured
- does `->` mean `sync`?

---

Diagrams
- fear of compiling diagrams due to mid-1900s hardware limitations
- compile diagrams to executable programs
	- not text -> diagrams
	- diagrams -> text -> exe
		- or, diagrams -> exe
		- diagrams -> text -> exe allows use of exising tools
		- PROLOG, backtracking, allows *parsing* of diagrams
			- miniKanren?, core.logic?
			- PEG? Ohm-JS
- concentric boxes
	- mean sync
	- mean inheritance downwards
	- mean inheritance upwards (output ports "inherited" by children)
- separate boxes
	- mean async
	- ports only way to transfer data
		- Send() on output port
		- handler for input port
		- FBP: Receive() for input port

---

Software Components
- boxes
	- stand-alone
	- concentric
- lines connect ports ("wires")
	- output port of child -> input port of child (95% of cases)
	- output port of child -> output port of parent (5% of cases)
	- input port of parent -> input port of child (5% of cases)
	- input port of parent -> output port of parent (1% of cases)[^addition]
- stand-alone boxes are *always* async by default

[^addition]: Yes, the numbers don't add up to 100%.  I am trying to give a "gut feel" for majority of cases vs. minority of cases

---

Async
- inputs arrive at any time, blocks of sync data are desctructured (for reading)
- outputs sent at any time, blocks of sync data are destructured (for reading and writing)
- outputs can be sent anywhere, not just to caller

---

Blocking
- implicit sync protocol between caller and callee
- blocking thought to be "owned" by operating system
	- untrue
	- blocking also caused by CALL/RETURN (function calling)
	- blocking 
		- is, therefore, not localized, 
		- blocking is spread out and controlled in more than one place
		- 1. function call 2. operating system
- invented *preemption* to allow O/S to wrest control away from function-calls

---

Eletronics
- async
- literature on synchronization techniques (existed 60 years ago)

---

Q: is "programming" actually 2 distinct disciplines?
1. computers for calculation
2. computers for sequencing / controlling machines
3. combined discipline: ? sequencing X calculation ? (sequencer invokes λs?)
- or is this 1 discipline called "programming"?


---

Tree
- programmer invention
- normal people use the term "Org Chart"
- even-more-normal people don't draw trees, they draw concentric circles and boxes

---

Concurrent Lambdas
- concurrency *inside* lambdas, not wrappers *around* lambdas
- every component is its own small O/S (like a "windowing main loop")

---

IoT

---

Software Engineering
- more than Production Engineering
- Design, DI
- Software Architecture
- UX, Security, Testing

---

Testing
- hard to do with synchronous components
	- sync libs drag in too many dependendent libs
- ideal
	- put 1 component into test jig
	- no dependencies -> testing only *that one* component
	- stimulus / response

---

Plugability
- need a way to compose async components
- need a way to compose components written in different languages
- software LEGO®
	- simple api (1 type - ANY)
	- normalized - api contains 1 call (maybe 2)
	- build more-interesting types up in layers

---

Layers
- vs. 1 big blob of functionality
- eschew parameterization, only one operation per component

---

OCG
- OCG might get new lease on life with Ohm
- Lisp macros were nipping at the heels, but ignored due to
	1. Lisp hatred - assumed Lisp was dynamic-only (interpreted)
	2. Lisp macros work only on Lisp lists
		- failure to see big picture of using other-than-lists
	3. premature optimization - strive to compile hinders out-of-the-box thinking

---
Concurrency
- Concurrency is a Lifestyle
- Parallelism is a Greasy hamburger
- Rob pike

---

Explicitness
- vital to 0-dependency
- Denotational Semantics made everything explicit (including call stack)
- diagrams make it easy to be explicit

---
Breakthrough Tech
- might be subtle
	  - will we know it when we see it?
- breakthrough tech will change the way we *think*
- [[Our Biases]]
---

Layers
- examples of layers in current PLs
	- lambda closures wrap data
	- scoping variables vs. global variables
	- structured programming vs. GOTO-ful programming
	- OO 
	- packages

---

Wiki Programming Language
- links
- not linear

---

sploot
- writing Python is not the goal
- controlling machines (computers) is  the goal
- I give you permission to not  cover all of Python
- sync vs. async
	- humans live in async every day
	- humans know how to solve async problems
	- humans don't know how to solve sync  problems  - they  need to  attend  University to learn  this "skill"
	- Python is  one  of  the broken languages
		- text-based
		- synchronous
- trees
	- invention  of programmers
	- sort-of-normal people draw Org Charts,  not  trees
	- normal  people draw concentric circles and concentric boxes connected by wires, not trees
-  Ohm-JS
	- provides source-to-source transpilation
	- makes it possible to crank one syntax and produce code in another syntax, using only the "best parts"
- d2p tech to parse draw.io diagrams and transpile them to code
- assumption that  programming must use synchronous text code
	- humans understand async not sync
	- sync  is hard
	- -> Python is hard because it it  sync
	- why not restrict sploot to using only Python lambdas /  anon-functions?
	- 

---

jail break
- 0 dependency components
- async
- use diagrams in addition to text, hybrid (diagram + text snippets)
- Draw.io already usable (barely)
- SVG contains everything we need (boxes, ellipses, lines, text)