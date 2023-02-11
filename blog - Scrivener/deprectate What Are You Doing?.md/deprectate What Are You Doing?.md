Title: What Are You Doing?  
Author:

What are you using a computer for?

This is a very basic question that isn't being asked.

If you use a computer for one kind of thing, but program it as if you are using it for another kind of thing, you will have difficulty.



The original intent for using a computer was to calculate ballistic trajectories of missiles and bombs.

Treating a computer as a glorified calculator fits this kind of thinking.

To do this well, you think in terms of sequential operations, e.g. (1) do this then (2) do that the (3) do something else then … (4) print the result.

Computer Scientists have been barrelling down this road for decades.  They have invented better and better ways to build sequential calculations.

One of the techniques that has been invented is a pipeline of one-in/one-out clumps of software.  This has led to FP (Functional Programming).

Early on, the technique of serialization invented several techniques:

* call/return languages
* the stack
* threads (processes) of sequential lumps of software.

These techniques made it possible to build better and more complicated calculators.

These techniques have been mis-applied to other kinds of computing.  As a counter-example, imagine the lowly HMTML File Reader.  It has one input - a user-supplied file name, that comes at "any" time[^fn1] - and it has at least five (5) possible outcomes: 

1. OK - the file contents
2. error in the filename specified by the user
3. cancelling - the user cancels the operation
4. file read error
5. no response - the network is down, the server has crashed, etc.

When we mis-apply calculation-computing techniques to this kind of problem, we run into trouble[^fn2]


A controller is "something new" that hadn't been anticipated during the initial design of computers.

A controller is not a calculator

A controller is a coordinator of many actions.

Imagine the human body.  The body's autonomous system has hundreds of independent parts.  

The body has one main coordinator - consciousness.  The conscious mind sets the goals for a body, but does not micro-manage.

For example, waking through a door.  The conscious mind sets up the intention, and the rest of the autonomous system carries out the intention.

If the door is closed, the hand-arm unit swings forward, grabs the doorknob and turns it, then the hand-arm unit pulls the door to open it, then the hand-arm unit lets go of the doorknob.  [Obviously, the actions are different if a door swings outward.]

Then, the body starts free-falling through the open door.  The leg units snap into action and stop the body from falling down to the floor.  One leg unit swings forward and plants its foot on the ground a few feet ahead of the body.  The body, again, falls forward using the planted leg to hold it up.  The other leg unit swings forward and plants itself just ahead of the new position of the body.  This set of actions repeats many times.

This set of actions is so common that we have given it a name: "walking".  The conscious mind doesn't micro-manage the operations of the body and the leg units, it just "happens".  Actually, the leg units use H.I. (human intelligence) to control each part of the leg units.  The H.I. was "trained" to learn its operations during the first year of the body's existence.

When the conscious mind does interfere with the operation of the autonomous nervous system, bad things usually happen.  Golfers have names for this kind of interference - "analysis paralysis" and "bad shot".

Using calculator techniques to program a parallel computer results in problems, much like micro-managing the body's autonomous system.

Q: If there are only 2 kinds of computing, what is a general computer or a laptop"?

A: It depends.

A general computer runs many apps.  For example, you don't spend $1,000 to buy a computer to use only as a calculator.  A calculator costs about $10.

You buy a general computer hoping that you can run many different apps on it, while, in the long run, saving money.

Some of the apps on a general computer are (1) calculator apps and some are (2) controller apps.

A network of computers forms an autonomous set of islands of general computers.

Each computer on a network is, usually, a general computer, capable of running calculator apps and controller apps.

The network itself, is more like a controller app, though.  The network performs operations at "random" times, in a non-sequential manner.

At present there are many programming languages for building calculators - like Python, JavaScript, C, Rust, etc. - but few popular languages for building networks.

The most common language for building networks of computers is called HTML.  It's operations are very "low level" and do tend to describe the actions that a single node in the network might invoke.

Another very common language for network coordination is Bash.

Networking is so ubiquitous, that many of the calculator-building languages come with "libraries" of low-level network operations.  As far as I know, there is no popular language for building and coordinating something like a full autonomous system of computers - a language that defines and runs the whole network instead of single nodes on the network.  At present, a computer network is programmed like a bunch of independent consciousnesses, arguing with one another.  People who build robots have to "fake it" using fancy libraries called "RTOS"s and at least one calculator language.

What is blockchain?

Blockchain is 2 things in a single app:

* a calculator (the crypto)
* a network app (a controller). 




UI means User Interface.

Windows on a Windows® machine or on a Macintosh® are UIs.

A UI is characterized by the fact that the user can do anything at any time.  There is no schedule.  A user can type a character on the keyboard or move the mouse, etc. at any time.  

We call this "asynchronous" operation.

Things that are asynchronous fall into the controller category.

Calculator-languages don't handle asynchronous operations well.  The best we can do with a calculator language in programming a UI is to use a threads library.  This is far from ideal and leads to many forms of accidental complexity.

Games are like UIs on steroids.

Games react to game-player actions (joystick, etc.) and sometimes run calculations (e.g. physics engines).

In my mind, games are primarily controllers and only secondarily calculators.

Websites are UIs.  See UIs.

Websites react to asynchronous operations[^fn3] performed by users.

Websites collect up asynchronous inputs from users and then send requests to servers, and waits for responses.

