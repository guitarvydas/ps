 # Parallelism
  
 Parallelism consists of two concepts. 

 📍 The first is 0D, and 

the second is scheduling. 

  📍 0D means zero dependency.

0D is the idea of creating decoupled units of whatever we are designing. 

  📍 In software, we create completely decoupled units of software. 

  📍  📍  📍 The units cannot refer to each other. You cannot hardwire the names of other functions inside of functions. 

  📍 You cannot block waiting for functions to return values. 

 📍  Routing is not hardwired. Components might return a value to the caller. On the other hand, components might also return results elsewhere. This decision is left up to the designer in zero d. 

 📍  You can only send messages with some kind of data between units, and you do not implicitly wait for an answer. If you need to wait for an answer, then you perform some sort of synchronization handshake.

The second  📍  concept of parallelism is called scheduling.



Scheduling breaks  📍  down into two kinds. 

There is sequential scheduling and simultaneous scheduling. 

 📍  Sequential is what we are used to. Sequential scheduling is the idea of just arranging units to come one after another in time. 

 📍  Simultaneous scheduling is what we often call parallelism.

 Simultaneity

 breaks down into two kinds of parallelism. 

 📍  Parallelism is where the units of software are completely the same and basically run at the same speed, but result in faster execution when started at the same time. 

 📍  Then there's concurrency where the units contain different kinds of code. The units all start at the same time, but they run at their own speed and finish at different times. 

 📍  The encapsulating wrapper waits for all of the units to finish work before producing its own summarized result.

