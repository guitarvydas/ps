# Overview - Purpose and Conventions
The Main Question: programming is too difficult - WHY?

Programming is basically simple.  You do have to learn how to think about what you want done, in little pieces that are small enough to command a machine.  After that, it is simple.  But, it's not simple, why?

Exploration:
- lists of (1) observations (2) anti-observations (3) opinions (4) related references
- where the label *anti* means something that defies a specific aspect of simplicity.

- how to collaborate? Obsidian for info gathering with pointers to Discord channels?

# 0D
- independent components
- no dependencies (0D ≣ zero dependencies)
- anti-0D ≣ make
- anti-0D ≣ package managers (npm, etc.)

## Independence
- Data Independence
	- OO
- Control Flow Independence
	- concurrency
	- OCG
	- functions - anti-independence
		- functions do not provide control-flow independence
		- need bloatware called operating systems to run independent lambdas
		- need epicycle called preemption to yank blocking control away from call/return functions and libraries
		- functions provide data independence by wrapping lambdas around layers (lambdas are an epicycle to allow flattening of layers in data-only dimension)
	- relational programming
		- provides control flow independence
		- back-of-hand 0D, not explicit
# Deprecating Programming Languages
- PLs are IDEs
- PLs invented in 1950s based on biases of the times
- need to re-consider biases based on new realities (speed, memory)
# Deprecating Operating Systems
- O/Ss are ad-hoc implementations of closures (1st class functions, lambda)
# Sector Lisp
# Premature Optimization of Technique
# Lambdas With Inner Concurrency
- ė
- λs are a subset of ė
- λs are pure functions (1:1)
- ės are state machines that can invoke λs
	- ad-hoc example: operating systems run λs in envelopes (call *processes*)
# Grids of non-overlapping bitmaps
# DaS
- Diagrams as Syntax
	- we do not *have* to use characters / text / lines-of-sequential-text
# Concurrency
- necessary aspect for independence (0D)
- closures
- Rob Pike
- anti-concurrency ≣ dependency
- anti-concurrency ≣ explicit naming of receivers (e.g. Call function by name)

# Divide and Conquer
- anti d&c ≣ flattening (removing 1 or more dimensions, w/o using layers)
- layered approach
- do 1 thing well
- anti d&c ≣ "one language to rule them all"

# What Is Programming?
- programming ≣ controlling a machine
- anti-programming ≣ notation worship
	- anti-programming ≣ concentrating on a single notation (e.g. OOP, FP, etc, etc)

# Parameter Lists
- anti-simplicity ≣ parameterization

# Hacking on Existing Code
- anti-simplicity ≣ hacking on existing code
- simplicity ≣ hacking on existing code ("Shu" part of Shuhari)
	- what is the boundary between hacked-on code and a complicated mess?
		- can it be measured in the number of layers?
			- does a "hacker" get into trouble by not creating layers that should be there?
		- what is the breaking point?
	- early BASIC - grab existing code, hack on it to produce new products
	- spreadsheets - grab existing SS, hack on it to produce new products
	- cookbook
		- what makes a good cookbook?
		- at what point does documentation become a wall of detail?
- how can you tell that further hacking will cause trouble?
	- how to know when to stop hacking and call in a pro programmer?
	- what would a lint-like tool be that would raise a red flag?  Don't continue hacking, call in a pro.

# Software Engineering
- more than Production Engineering
- SW Engineers don't write code
	- Implementors write code
	- e.g. Structural Engineers don't lay bricks and pour concrete, construction workers do that
- how to sub-divide the work?  
	- Architecture
	- Engineering
	- UX
	- Security
	- Testing
	- Q/A
	- Maintenance
	- Production Engineering, 
	- etc

# Framing Software Reuse
- ref. to book
- difference between multiple-use and reuse
- macros?

# Macros
- Lisp -> FEXPR supported invention of macro concept
- Ohm-JS -> macros for textual code
- Orthogonal Programming Languages
	- play on Cordy's Orthogonal Code Generator
	- control-flow and data-objects are *orthgonal*
		- trying to combine *all* control-flow and data-flow into one notation (language) results in epicycles (e.g. OOP good for data, but obfuscates control-flow, λ-calculus embeds control-flow into one type (The Callable Function) expunges syntax, but, results in Forth-like obfuscation)

# Sequencing
- function notation expunges *time*
	- (x,y,z,t) -> (x,y)
- machines *can* sequence operations
- removing *time* results only in models of calculators
	- originally, it was thought that computers would be used for ballistics calculations
