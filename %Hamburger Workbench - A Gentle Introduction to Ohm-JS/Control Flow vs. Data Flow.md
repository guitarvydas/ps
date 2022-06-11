Raoul posted to PiLuD:

> i guess relatives of Scratch can only show control flow. the blueprints in Unreal stress dataflow primarily in my experience. i feel like dataflow is more intuitive. blueprints is clunky for control flow overall. i have not used enso yet. any thoughts on how to manage the various concerns and support good ux, without just falling back to 2d walls of text? (sure, that is an important fallback lowest common denominator.)

IMO, Scratch does not show control flow, but, only a subset of control flow.  Sequential Control Flow.

IMO, Control Flow and Data Flow are completely orthogonal (unrelated, independent, 0D (zero-dependencies)).

Program Theorists have spent most of their time theorizing about dataflow.  And, they've been trying to force control flow into a dataflow paradigm, to suit their notations.

Hence, the IDEs (AKA programming languages) for dataflow are better-developed and "more intuitive" than IDEs for control flow.

For now, the best you can do is to use manual techniques to fill in the gaps.

Kinda-like the revolution that happened when "structured programming" first appeared.

At one time, "everyone" used assembler to build programs.  Then, "structured programming" was introduced.  

Seasoned assembler programmers hated it.

The best you could do at the time was to "think structured programming, but, use assembler" and to do things that seasoned programmers hated (e.g. write "inefficient code" that had "better" UX).

Then, HLLs gathered steam and, then, gcc began creating code that humbled seasoned programmers.  Thankfully, the seasoned programmers retired, and, now almost no one uses assembler.

---

The answer is simpler than you think...


So, yeah, any dataflow 

---

My suggestion:
- draw a diagram
- convert the diagram to code.

Example: ...

To express:
1. sync control flow, draw nested boxes (like Russian Dolls)
2. async control flow, draw independent boxes with ports (input AND output ; no hard-wired names of other boxes), like "network diagrams" (but in the small)
3. dataflow, use OO or other socially acceptable forms of "programming"

How do you know if you want (1) or (2)?  Start drawing.  

If your solution really, really, really needs a Loop (AKA recursion) then it's probably a sync solution.

If you can expunge all looping (say, by sending feedback messages), then you can get away with expressing the problem in async.

Divide and conquer is considered to be a no-brainer, but, what isn't discussed is that for D&C to work, the divided components must be *fully* independent (AKA concurrent[^pike]) in the orthogonal dimensions of Control Flow and Data Flow (dealing with only one of the dimensions is not D&C)

[^pike]: "Concurrency Is Not Paralellism".

Defer operational details.

Details:

Popular programming languages cover only one kind of control flow: synchronous control flow, but, there are 2 kinds: sync and async.  "Modeling" async control flow in a sync paradigm leads to epicycles and bugs (see Mars Pathfinder).

IMO, Control Flow and Data Flow are orthogonal concepts.  The programming community has been trying to squeeze both orthogonal concepts into one notation, the result being hacks like Callbacks and CPS (which is really just GOTO deja vu all over again).

Concurrency is easy, if you don't mangle it by building async on top of sync on top of async (currently, the norm). 