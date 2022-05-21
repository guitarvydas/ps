The fundamental unit of programming is an asynchronous function, I call it an ė[^lithuanian]

An ė has two (2) queues
1. input queue
2. output queue.

An ė does not block, it always runs to completion and produces a single result output message on its output queue.  The message data block can be deconstructed to appear to contain more than on datum. 

## Deconstruction

Note that what we call *functions* are actually blocking ės, that contain exactly one (1) input and one (1) output. 

When inputs are deconstructed into various datums, we call them *parameters*.

## Blocking

What we call *blocking* is implemented by *operating systems* **and** by CALL-RETURN.

Operating systems wrap functional units in state-machine envelopes.

### Preemption

Since *blocking* can be controlled by CALL-RETURN, *operating systems* have to resort to a trick to pry control away from functional units.  

We call this trick *preemption*.

*Preemption* can happen "at any time" and the operating system nor the functional programmer can control when *blocking* occurs.

In essence, no one can "tell" if the functional unit completed its work or was suspended part-way through.

To alleviate this ambiguity, hardware has been given the ability to save the state of a functional unit (usually on a global variable called the Stack).

If we could *guarantee* that blocking due to preemption never suspends functional units part-way through their operation, then we could *optimize* the blocking by not using hardware state-saving.

Since, there is no way to tell if a functional unit is in the "in-progress" state or in the "finished" state, we can (arbitrarily) dictate that *all* blocking only happens at convenient boundaries, i.e. blocking never occurs in the middle of computation.  Blocking can only occur *after* a computation.

This dictate has consequences:
1. Loops, recursion cannot be used during computation.
2. We do not need to save the state of a computation, since a computation is never interrupted (a computation is atomic).  This allows for *optimization*.

#### Looping

We use *loops* only out of habit.

Our model of CPUs have supported that habit, but the internet and other forms of distributed programming, have pushed this model beyond its breaking point.

In a message-based system, a *loop* can be simply implemented by sending oneself a "do it again" message.  There is no need to hard-wire *Loop* into any programming language.

Since *recursion* is the generalization of *loop*, we extend this edict to include "functional units must not rely on deep recursion".  Shallow (terminating) recursion is OK, since we cannot know how a functional unit is implemented, we can only know that it terminates and will "run to completion" in a "short" amount of time.

How short an amount of time?  The answer is "it depends".  
- Short enough not to inflict undue turn-around time during development.
- Short enough to allow products to use cost-reduced hardware (after having been Production Engineered).

Note that the time-scales are different in both of the above cases.  Developers often use souped-up hardware that is expensive.  Products, though, use the cheapest hardware that can be tolerated, e.g. gaming boxes.

#### Preemption During Development

During development, it is possible to write erroneous programs.

Sometimes, such programs enter "endless loops" (or infinite recursion).

During development, then, we desire to have the ability to "kill" a program and to preempt it in mid-computation.
	- Q: Do we want to save the state of the program in such cases?

We don't need full preemption in products, though.
	- We might need sandboxes that run apps and prevent them from scribbing on memory/data that belongs to other apps.
	- We might want to "kill" apps that display buggy behaviour.  I imagine that we never care to save the state of such buggy apps.  "Kill" and "clean up / recycle memory" are the only operations we might want in such cases.
	- We might consider the use of sandboxes for file systems.  If a buggy app is killed, all files that it created are destroyed, too.  
	- Note that internet browsers are backing into this kind of structure.  Apps run in sandboxes and cannot access local file systems.

We might be able to optimize hardware and operating systems by targetting specific uses of such systems:
1. development
2. products.

# Theory

I posit that all programming constructs can be created using ės.  

This theory can be tested by expressing
- FBP Collate using ė
- functions as ė
- Lambda calculus (λ) as ė
- etags and event-driven concurrency in ė
- HSMs in ė
- Drakon diagrams in ė.

[^lithuanian]: No Greek letters here.  ė is a Lithuanian letter.  This letter is available in Unicode.  The Lithuanian letter ė is pronounced as *eh* (like in "Canadian, eh?" or the hard "A" in English). 

I posit that functions are a subset of ė.  Functions present opportunities for optimizing ės
- such as using the global variable, The Stack, instead of output queues
- such as using the global variable, The Stack, instead of input queues
- such as using optimized, CDR-less, lists (i.e. Arrays, Stacks) instead of full-blown queues.