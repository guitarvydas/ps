FWIW, let's see if I can describe my model of computing...

# The Model

An electronic machine consists of 2 CPUs connected by 2 one-way wires, sending compact messages at each other, running essentially single-threaded software.

In this model, everything else is unnecessary, i.e. Operating Systems are unneeded and Programming Languages are just cave-man IDEs for creating electronic machines.

Everything else is bloatware based on 1950's phobias against wasting expensive CPU time and expensive Memory. The assumption was that it was better to waste programmers' time than to waste CPU time or Memory.

In the model described here, the answer is always: "just throw another rPI at the problem".

# How to "reuse" what already exists?  

VirtualBox, Docker.  

Most existing software is meant to be dropped into envelopes provided by Operating Systems.

# How Did This Begin?

I wanted to draw technical diagrams of device drivers without needing to resort to ad-hoc C and Asssembler.

Harel StateCharts are a good notation, a starting point, for writing device drivers. 

# Bloatware

Operating systems are State Machine wrappers for otherwise single-threaded, calculator applications.

Bloatware occurs when the "calculator" model is stretched beyond its comfort zone - e.g. how to build Sequencers using only calculators and State-Hiding Operating Systems?

# The Fiction of Code Libraries

It is believed that code libraries create re-usable blocks of code.

In fact, code libraries create synchronous blocks of code that resist reuse without the addition of epicycles.

Creating synchronous blobs of code - e.g. using the callstack (a LIFO, instead of a FIFO) - creates unwanted, tiny bits of inter-code dependency.

Because of this inter-code dependency, code libraries are not LEGO® blocks.

## What Are the Hidden Dependencies?

"Code Libraries" *look* like building blocks, but, contain subtle bits of coupling that discourage building-block-iness.

For example, the very common idiom of a function call `f(x)` introduces at least 3 kinds of coupling:
1. The name `f` is hard-wired into the caller's code.  The calling code cannot be cut/copy/pasted into some other solution without also dragging in the called code, or, by futzing with the source code.
2. The function call `f(x)` waits for the callee to return a value.  This is also known as *blocking*.  Function call notation works fine on paper, where functions can be evaluated instantaneously.  It's different when you map function call syntax onto hardware that has propagation delays wherein functions take finite amounts of time to "run".  This subtle difference in behaviour leads to hidden gotchas.  A glaring example of the impact of such a difference can be seen in the Mars Pathfinder disaster[^pathfinder].  
3. The function return `v = f(x)` hard-wires a routing decision into the callee's code.  The callee *must* direct its response back to the caller.  This is called "returning a value".  Again, this doesn't look like a problem when you just want to build fancier calculators, but, this hard-wired routing decision discourages simple solutions to non-calculator problems, like machine control.
[^pathfinder]: https://www.rapitasystems.com/blog/what-really-happened-software-mars-pathfinder-spacecraft

When you don't have complete isolation, you don't have building blocks.  Imagine a LEGO® set where all the pieces are joined together with a single, long sewing thread glued to each LEGO® block.  Or, imagine that you have two real-world objects, e.g. one apple and one orange.  You cut the apple in half.  What happens to the orange? (Answer: obviously, nothing happens to the orange)

As humans, we are used to the idea that objects are completely isolated.  Programs don't work that way.  We have to stop and think hard when writing programs.  


# The Fiction That Mathematical Notation is a Good Model for Electronic Machines

Grafting mathematical notation onto electronics that has physical limitations violates fundamental mathematical notation (not all of mathematics, just the notation) principles

For example, the mathematical model does not incorporate RAM, mutation, propagation delay, etc.  You *can* model these ideas in mathematical model, but, that's not sufficient.

The mathematical model hard-wires the concept of "function" - `f(x)` - into the notation.  Everything else is second-class.

Most existing mappings of the mathematical model onto electronic machines involves the callstack - a LIFO, not a FIFO.

Language influences thought.  Most problem solutions are insidiously mapped onto the functional domain before the problems are even understood and evaluated for their suitability of a function-based approach.

For example, the functional abstraction is suitable for building fancy calculators, like ballistics computers for military hardware.

As a counter-example, the functional abstraction does not work as well for developing sequencers, such as timeline-based movie editors, or, for extremely distributed, electronic machines, such as the internet.  It is *possible* to use the functional abstraction to solve these problems, but, it is less convenient.  The current solution is to enforce the use of "operating systems" in end-user devices.  For example, my 97-year-old mother wants a box that plays Tetris, another box that reads/writes email and another box that browses the internet.  To be able to do this in the current environment, she needs to pay for a "computer" that runs "Windows", but, has no real use for either of these things.

# Early Games

Games began as scripts of opcodes stored as binary blips on 8.5" floppy disks (plastic disks coated with thin layer of magnetic oxides).

You inserted the disk into the machine, and, the software took over the machine, with the sole purpose of turning the machine into a game. 

A game consisted of 3 aspects:
- visuals
- inputs (controllers)
- logic.

# Allowing Programmers to Create Electronic Devices Without Learning How To Solder

Programming of electronic machines using our current Programming Languages and Operating Systems allows programmers to create electronic devices without learning how to solder.

But, programmers need 4+ years of university education to learn how to lather epicycles onto every such design problem.

And, this current environment requires all end-users to pay for expensive electronic hardware and software that act like substrates for the products of programmers.

Is this an appropriate trade-off?

# $ Accounting for Computing Time

CPU time was meted out in $'s.

Day 1 of a university course in computing consisted of getting an "account" and being made aware of how many $'s were in the account, with the implication that all homework had to be done within the $ budget.

This bean-counting attitude influenced the way work-arounds for programming were invented.

# Apple Postscript Printers

Apple made it its business to attack niches of computing that were related to "artistic" use of electronic machines.

Early Apple machines enabled the Desktop Publishing market by installing CPUs into printers.  The CPUs ran Forth software tuned for placing dots of ink onto paper in eye-pleasing manners.  The Forth software was called *Postscript*.

Before Apple did this, printers were fairly dumb pieces of mechanics, containing the minimal amount of electronics.  Printers were controlled from afar solely by electronic, single-CPU devices called "computers".  

The burden of figuring out the details of how to control dumb printers fell on the over-taxed software of such single-CPU "computers".  To make matters worse, each dumb printer model contained different bits of mechanics and electronics, making the bookkeeping task more onerous for "computers".

# Notes ...
- fiction of sync lib
- fiction of grafting mathematical notation onto electronics that has physical limitations that violate fundamental mathematical notation (not all of mathematics, just the notation) principles, like RAM, mutation, propagation delay, etc.
- early games: slip 8.5" floppy disk into a CPM box, and the software takes over the whole machine to perform exactly one task: to play a game (visuals X inputs X logic) 

- allow Programmers to create electronic devices without learning how to solder, but needing 4+ years of University education to learn how to lather epicycles onto every design problem

- CPU time was meted out in $'s - day 1 of a University course in computing consisted of getting an "account" and being made aware of how many $'s were in the account, with the implication that all homework had to be done within the $ budget 

> [!INFO] Apple Postscript printers - enabled Desktop Publishing - put a CPU into a printer (running Forth - er, Postscript), instead of using a single CPU to  control it from afar

> [!INFO] premature optimization - use of sync math notation made it easier to think of single machines instead of distributed machines - doesn't model electronic machines in their full glory