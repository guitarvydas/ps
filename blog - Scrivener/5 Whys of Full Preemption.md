Title: 5 Whys of Full Preemption  
Author: Paul Tarvydas

Q1: Why are multitasking libraries and operating systems difficult to use?

A: Because they use full preemption.

Q2: Why do multitasking libraries and operating systems use full preemption?

A: That is how multiple threads can be simulated on a single processor.

Q3: Why do we simulate multiple threads on a single processor?

A: Processors are expensive, so we can only afford to use one processor.

Q4: Why are processors expensive?

A: Processors used to be expensive, but they are inexpensive now.

Q5: Why don't we use multiple processors, one for each thread?
 
A: Because that is the way we always did it, starting with when processors were expensive.



# Conclusion #

Use multiple processors.  Stop trying to simulate multiple threads on a single processor.  If we must simulate multiple threads on a single processor, don't simulate scenarios, like memory sharing, that cannot be done using multiple processors (that just invites accidental complexity).


# Acknowledgement #

[5 Whys suggested by Daniel Pink in Masterclass: https://www.youtube.com/watch?v=My7hjBp4wH0]