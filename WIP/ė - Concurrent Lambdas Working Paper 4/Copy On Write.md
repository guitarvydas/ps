John Cowan suggested (in the FBP google group) using copy-on-write semantics instead of full-blown ownership semantics.

Basically, 
- objects are sent to outputs by reference
- any Component that wants to modify the message, must make a copy of it first
	- in JS this means using `var newdata = Object.assign ({}, message.data);`

Full-blown ownership first appeared in FBP.

Later, full-blown ownership was re-invented in Rust.

CoW (Copy on Write) semantics means 
- that the sender does not need to be checked for ownership.  All messages sent by a Component remain that property of the Component
- once data has been sent, it is marked as *read-only*
	- from that point on, even the Sender has to make a copy of its own message data before modifying it
		- assign-once semantics guarantees this situation anyway