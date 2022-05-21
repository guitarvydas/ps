Currently we *think* that 
- code must be text
	- programming is text-only
	- the only way to control computers is by using text languages
- we must synchronize at all cost
- bloatware is acceptable
- compilation is mandatory
- *all* details must be specified in one big blog
	- not in layers
	- incrementally re-discovering layers (see #layers)
- human programmers must assist compilers
	- declaration before use
	- warp syntax to appease compilers
	- GPLs are more important than SCNs

- mid-1900s biases
	- strings are inefficient and should be avoided or tokenized
	- dynamic-length anything is inefficient
	- CPUs are expensive
		- CPUs must be time-shared
	- memory is expensive and scarce
		- memory must be re-used
		- mutation
		- GC (garbage collection)
		- -> MMUs, virtual memory
		- -> optimize CDRs away -> arrays, stack
		- shared memory
		- pointers
	- mathematics is the best notation for everything
		- CALL/RETURN built into hardware
		- Stack built into hardware
		- mutation and functions-of-time simply ignored because notation doesn't deal with these concepts, although computers support mutation and time-based sequencing

GPL ≣ General Purpose progamming Language
SCN ≣ Solution-Centric Notation
