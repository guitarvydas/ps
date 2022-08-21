A Container is implemented by composition - it contains children components and can route messages between its direct children.  

Children are Components.  

A Container cannot know if a Child is implemented as a Leaf or as another Container.  

Containers are recursive.  

Components cannot send messages directly to peer components, they can only send messages "upwards" to their enclosing Containers.  

Containers route messages.  

Message routing is, before optimization, indirect.  

Message routing indirection allows systems to be composed of Components.  

Message routing indirection allows systems to be reconfigured easily, incorporating Components from anywhere else, including other systems.  

A Container can route messages between its children.

A Container can route messages from its own inputs to its children, or, to its own outputs.

A Container can route messages from its children to its own outputs.

A Container can choose to not route certain messages at all.  For example, a Container can leave any child input unconnected (N.C. "No Connection"), and, a Container can leave any child output unconnected.

Message routing can employ fan-in and fan-out.
- fan-in means that one input (a *message sink*) can accept input message from multiple sources
- fan-out means that one output (a *message source*) can be delivered to multiple receivers.  The semantics of implementing fan-out needs to be carefully designed, since it involves possibly making copies of messages (or, of sending messages as references, or of implementing copy-on-write semantics).

Fan-out must, also, be carefully implemented on bare-metal (no operating system) systems.  Message delivery must be atomic.  Messages cannot  be interleaved.  On bare-metal systems, this means that message-sending in fan-out situations, must be done using locks (so that receivers cannot receive other messages while one message is being distributed).

Fan-in and fan-out are required for building structured message-sending systems.  These concepts make it possible to abstract groups of components and to replace them by a single component (a restricted form of this concept is called "referential transparency" in functional-programming-based systems).

Components have exactly one (1) input queue and one (1) output queue.

Message-sending is deferred.  When a Component `send ()`s a message the message is placed on the Component's output queue and is not immediately processed.  The enclosing Container distributes all queued up output messages only when a Component has finished its work. 

A Component can process only one input message at a time.  Leaf Components execute all of their code and leave results in their output queue.  Container Components execute *steps* and propagate the steps to their children, recursively.  This implies that the code for handling input messages in Containers be done in a series of steps, too.  A Container must not begin processing the next input message until all of its children have finished their work.  This means that Implementation of Containers be done carefully.  I chose to express the POC algorithm as a Drakon diagram 

![[../Papers/step.png]]. It is likely that the algorithm could be improved and optimized.