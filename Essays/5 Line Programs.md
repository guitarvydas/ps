AFAICT, you don't need elaborate type checking if your programs are only 5 lines long.

You do want to check for stupid mistakes, like typos and numbers-of-parameters to functions.

The fact that you can "see" all 5 lines at once means that the principle of locality-of-reference is preserved and that you don't need elaborate type systems and other tools.  You only need simple checks.

So, the goal should be:
- *not* to allow 6-line programs, but,
- to make *all* programs 5 lines or less.

Programming is not "complicated".  Complexity comes only from poor choice of notation.

I argue that the minimum unit of concurrency is big-O 10 bytes.  Yet, Linux, MacOS, Windows, clock in at mega-bytes.  Programmers believe that concurrency (which they call "parallelism") is *difficult*.

The Elephant in the Room is the use of innapropriate notations.

If you need to write a 6-line program, instead of making it 5 lines long, you need to turn the dial up to a better notation.

## How?

Firstly, focus on the question of how to make *all* programs 5 lines long or less.

When I focus on this question, I come up with:
- synchrony is evil
	- too much synchronization causes epicycles
		- such as *preemption*
		- such as *thread safety*
		- etc.
	- humans deal with asynchrony every day 
		- e.g. interaction with other people
		- e.g. cooking recipes ("while the potatoes cook, chop up ...")
		- e.g. Org Charts and hierarchical business organizations
- we need a *Tiny Basic* programming language or something as simple as *Sector Lisp* as the basis of programming
- we need to plumb programming units together without causing dependencies (hint: ports, asynchrony, IoT, internet, components)
- we need to forget the dogmatic biases we formed in the mid-1900s 
	- e.g. CPUs are so expensive that we can only have 1, and, we *must* time-share it 
	- e.g. memory is so expensive that we need to worry about reusing it (GC, malloc (), etc.)
	- e.g. our hardware cannot draw graphics, but can only draw non-overlapping grids of small bitmaps (AKA characters), thus, we *must* use ASCII Art instead of diagrams (box ≣ `{ ... }`)
- When I look at *Sector Lisp*, I see beauty and simplicity and gain a new-found respect for functional programming.  *Sector Lisp* is <512 bytes[sic] long.  My understanding is that: as soon as you try to twist the FP paradigm by inserting stuff it wasn't designed for (e.g. mutability), you get bloatware (edge cases that breed more edge cases all the way down, producing megabytes of bloatware).  So, the question becomes "how do you snap mutable and non-mutable components together?" instead of "how do you force mutability into a programming language?".  Likewise, "how do you snap small snippets of FP into a concurrent frame" instead of "how do you express concurrency in a notation that wasn't designed for concurrency?" and "how do you keep all of the technical details, while eliding those very same details?" (my feeling: layers, hierarchy).

## Disclaimer: I Don't Mean 5 As An Absolute Number

I am simplifying...

"5" really means "I can see all of the code in one eye-full".

"6" means "I can only see some of the code, the rest of the code is elsewhere".

"5" means something like a software *atom*, whereas "6" means something like a software *molecule* (higher level construct composed of atoms).

S/SL again (Syntax Semantic Language).  In S/SL, big programs are divided-and-conquered into several passes.  Each pass declares the list of *atoms* that it will accept and the list of *molecules* that it might produce. Declaration => check for typos, Declaration => readability (other humans can see what was intended).  There are 2 reasons to read code 
1. to fix bugs, and,
2. to add features (maintenance).  Note that in the case of (1), the code is buggy, hence, the intention is buggy, but that's OK, since the reader only needs to know *what* was originally intended (and then tweak it or fix it))
3. to learn...