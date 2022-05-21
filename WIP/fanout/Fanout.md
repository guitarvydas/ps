Thoughts about fanout...

- I favour fanout, having used it heavily in electronics design
- Fanout is:
	- one output feeding multiple inputs
- issues
	- copying
		- output datum must be duplicated for delivery to multiple sinks
		- options
			- restrict fanout, allowing only scalar entities to be fanned out
				- i.e. entities that have type known to the system, e.g. int, string, etc.
			- supply a Copy method for each object, 
				- which does a deep copy
				- provided by programmer for user-defined objects (/ classes)
			- copy on write only
				- copying code provided by programmer
				- pass immutable reference in message

## Fanout Simple
### Raw Fanout
![[fanout-fanout.png]]
### Structured Fanout
![[fanout-structured fanout.png]]
## Fanout Less Simple
What happens when a Component has a fanout output and a non-fanout output?

### Raw

![[fanout-fanout 2.png]]

### Structured

![[fanout-structured fanout 2.png]]
### Structured Alternate

![[fanout-structured fanout 2a.png]]
## Questions
- should any output be allowed to fanout?
- should fanout be restricted only to Container (wrapper) inputs?

## Single Queues
Structuring is facilitated by the idea that there is exactly one (1) input queue per component.

### Multiple Queues
Alternate version (e.g. FBP) is to allow one queue per port.  

Multiple queues do not pinch message flows, hence, are less structured.