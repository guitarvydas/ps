Is there a quantum of consciousness?

Is what we call *consciousness* simply layers-upon-layers of more-complicated-combinations of consciousness towers?

Failing of current mathematics:
- attempt to flatten everything to 2 dimensions
- exclusive use of textual notation

## Textual Notation For Math
- invented centuries ago for use with paper-and-pencil (and clay tablets)
- driven by weak hardware of mid-1900s that could represent text (non-overlapping grids of small bitmaps) more easily than graphics (overlapping windows, bigger bitmaps)

## Flattening
- discards otherwise valid dimensions, e.g. *t* (time)
- Ilya Polyani (Nobel laureate) criticises functional thinking at beginning of book "Order Out Of Chaos"
- causes "working too hard", AKA *accidental complexity*, AKA *epicycles*

## Complexity
- nothing is complicated
- complexity -> indicates problem with notation (a *tell*)
- use multiple notations to describe a problem, eschew single (complex) notation
- when a notation becomes complicated, elide the notation by layering a new notation over top of it

## Programming
- goal: allow use of multiple notations (languages, diagrams, spreadsheets, etc.)
- goal: plumb system together using disparate notations
	- solution ≣ system of sub-solutions
- goal: divide and conquer

## Concurrency

#concurrency

- concurrency is a lifestyle
	- parallelism is a greasy hamburger
- concurrency is pervasive in real life
	- everyday interaction with other humans
		- humans invent *protocols* and *societies* to deal with independent units
	- e.g. cooking
		- "while potatoes cook, chop ..."

## 0D Programs

- 0D ≣ zero-dependency
- goal: create programs using 0D units,
- anti-goal: (do not) appease, (do not) allow dependencies
	- kill *make*
	- kill *package managers*
- everything (but everything) is an independent unit
	- pervasive synchronization is a root of evil
- humans intuit independency
	- "free will"
- (see #concurrency)

## Example: Multitasking
- what is the smallest unit of concurrency?
	-  O(10 bytes)
```
LOOP:
  call test λ
  branch on quit to END-LOOP
  call do-it λ
  branch to LOOP
END-LOOP:
```
- N.B. no preemption needed
	- preemption -> epicycles (e.g. Mars Pathfinder disaster)
- N.B. O(10 bytes) not O(mega-bytes)
	- why is Linux (MacOS, Windows) so complicated?
- N.B. operating systems no longer needed
	- snap-together (LEGO®) what you need, not *everything* needed by *anyone*
- step-wise analysis favoured by theorists
	- but, step-wise analysis is "too complicated" for non-theorists (e.g. CFOs using spreadsheets)
- UX problem
	- provide a "language" (programming IDE) that suits the issues being considered
	- don't force one notation on *everyone*
- gaming
	- 
	- "something is wrong ...", but, we can't put our finger on it
	- spawn groups like Handmade Network
		- recognize that programming is "too complicated"
		- yet, use C++ and other behemoth technologies
	- Actors 
		- -> good notation for NPCs (https://en.wikipedia.org/wiki/Non-player_character)
		- -> not so good for graphics Production Engineering
	- current solution
		- use single notation - Production Engineering - for all game programming
	- Behavior Trees
		- force Actor model onto Production Engineering languages
		- (work too hard - develop otherwise simple concept and force it into a paradigm that it is unsuited for)
		- builds concurrency on top of synchrony (AKA epicycle)
	- preemption is a crutch
		- allows runaway programs
			- poor Q/A
		- preemption needed during dev
			- but preemption is not needed in Product (unless you allow poor Q/A)

## Premature Optimization is a Root of Evil
- not only *code* can be optimized
- notations can be optimized
- early optimization -> restricts out-of-the-box ideas
	- e.g. functional notation -> JS closures (poor UX)
		- CPS (Continuation Passing Style) is GOTO on steroids
	- e.g. multitasking is not hard
		- unless you try to express it in a synchronous notation