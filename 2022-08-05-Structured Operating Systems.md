# Everthing is a Function, Except...
Treat everything as a function, but, only when easy

# What Doesn't Fit Functional Model?
- mutation
- GOTO
- infinite loops
- 0 inputs
- >1 inputs
- 0 outputs
- >1 outputs
- exceptions
	- yes, we have "syntax" for exceptions, but, that syntax is an after-thought (wart)
- 0D
	- zero dependencies
- State Machines
	- operating systems
	- parsing
	- history
	- time
	- sequencers

# Functions Are State Machines That Block
[[2022-08-05-Functions Are State Machines That Block]]
# Operating Systems are Bloatware
Operating systems invoke *lambdas* (pure functions) and wrap them in state machines ("ready", "blocked", etc.).

Continuations wrap *lambdas*.

The only thing "missing" from continuations is state-machine behaviour.  Continuations *can* implement state machines (LOL), but, continuations are mainly thought of as being functions.

Operating systems divided and conquered:
1. scheduling
2. adapting to disparate peripherals.

# Continuations As State Machines
Instead, consider that continuations *are* state machines and that functions are degenerate forms of state-machines.  

Technically, no difference, just a different perspective (programming UX).

This thinking leads to the conclusion that operating systems can be disappeared.  State-machine-continuations are more efficient and can do everything needed for scheduling.

We still need the second aspect of O/Ss - adapting to disparate peripherals.

# Simplifying Assumptions
[[2022-08-05-Simplifying Assumptions]]