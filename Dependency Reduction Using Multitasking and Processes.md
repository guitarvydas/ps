Dependencies can be reduced by using the *sledge-hammer* technique of multitasking and processes.

Processes are envelopes that contain code and make it impossible for that code to invoke other bits of code (e.g. libraries, other processes) other than through explicit message-passing.

Multitasking fakes asyhchronous computing on top of synchronous computing, and, hence, is rife with gotchas, like *thread safety*, *semaphores*, *priorities* and *priority inversion*, etc.

Multitasking tangles up several issues into a single complicated structure, e.g.
- 0D (zero dependency)
- timing (simultaneity).

Most often, the tangled structure is known by the name *parallelism*.

Multitasking could be replaced by *closures*, but, due to historical prejudices, multitasking is considered to be separate from such more efficient concepts.