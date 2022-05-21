*Concurrency is a healthy lifestyle, parallelism is a greasy hamburger.*

Concurrency is often conflated with parallelism.  

The two are not the same.

Concurrency is a programming paradigm.

Concurrency is a way to write software programs that have no dependencies on other programs.

Parallelism is a specific optimization of a program that is already written in the concurrent paradigm.

Not all programs written in the concurrent paradigm need to be parallelized.  

All parallel programs are written in the concurrent paradigm.

Programs written in the concurrent paradigm without dependencies:
- can be composed with other programs to make systems
- can be duplicated[^dup]

[^dup]: Copy/Pasted, for example.

Systems composed of concurrent components can be scaled more easily than systems that contain inter-dependent components.

- See also, [Rob Pike Concurrency is not Parallelism](https://www.youtube.com/watch?v=oV9rvDllKEg)

## Function Calls Create Dependencies
This simple line of code:
```
f(x)
```
creates a hard-wired dependency.  

The above line of code *depends* on the fact that a function named `f` exists.

The name `f` is hard-wired into the above code.

Indirection, e.g. `(*f)(x)` or e.g. DLLs, potentially breaks dependencies.

Note that DLLs only go *half way*.  DLLs use indirection to *call* functions, but rely on a global variable, the stack, for *return*ing from functions.

The above notation, also, creates another form of dependency - synchronous blocking.  The notation implies that the caller *blocks* until the callee *return*s a value.

This usurpation of the control of *blocking* by CALL/RETURN is a reason why operating systems need to resort to using the sledge-hammer of *preemption*.

## Anonymous Functions, Lambda Calculus

Lambda calculus teaches that a single type must be used exclusively.

This single type is *the callable function*.

Lambda Calculus makes it *appear* that multiple types are being used, but these are sub-types of the main (single) type (*callable function*).

In fact, in LC[^lc] and FP[^fp] all parameters (usually typed) arrive in a synchronous manner - in a block, usually on the stack.  This is a manifestation of synchronous dependency.

[^lc]: LC ≣ lambda calculus
[^fp]: FP ≣ functional programming.

Likewise, in LC and FP, functions return values in single synchronous blocks.

## Humans vs. Concurrency

Normal humans deal with concurrency on a daily basis, e.g. in dealing with other (independent) individuals, cooking recipes ("while the potatoes cook, chop the ..."), business organizations (hierarchical, scoped, isolated (encapsulated)), forming societies and laws, etc.

Programming in the synchronous paradigm causes humans to forego their intuition and to learn new ways of dealing with programs.  Thinking this way often results in *gotchas* (e.g. the Mars Pathfinder disaster[^mp]).  Humans have dealt with concurrency for millenia, but have only dealt with pervasively-synchronous processes for decades[^1].

[^1]: Or centuries, depending on perspective.
[^mp]: https://www.rapitasystems.com/blog/what-really-happened-software-mars-pathfinder-spacecraft

## How?

How do you write code so that it is concurrent?

- Make sure that a code unit is completely, utterly, stand-alone.
	- it must not share memory with any other code unit
	- it must not share control flow with any other code unit
	- it must be writtten such that it can be invoked at any time, in any order
	- it has explicit inputs
	- it has explicit outputs
	- it does not contain hard-wired references to other code units
	- it does not implicitly synchronize with other code units
		- it can, though, use implicit synchrony internally
		- it must not use implicit synchrony externally
		- if synchronization is required, it must be explicitly programmed in (by the Software Architect, or, by the Software Engineer, or, by the Software Implementor, or, ...)
		- example of synchrony: `f(x)`
		- example of synchrony: CALL / RETURN (implicit blocking, use of a global shared array to bookmark "where it left off") 
	- it must not block (on its own), all blocking must be controlled *only* by the "operating system" [^noos]
	- it must perform one step of computation, then yield, or, it must finish all of its computation in one gulp
		- it must remember where it left off - bookmarking
		- bookmarking must be completely local and not be based on a global, shared data item (e.g. no hardware-supported "stack"[^stack])
	- inputs can come "at any time" (think web servers or daemons), 
		- if synchronization of inputs is required, it must be explicitly programmed into the code (this was well understood in hardware design in the 1960's)
	- outputs are not forced to be "returned" to the caller
		- outputs *might* be sent to any other code unit
		- outputs *might* not be sent at all (0 outputs)
		- outputs *might* be sent back to the caller (but not necessarily)
		- generation of outputs can depend on control flow through the code unit
			- the unit *might* produce certain output(s) under certain conditions
			- the unit *might* produce other output(s) under different conditions
			- the unit *might* produce no outputs at all (AKA a "buffer")
- "nice to have" - measure throughput
	- hint: defer routing of outputs

[^stack]: In fact, early IBM 360's did not have a hardware-supported stack.  Programmers had to explicitly build a list of bookmarks (e.g. by using the BALR instruction)

[^noos]: I argue, elsewhere, that we don't need operating systems at all.  Snap an app together using only what you need, not everything anyone has ever thought of.

My preferences:
- code units are 1st-class functions, closures[^closure], anonymous functions
- components (code units) have explicit inputs and explicit outputs, I call them ports (0 or more of each)
- components have one input queue
- components have one output queue[^queue]
- messaging
	1. messages are blobs of data
	2. each message, also, contains a tag (I currently call it an *etag* in hopes of using a word with no meaning and no baggage)
- lambdas are internally concurrent, (see ė working papers)
- DaS - Diagrams as Syntax - if you use only concurrent components, then, you can draw sensible diagrams of systems composed of concurrent components (incl. the dreaded box-and-arrow diagrams (which don't work very well in the synchronous paradigm))
- Two (2) kinds of Components:
	1. Leaf
	2. Container
- Containers are recursively defined - Containers contain other components (without judgement about how they are implemented (e.g. implemented as Leaves or as Containers))
- Containers contain *children* (other Components) and *routing* information and *net* groupings
- Containers route messages from child to child (the usual case)
- Containers can route messages from their own inputs to the inputs of their children (another usual case)
- Containers can route messags from their children's outputs to their own outputs (a usual case)
- Containers can route messages from their own inputs to their own outputs (an edge case)
- Containers can only refer to their immediate children (they cannot refer to other Components, they cannot "reach in" and refer to children of their children, they cannot refer to peer components, etc.)
- Containers *step()* their children (a Container performs a *step* by delegating the *step* to its children)
- Containers are *implemented* by the children they contain
- Containers are *busy* if any child is busy or if any child has input messages queued up
- Components are *ready* if they have input messages queued up and are not *busy*
- Leaf components are never busy - they perform *all* of their work in one step in *seemingly* zero time
- Messages can fan-in (inputs can arrive from more than one component)
- Messages can fan-out (outputs can be sent to more than one component)
- Ports can be N.C. (no connection) - an input port *might* not be connected to any message source, an output port *might* not be connected to any message sink
- A Component cannot know if its ports are connected to any other Components
- A Component cannot know which other Components it is connected to
- Message delivery is *atomic* - if a message fans-out, then it is delivered to *all* receivers "at the same time" without allowing interleaving of other messages.  Atomicity is not a concern if the system is implemented in the synchronous paradigm (i.e. just about any language or O/S that is commonly used today) and matters only on bare metal. Synchronous languages (and O/Ss) guarantee[^guarantee] that messages are delivered atomically, due to the (unneccessary) use of pervasive synchronization.
- Concepts that fade away: things like thread safety, semaphores, priorities, priority inversion, preemption[^preemption], etc., etc.  The goal should be to *allow* the implementation of such concepts, but, not to build these concepts into *every* piece of software (this leads to bloatware and to dead code).
- Components are defined by a prototype *signature* and a separate prototype *implementation*.  Runnable components are instantiated from the the prototypes. 
- A Container assigns a unique name (id)[^id] to each runnable instance of its child components.

[^id]: Names exist only for human-readability, especially when the programs are represented in textual form.  Computers /  transpilers / compilers don't care about the names.  Components, drawn as diagrams don't need  names, since their (x,y) position gives them uniqueness that is inherently understood by humans.

[^guarantee]: I do not consider the guarantee of synchronicity to be a good thing.  It is, though a fact of life in today's programming languages.  I believe that too-much-synchronicity is at the root of many epicycles (which lead to gotchas).

[^closure]: A *closure* is an anonynous function which has been Production Engineered to separate the Red Smarties from the the rest, i.e. it is a compilable version of a first-class function (AKA lambda). If you don't know what a Smartie is, think of coloured jelly Beans or coloured M&Ms.  In Canada, it is common to eat a box of Smarties (coloured, candy-covered chocolates) and save the red ones until the end.  This is such a prevalent behaviour, that marketing people picked up on it and produced a TV commercial that had the tag line "Do you eat the red ones last?".

[^preemption]: Preemption is, actually, only needed during development, to help control runaway programs that contain bugs.  Operating systems that support preemption (i.e. Linux, MacOS, Windows, etc.) support software that may contain bugs that might be inflicted upon end-users.  Laws are in place to prevent shipping buggy products to consumers (e.g. "lemon laws"), except when it comes to software products.

- ports are asynchronous
	- all data on one port arrives/leaves in a block
	- separate ports are not coupled together
	- separate ports may fire at any time

## Avoiding Implementation Details

Below, is an example of embedded implemenation details in pseudo-code notation that is similar to commonly-used programming notation:

(*I invoke a fictional function "normalizeName".  Don't worry about what this function is supposed to do, just look at the UX of the code...*)

```
function f(X,Y) { 
  NX = normalizeName(X); 
  NY = normalizeName(Y); 
  ... 
}
```
 
 This form implies sequential operations, i.e. it appears to say: normalize the name of X to NX, then normalize the name of Y to NY, then proceed.

While, a small change in syntax:
```
f(normalizedName (X), normalizedName (Y)) :- ... X ... Y ...
```
does not imply step-wise operations.  The "compiler" is free to choose how / when to call normalizedName(), as long as the normalization occurs before the code body is evaluated.

PROLOG kind-of has this syntax for a limited range of data shapes.  You can specify that a List be broken up into Head and Tail portions in the LHS, using syntax like 

```
f([H|T]):- ...
```

[^queue]: Should the input/output queues be owned by the component or by the Container?  I don't know.  I used to create the queues inside the *runnable* instances of each component, but, lately I have begun to wonder whether the queues actually belong in the Container...  I am on the fence as to whether this idea is just an optimization or a semantically important detail.

## Example  Component
```
function handler_HTMLbutton (me, message) {
    me.send ("click", true);
}

var HTMLbutton_signature = {
    name: "HTMLbutton",
    inputs: [],
    outputs: [
	{ "name": "click", "structure": [] }
    ]
};

let HTMLbutton_protoImplementation = {
    name: "HTMLbutton",
    kind: "leaf",
    handler: handler_HTMLbutton,
    begin: function () {},
    finish: function () {}
};

function HTMLbutton (container, instancename) {
    let me = new Leaf (HTMLbutton_signature, HTMLbutton_protoImplementation, container, instancename);
    return me;
}
```
[the above example is from hamburgerworkbench0d](https://github.com/guitarvydas/hamburgerworkbench0d)

Note that the *handler* (the top-most function) simply sends a *true* message to its "click" output port.  The HTMLbutton component does not know where this message will be routed (nor, *if* the message will be routed at all).

[*The above example refers to a name "me".  There is nothing special about "me".  It is called "self" and "this" in various languages.  I tried to use a name that is androgynous and doesn't carry any baggage along with it.*]