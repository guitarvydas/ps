Thread safety is a non-issue.

If we have only one program, it is, by definition, thread-safe.

If we have two programs,the solution to thread safety is obvious:
- buy 2 rPis
- put one program on one rPi, put the other program on the other rPi
- the programs communicate by using two wires[^onewire], one wire for each direction, A->B and B->A

[^onewire]: We can optimize this model to use only one wire through the addition of bloatware.

Instead,we feel bound by the confines of the 1950s and we try to put, by force, both programs onto the same rPi, through the addition of bloatware called *operating systems*, embodied in products like Windows, MacOS and Linux.

In doing this, we save $5.00[^cost].

[^cost]: Or,whatever an rPi costs these days.

