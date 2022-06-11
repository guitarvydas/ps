> An analogy I've found useful in this area is the difference between a telephone conversation and postal correspondence.  
On a telephone I can ask you a question like "is it raining there?" and then wait for the answer, which might be "yes" or "no".  
If we are corresponding via post this doesn't work: your "yes" message back to me might arrive late, so I am lacking temporal context (when was it raining?) or it might be out of order, so I don't even know what question it was answering.  
When corresponding via post, we need to include enough context in our replies so they can be fully processed as stand alone messages. Once we do this we can get rid of all the state (eg promises) hanging around waiting on phone calls where we're on hold.  
I find this useful for trying to help people understand that by including a little more detail in the messages they're sending, they can eliminate all this unnecessary baggage in their programs.

Interesting.  Thank you.

Orthogonally, I wonder if this begins to explain an aspect of REPLs...

> I'm usually designing systems at this strict message-passing level these days (enforced by both network boundaries and adversarial lines), but I'm very happy with anything that drives these same ideas and principles lower into the stack. I think the same principles apply down there, and we should look at the programs running on our devices, the libraries we invoke for writing those programs, and even potentially the operating systems and hardware themselves with deep suspicion.

Interesting.  Thank you.

Orthogonally, I wonder if this begins to explain an aspect of REPLs...

...

Aside: I currently believe that we need a new programming language for message-passing, and, that this language needs to go through a "structured programming" revolution.  Currently, we construct message-passing systems using lumps of assembler-like libraries stored in our toolboxes, like thread libraries, semaphores, pub/sub, etc., etc.  At one time, malloc() was but a library but then was promoted to a first-class concept which became GC.  "Modules" became OO.  I watched early message-passing crash and burn due to a lack of "structured programming".