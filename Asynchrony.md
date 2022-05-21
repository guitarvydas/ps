By "asynchronous" I mean truly asynchronous by default.  

Not thread libraries (which are ways to kludge asynchrony on top of synchrony).  

Async and sync are 1st class - orthogonal - concepts.  

You *can* express asynch in the sync paradigm, but this is a waste of time, a make-work project.  

All humans inherently understand asynchrony - they live it every day of their lives.  

Programmers need to go to University for several years, to be able to learn to think in the synchronous paradigm and to learn to ignore their instincts.  

Humans don't expect a ball to start moving when they cut an apple, but this happens in programming every day. 

Computer programming, with current-day programmig languages, creates mysterious, spooky action-at-a-distance, deep, hidden, dependencies.

Current programming languages hide the fact that synchrony is pervasive.  This makes it hard to figure out what is going on.  This makes it hard to design systems, especially distributed systems like the internet.

Note that *ethernet* is completely asynchronous and doesn't contain any synchrony. In the unusual case that two devices try to use the ethernet wires at the same time, they don't synchronize, they just back off for "random" amounts of time and try again.