# Question - Why Hasn't FBP Caught on and Become More Popular?

IMO, the answer cannot be given without a foray into an understanding of 0D[^0d].  

[^0d]: 0D means Zero Dependency.

I continue to struggle with finding ways to say "0D is important".

FBP's lack of popularity is due to a marketing problem, needing much market education.
- People don't "see" that there is a difference between functions and 0D
- This is akin to pre- and post-perspective Art - people didn't "see the need" for perspective in 2D artwork until "steam engine time" [Paul Morrison].
- This is akin to “If I had asked people what they wanted, they would have said faster horses” (attributed to Henry Ford).
- This is akin to the first use-case for electric motors - to pump water uphill to create artificial streams that could turn paddlewheels that ran factories [Digital Darwinism](https://www.amazon.ca/Digital-Darwinism-Survival-Business-Disruption/dp/0749482281)
- We have developed epicycles due to dependencies and workarounds that manage dependences (like *make*, *package managers*, nixos, etc.), instead of simply removing the issue of dependencies.
- Programming should be easy, but, modern programming using state-of-the-art languages is not easy.
- *Tell*: the prevalent notion that "multitasking is difficult".
- *Tell*: the prevalent notion that "distributed programming is difficult".
- *Tell*: the prevalent notion that "systems programming is difficult" 
	- and, can only be expressed using low-level languages
- If something looks difficult, invent a new notation to work with it.  
	- Create another layer to abstract-away the constructs in the current layer.
- Functional programming is a notation for working with calculators.
- Multitasking, IoT, internet, music and video sequencers, robotics programs, etc. are not calculators.
	- The dimension of time (*t*) cannot be ignored in a notation for building sequencers.
	- *Modeling* a fundamental concept (like *t*) is not as good as building a notation around the concept.
- Example: evolution of Software notation:
	- Electronics looked difficult, so opcodes and instruction sets were invented 
		- instruction sets are, but, a notation that abstracts-away the underlying rats' nests of complicated details of electrons flowing within oxides
	- opcodes and instructions sets using binary codes looked difficult, so Assembler was invented
	- Assembler looked difficult, so C was invented
	- C looked difficult, so higher-level languages were invented.
	- Now, programming in higher-level languages looks difficult ...
- The difference between *electronics* design and *software* design...
	- electronics components are 0D, completely isolated from one another
	- software components are rife with dependencies and built-in synchronization, N0D (non-0D)
- Analogy: LEGO®
	- single type - round peg
		- not many types
	- a single type begets simplicity
		- simplicity is "the lack of nuance"
	- 0D - no interdependencies
		- cutting one LEGO® block in half does not affect any other LEGO® block
	- LEGO® blocks can be snapped together to form larger systems
	- Larger systems built out of LEGO® blocks can be broken down by removing blocks
	- Blocks from one system can be reused to build other systems
	- Complete sub-systems can be broken away from existing systems and can be used to build other systems
- Software libraries and functions
	- Libraries of functions cannot be easily reused due to inter-dependencies.
	- Libraries of functions cannot be easily tested in a stand-alone manner, due to inter-dependencies.
- OOP does not support "message passing"
	- message passing in OOP languages is implemented using N0D Call/Return
	- is OOP an abstract notation, or, is OOP a technique for programming CPUs?
	- methods imply the use of blocking functions (see "functional notation", below)
- Functional notation is based on blocking state machines
	- e.g. `f(x)` blocks the caller until the callee returns a value
		- this is a state machine, the state is recorded as bookmarks on The Call Stack
	- "blocking" thwarts the efforts of Operating Systems to control applications, and, makes Operating Systems more dificult to implement (needing more nuance and workarounds, often resulting in latent gotchas)
- OOP "encapsulation" is not enough
	- "encapsulation" encapsulates data
	- "encapsulation" does not encapsulate control flow
	- control flow and data are not the same concepts, a single notation for both cannot be used without compromising one or the other
- "data" is layout of information *in storage*
- "control flow" is layout of behaviour *in time*
- previous attempts to subsume both, data and control flow, into the same notation have resulted in schizophrenic programming languages that sacrifice one or the other notion (popular today: sacrifice control flow layout, while emphasizing data layout)
- Structured Programming
	- attempt to apply structuring concepts to control flow layout
	- N.B. recommendation for structuring -> single input, single output 
		- layering
		- abstraction of control flow layout
- Analogy: Human Interaction, "Free Will"
	- humans understand how to deal with independent units (e.g. other humans)
	- hard-wiring synchronization into an underlying notation defies human intuition, giving rise to the notion that "programming is difficult" and requiring many years of schooling to learn to think in terms of over-synchronized units
- Diagrams
	- Humans understand blocks on diagrams to represent independent units
	- Mapping diagrams to Synchronous Programming Languages[^spl] defeats the purpose of creating diagrams
		- SPLs do not faithfully represent 0D diagrams.
- Flow-Based Programming can be improved
	- [[2022-07-11-Extending Flow-Based Programming]]

[^spl]: "Synchronous Programming Languages" means just about every popular programming language in use today, e.g. Python, Rust, Haskel, Lisp, JavaScript, C, etc.  Maybe Relational Programming Languages are not SPLs.