Websites are primarily controllers, not calculators.

Concurrency is a paradigm that allows a programmer to write code to coordinate many asynchronous operations.

Many calculator-languages provide something called threads and multitasking.  This is not the same as concurrency.

Concurrency is not parallelism.[^fn4]

Concurrency is not multitasking.

Concurrency, fundamentally, means that data transfer happens in two stages.  (1) Send the data and (2) receive the data.

In calculator-like languages, data transfer happens all-at-once.  When a function is called, the function receives all of its parameters all-at-once.  When a function returns all the returned data is returned all-at-once.  When a function aborts, it returns data via syntactic sugar called exception handling.

[Note that exception handling is just a symptom of trying to use the calculator paradigm for a concurrent operation.  A true concurrent operation would consist of sending one of two results - success or failure.  In true concurrency, the results could be sent to two completely different agents.]

A concurrent part is alway running.  It is always-on.  It is always waiting for events.

When an event arrives, the part performs some action.  The action might involve:

* doing nothing (ignoring the event)
* changing its own state
* sending zero or more events to its output pins.

Currently, state has a bad reputation.

Most programmers assume that they need to avoid state.

Concurrent components run forever, so they must contain state.

Stateless programming is a reasonable way to program calculators, but not a reasonable way to program controllers.


Multitasking is a way of running many calculators in parallel.

Multitasking is often provided as a library, usually under the name of threading or as a fancy library, called an Operating System.


Multitasking is often conflated with concurrency.

Concurrency is much simpler than multitasking and parallelism.

Multitasking contains much more functionality than what most controllers need.  See New Technology Using Old Ideas.

Few programs are written using the concurrent paradigm.  Most multitasking programs are written as clusters of independent calculators, using calculator-building techniques, instead of using controller-building techniques.



Multitasking is, fundamentally, a method of writing calculators enclosed in envelopes.  The envelopes can co-exist on a single computer.  

When a calculator runs inside of an envelope, it gets the undivided attention of the computer.  

When a calculator waits for something to happen[^fn5], its envelope "gives up" the computer power and allows another envelope to run its calculator.

This envelope pattern is so common that it has been wrapped into a library.  The library is often called an Operating System.

As an analogy, imagine a very fast Ferrari automobile.  It can drive very quickly, but, it has to stop and idle its engine when it arrives at a red traffic light.  It would be nice to not "waste" the engine's power at a red light.  It would be nice to transfer that engine power to some other automobile.  We can't do that with a Ferrari, but we can do that kind of thing in a computer that is using a multitasking library.

The problem with multitasking is its fundamental premise that the transfer of power can happen at any time.  That's called "full preemption".

A true concurrent application can transfer power in a predictable manner[^fn6], whereas multitasking assumes that power transer is unpredictable.

This unpredictability has given multitasking a bad reputation.  This assumption has led to many accidental complexities.[^fn7]

Multitasking is but a subset of true concurrency.  We can't control the power transfer, we must always assume that the transfer can happen at any time.  

We can write calculator programs using this set of assumptions, but, these assumptions make it hard to write controller programs.

We have been playing whack-a-mole" with this issue for decades.

We see some light at the end of the tunnel creeping in with technologies such as callbacks and node.js.  These technologies are very low-level and are very hard-to-use, since they try to be the "best of both worlds", both calculator-like and controller-like operations, but deliver neither in a convenient form.


Parallelism is, currently, just multitasking spread across many computers.

Programmers who try to eschew calculator-like libraries, such as multitasking, must "fly by the seat of their pants".

Parallelism requires the use of the concurrent paradigm (where multitasking is a very low-level form of this paradigm).

Concurrency, on the other hand, does not require parallelism.  The concurrent paradigm can be used on a single computer or on many distributed computers and on many cores.


- electricity was originally used to pump water uphill to create streams of water to run water-wheels that ran mills

- desktop metaphor is an "old idea"

- time-sharing is an "old idea"


- ORCA
- Sonic Pi
- (IRCIS) 

ORG charts
hierarchy


Current techniques, based on calculator-building, break down for fairly simple operations.

Imagine a web client that requests the contents of a file.  A diagram of a part to handle this operation is shown in Fig. 1

![][TextFileReaderPart]

Fig. 1 File Reader Part

[TextFileReaderPart]: TextFileReaderPart.png width=150px height=150px

[^fn1]: This is called "asynchronous input".

[^fn2]: This is called "accidental complexity".

[^fn3]: JavaScript provides callbacks in an attempt to corral asynchronous operations.

[^fn4]: Programmers: see Rob Pike's talk https://blog.golang.org/waza-talk

[^fn5]: A calculator within an envelope might request the contents of a file on a disk.  The operation of getting the contents of a file is very much slower (like 1000X slower) than what the CPU can do when running at full speed.  When a calculator requests a file, it ends up waiting.  This is akin to a Ferrari stopping at a red light.  It has to idle its engine instead of racing ahead at top speed.

[^fn6]: The power transfer can happen at places that are clearly defined in the syntax of the concurrent language.

[^fn7]: Multitasking accidental complexities involve such issues as fairness, etc.  Issues like thread safety are harmful to concurrency, too, but, they are caused by other problems in the multitasking model.  See the sections on time-sharing and memory-sharing.