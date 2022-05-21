The current fundamental unit of programming, the `synchronous function`, is holding us back from thinking about concurrent programming.

It's not *stopping* us from trying to think about concurrent programming, but it is holding us back.

I argue that if, instead, we used a fundamental unit of programming which does not include pervasive synchronization, we might go further when thinking about things like
- robotics
- IoT
- blockchain
- UX, GUIs, etc.

Making *everything* synchronized by default is causing epicycles.  We waste time/brain-power on figuring out work-arounds.

Making *everything* synchronized by default causes hidden dependencies.  I argue that we should be striving for 0D - zero dependency - software, instead of wasting time inventing package managers, operating systems, character-based IDEs (like programming languages), Docker, nixOS, etc., etc.

For example, the innocuous function call 
```
f(x)
```
creates at least several dependencies:
- The function's name, `f`, is hard-coded into the above statement
- Blocking - the `caller` is automatically blocked (not by the Operating System) when it sends a command to the `callee`.  Will the `callee` be blocked, too?  We don't know without closer examination (this kind of thing makes testing hard).
- A `return address` is automagically written to a mutable, shared variable - The Stack.
- The `callee` *must* return a value to the `caller`.  The `callee` has no choice in the matter.  The `callee` might want to send its result somewhere else, but, it *must* send some kind of result to the caller.