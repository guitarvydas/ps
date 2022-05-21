# Bloatware

minimum unit of concurrency:

```
Loop:
  CALL Test
  BRtrue EndLoop
  CALL Do-It
  BR Loop
EndLoop:
````

Yet, Linux, MacOS, Windows are Mbytes in size...

N.B.
- the above loop looks similar to a windowing main loop
- the above loop works like concurrency in early Games and Controllers
- semaphores, priority inheritance, etc. -> epicycles to support faking concurrency in synchronous paradigm

---
# Concurrency

- fundamentally simple concept
- normal people understand, inately, concurrency
	- "free choice"
	- cooking recipes "while potatos cook, chop ..."
	- business organizations
	- Org Charts

---

# Bloatware: Bloatification of Programming

---

## Bloatification of Programming - Concurrency

Concurrency is bloatified by poor choice of a notation for manipulation

Constructs like *semaphores* and *thread safety*, etc. were invented only to allow *faking* concurrency in the synchronous paradigm.

---

## Bloatification of Programming - Programming

Programming further bloatified by forcing concepts into beautifully simple FP paradigm
	- e.g. mutability
	- e.g. memory sharing (-> heaps -> GC)
	- e.g. timesharing

Leave FP alone, invent another notation

(See [Sector Lisp](https://justine.lol/sectorlisp/) for an example of how beautiful de-bloatified FP can be.)

---

## Bloatification of Programming - Ignoring Tells

- multitasking is "hard"
- programming is "complicated"
- essential complexity (mind virus - stop looking for a better notation, because this is just a hard problem, nothing you can do about it, move on)

---
#mid1900sbiases

## Bloatification of Programming - Mid-1900s Biases

- CPUs are *very* expensive
- Memory is *very* scarce
- hardware cannot support overlapping windows of bitmaps
- exclusive use of clay-tablet notations for programming (e.g. written forms only, no cave paintings)
- ASCII Art
- Clay-tablet notations
- Efficiency

---
## ASCII Art

`{ ... }` just means `box`

`{ var x; ... }` just means `box` with a temporary slot called `x` (the slot is in-scope to all containees of the box (including inner boxes))

`f(x){ ... }` means the same as above, except that the value of `x` is determined by the caller.

## Binding
Binding is like assignment and mutability, except in a more-restricted form.  

Mutating something, or re-assigning it, is performed by creating yet another λ.

Let the system do the re-assignment for you, e.g. by modifying The Stack.

---
## Clay-Tablet Notations

Clay-tablet mentality:
- flatten everything, 
- discard whole dimensions
	- simply ignore dimensions that don't fit the chosen notation
- must be black or white (allow nothing in between)

Ignoring dimensions is valid if:
- ignored dimension has <<10x effect on outcome
- chosen notation clarifies some aspect of the problem/solution

 Ignoring dimension is invalid if:
 - the notation is used out of context.

Example: using functional notation to describe multitasking.  Functional notation relies heavily on absence of mutability and absence of *time*.  But, multitasking requires *time* (sequencing, asynchronous message-passing).  Conclusion: invent another notation to write programs that involve multi-tasking.

---

## Efficiency
Relegate thinking about low-level "efficiency" to Production Engineering.

Do not conflate program creation, aka Design, with Production Engineering.

Design and Production Engineering are two different activities.

---
# DI - Design Intent

DI is meant to communicate intent to other humans.

Machines don't care about DI.

Machines can deal with obfuscation, humans can't.

