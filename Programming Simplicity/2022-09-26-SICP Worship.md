Nothing is wrong with SICP, except that it is over-used and worshipped as The Way to Solve All Programming Problems. (aka “fad”).
  
SICP is about the Science of implementing Mathematical Notation on Computers, not, about Computers in general.

Computers implement “mutation”.  Period.  We call that concept “RAM”.

SICP & FP do not model “mutation”. FP only works if you expunge mutation.

If you try to model mutation using SICP, you get bloatware.

If you try to insert mutation into SICP & FP, you get epicycles.

When you strip all of that xxxx out of SICP and FP, you get Sector Lisp.  Beautifully small and simple.  The garbage collector is only 40 bytes [sic] long.

To maintain simplicity, don’t try to insert non-FP things into FP notation, just switch to another notation.

For example, all of the hand-wringing about “thread safety” is no longer valid.  You don’t need to worry about “thread safety” when CPUs and memory is cheap and abundant (e.g. rPIs and Arduinos and internet).

"Thread Safety" is an epicycle added on top of epicycles that butchered FP.  

"Thread Safety" is a concern only when you try to re-use memory and share CPU power.  We don't need to do that any more.

Real Computer Science consists of many aspects, e.g.
- how to map mathematical notation onto computers
- how to design Humane GUIs
- etc.

Note that mapping mathematical notation onto computers lets us build better calculators, but not better sequencers.
