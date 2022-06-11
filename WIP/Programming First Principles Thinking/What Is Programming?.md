The main purpose of programming is to control the machine.

A secondary purpose of programming is to create control scripts that can be easily changed.

Early attempts at writing scripts were based on existing clay tablet technologies like pencil and paper and mathematical notation, and our main input interface to computers was modelled on existing typewriter technologies like the QWERTY keyboard.

These decisions were based on the limitations of mid-1950s computer hardware which made it easier to input and display grids of fixed size, non-overlapping, small bitmaps.

Technology that supported resizable overlapping windows was invented later and was used for improving the capabilities of end-users, but, programmers continue to write scripts using character bitmaps. Most of our existing programming languages remain affected by tease decisions made in the mid-1950s.

Early beliefs included 
- the idea that computers would be mostly useful as programmable calculators
- that existing office technologies like desks and filing cabinets would model interaction with computers
- scripting sequentialism based on the English language 
	- text is read from left to right 
	- lines are read from top to bottom 
	- lines of text are assumed to follow one another in a strictly sequential order.
- that inter-component synchronization was difficult and needed to be hard-wired into programming languages
- single-pass compilers are necessary for "efficiency"
- only two (2) colours can be used in scripts - black and white
- all program scripts are knowable from the start, hence, can be strongly typed into hierarchies and other classsifications
- optimization trumps design
	- conflation of Engineering with Implementation
- a requirements document can be created
	- without further experimentation
	- implies that users know what they need and can communicate requirements to programmers

The decision to use implicit synchronization hardwired into the bowels of programming languages has made it very difficult to graduate to other technologies, like diagrams. Humans understand drawings and diagrams to represent asynchronous components. The fact that synchronization is hardwired into programming languages makes it difficult to transfer whiteboard drawings to written programs, because of the chasm of operational differences between the behaviour of asynchronous systems and the behaviour of synchronous systems.

The decision to use single-pass compilers has led to anti-intuitive UX decisions, such as *declaration before use*.  It is "obvious" that programmers want their development machines to catch and highlight as many programming mistakes as possible, but this does not imply that languages must use *declaration before use* semantics.  Simple textual languages could be compiled in multi-pass manners allowing *declaration anywhere* semantics and allowing the programmer to decide what text goes at the top of a file vs. appearing later in the file.