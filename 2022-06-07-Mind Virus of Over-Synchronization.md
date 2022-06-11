I think that our approach to programming stems from culture.

The cultural mind-virus begins in the over-use of low-level synchronization.

Humans intuit concurrency in everyday life (e.g. normal interactions with other people, AKA "free will").

Over-use of low-level synchrony inhibits concurrency and, therefore, defies human intuition (surprise: programming appears difficult when your intuition does not apply).

Pervasive use of low-level synchrony is a technique (AKA a trick) used for analysis of systems, but, makes for horrible UX for most other uses, like programming (not analyzing), like building internet servers, like building distributed programs, like building IoT, like building robots, etc.

Over-use of low-level synchrony makes all apps into gear-boxes, rife with dependencies.  Tweak an item over here and that thing, over there, starts working differently.

[[2022-06-07-Language Theory vs PEG Parsing]]

- gear-box
- PEG vs. Language Theory
	- they *look* the same, but lead to very different approaches to problem solving
- what to do immediately?
	- closures with FIFO queues between them
	- not LIFO queues like those caused by recursion
	- CALL/RETURN Spaghetti
	- goal: no dependencies
		- do not hard-wire names of functions into your code
		- use indirection
			- e.g. if you want to send a message to another component, leave it for your parent Container to route
		- use layers and hierachy
			- e.g. if you want to send a message to another component, leave it for your parent Container to route
			- send commands downwards
			- filter information back upwards
			- eschew flatness, gearbox behaviour of systems
		- do not use CALL/RETURN to send messages between components

Note that you can't have "physical objects" if they are all joined at the hip.  Most programming languages over-use synchrony and make all programs into big gearboxes.  Humans learn to intuit the other way around - everything is independent and not joined at the hip.

Over-use of low-level synchrony makes all apps into gear-boxes, rife with dependencies.  Tweak an item over here and that thing, over there, starts working differently.

Can we get rid of dependencies?  I argue: yes.

---

I think that our approach to programming stems from culture.

The cultural mind-virus begins in the over-use of low-level synchronization.

You can't have "physical objects" if they are all joined at the hip.  Most programming languages over-use synchrony and make all programs into big gearboxes.  Humans learn to intuit the other way around - everything is independent and not joined at the hip.

Over-use of low-level synchrony makes all apps into gear-boxes, rife with dependencies.  Tweak an item over here and that thing, over there, starts working differently.

If you build apps that are gearboxes, the apps are brittle.  If you build IDEs that are gearboxes, the IDEs are brittle.  If you build type systems that are gearboxes, the type systems are brittle.

Analysis of programming might need gearboxes, but gearboxes are less good as UXs for non-analysis-oriented programming.

Can we get rid of dependencies?  I argue: yes.

