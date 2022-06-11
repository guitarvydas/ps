The thing that is thought of to be a *pure function* is, in fact, a *state machine*.

![[functionsassm.png]]

Functions that call other functions (e.g. library functions) cause self-blocking.

Self-blocking *spreads* the responsibility for blocking across two (2) controllers:
1. the function itself
2. the operating system (e.g. Linux, MacOS, Windows, etc.)

Self-blocking violates the pricinple of *locality of reference* when it comes to the action of *blocking*.

Self-blocking is the reason that operating systems need to resort to using the sledge-hammer of full preemption.

The state-machine model of λs, also, explains the operation of CPS (Continuation-Passing Style).

[[Parts of an ė]]

[[Pure Function - State Machine Duality]]
