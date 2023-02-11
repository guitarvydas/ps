Title: 5 Whys of Multiprocessing  
Author: Paul Tarvydas

# 5 Whys of Multiprocessing #

Q1: Why don't we use multiprocessing more often?
 
A: Because multiprocessing is difficult.

Q2: Why is multiprocessing difficult?

A: Because it is complicated.

Q3: Why is multiprocessing complicated?

A: Because it has race conditions.

Q4: Why does multiprocessing have race conditions?

A: Because Threads share memory.

Q5: Why do Threads share memory?

A: Because it is more efficient to share memory when Threads are on the same processor.  

Q6: Why do we use the same processor for Threads?

A: Because processors and memory are expensive.

Q7: Why are processors and memory expensive?

A: They're not expensive anymore.


# Conclusion #

We need to stop sharing memory.  We need to put Threads on separate processors (aka, IoT and distributed processing).

# Aside #

Actually, the physics of parallel systems implies that we must always deal with real race conditions, but, race conditions based on memory sharing, priorities, etc. are accidental complexities.  Race conditions caused by physics were explored and handled in the 1970's by Electrical Engineers.  Maybe even earlier.  Race conditions due to physics are found in the arrival of so-called simultaneous events (we are re-discovering these real problems, when dealing with distributed systems).



# Acknowledgement #

[5 Whys suggested by Daniel Pink in Masterclass: https://www.youtube.com/watch?v=My7hjBp4wH0]