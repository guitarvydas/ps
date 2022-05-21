Our current breed of programming languages use text exclusively.

We use
```
{
  var x;
  ...
}
```

To mean

![[ASCIIart ė.png]]

But, the textual version does not clearly show the boundaries (the scope) of `var x;` whereas the diagram does.

I think that programmers got into global variable trouble because the textual syntax did not place solid fences around variables.  What else will become problematic if we continue using ASCII Art instead of intuitive drawings for syntax?

We used ASCII Art because:
- mid-1900s hardware did not support graphics (well),
- we based programming notation on mathematics notation
	- but, mathematics notation was invented for pencil-and-paper (and clay tablet) usage.

Computer hardware has advanced to allowing us to represent diagrams instead of only using non-overlapping grids of small bitmaps.  We use these new capabilities for business software, but, we continue to use mid-1900s biases for programmer software.

Furthermore, programmers think that "concurrency is hard" because of their use of a sequential, text-based notation.  Concurrency is "obvious" to normal people.  Disjoint boxes on diagrams are concurrent.  Concurrent boxes send information to one another via lines on diagrams. Concurrency is encountered in day-to-day life.  Pervasive synchrony is not intuitive and we have to think hard to figure out how to use it.  Synchronization is intuitive to normal people, they create synchronization every day when interacting with other people.