- Nobel laureate Ilya Prigogene, in book "Order Out Of Chaos", spends first part of book explaining how functional-only thinking set back Physics for 100 years 
- Grace Hopper said that you can't expunge mutation/sequencing/etc? - I saw this on youtube, but didn't save the ref (what is the ref?)
# Mutation
- currently considered undersirable
	- but, this is due to notation-worship
	- functional notation works *only* if mutation is disallowed (basically, FP is fancy search-and-replace)

# Composition
# Layering vs Flattening
- computers *do* support mutation
	- but models fail to take this into account
	- treating *time* as an entity-to-be-modelled is not the same as inherently expressing the entity in a notation
		- for example, spreadsheets vs. lambda-calculus
- functional notation hides mutation by wrapping mutation in lambdas ("bound variables", "assign once")
	- useful notations hide *something* to accentuate certain aspects of a problem
	- but, one must remember the boundaries of the notation(s)
	- one notation cannot solve *all* variations of a problem in *all* dimensions 
		- for example, electronics circuit schematics tend to elide power supply (+ve and ground) connections, but, this doesn't mean that the circuits don't need power, only that the notation elides the connections (for clarity / simplicity / emphasizing-certain-aspects-of-the-design)

# Brainstorming
- design
	- not Production Engineering

# PDE - Program Development Environments
- compose
	- brainstorm
	- flow
- pallette of functionality
	- toolbox languages
	- Ohm-JS to compose bowl-of-syntaxes for paradigms
- Production Engineering
	- existing compilers
	- existing compiled languages
	- tranpsilation from notation to compiled language
- Scapple
	- least invasive tool that I have found
	- doesn't provide a way to group and then push group to another file (replacing group by a single box)
	- needs to output "markdown" like Obsidian
		- markdown-for-svg would be a superset of markdown-for-text (`.md`)

# Names are Superfluous
# Syntax is Superfluous
# DAGs 
# Scalability
# What Is A Computer?
- a computer is a machine
- we control machines to perform certain (usually repetitive) tasks for us
	- for example, we program computers to calculate ballistic trajectories
	- for example, we program computers to act like word processors
	- for example, we program computers to help us do cashflows, balance sheets and P&L statements (spreadsheets)
	- for example, we program computers to help us program computers (compilers, programming languages)
		- for example, we program computers to help us find our own programming errors (declaration-before-use, syntax checking, type checking)
- computers are "more flexible" machines, because we can tweak their operation non-mechanically
	- looms are machines that we tune by adjusting the mechanics
	- computer tuning is done "softly", in a manner that is easier-to-change than tweaking mechanical details 
- computers aren't "for" anything, humans program machines to do repetitive work that humans want to automate
# Tinkering With The Programming Language
- theoreticians are good at theory, but less good at UX design
- hence, theoreticians should not be allowed to suggest programming languages or tinker with existing ones, except for programming languages for theoretical investigations
- -> theoretical results must be couched in a *lint*-like manner
	- scan programmers' source code and point out errors
	- scan programmers' source code and point out changes that might make more error checking possible 

# Production Engineering
- need lint-like tool to scan code and point out places that need more info for optimization
- e.g. js lint-er (1) : scan JS and count args to function calls
- provinence - original code vs. code that has be production engineered

# Zone, Flow
- anything that breaks *flow* makes design harder (breaks concentration on design, interferes with details)
	- attention to prod eng details breaks flow
	- questions like "what kind of file do you want to create?" / "where do you want to create this file?" break flow
- early BASIC, early LISP, early "rapid prototyping" targetted design over compilation
- dynamic languages target design over compilation
- static languages target compilation over design
- compilation is Production Engineering, which is optimization 
	- it is possible to optimize prematurely by using compilers too soon in the process
	- 
# Resources
- Jonathan Edwards' "Getting To Simple"
- Sector Lisp 
	- 40-byte GC vs. McCarthy's GC
		- why is JT's GC smaller than McCarthy's?
			- IMO: JT stayed within the bounds of the pure notation
				- (i.e. no mutation whatsoever)
				- heap-based GC implies mutation, breaks pure notation
- PEG
	- DSL for building pattern matchers
		- pattern-matcher theory instead of language theory
			- pattern-matcher DSL models task of building a parser
			- language theory does not model task of building a parser, it models the task of building a language (from first principles)
				- language theory useful only for programming using a language that fits the theory
				- not useful for controlling a computer in general, only useful for a subset of controlling operations
	- Ohm-JS 
- S/SL
- Data Descriptors
- 