I propose ė[^pronunciation] as a super-class to λ.

ės are like steppable λs.

ės are recursively composed of a list of ės or, at the bottom, a single λ.
ė ≣ 
  | ė+
  | λ

ės are state machines that can be stepped towards a final result.

An ė is called with parameters like a λ.

An ė returns a triplet of functions:
1. finished? - a predicate that returns *true* if the ė has completed all of its steps
2. step - a procedure that causes the ė to make one step (recursively) ; the return value is undefined
3. value - a function that returns the value(s) of the ė ; I'm not sure what this function should return if *finished?* is not *true* (probably the most current value(s) which is probably undefined (null?) until *finished?* returns *true*).  Hmm, maybe this function causes the ė to step until it is finished, then returns the final result.  (In which case, maybe this function appears first in the triplet, allowing implementations to drop the other two functions and to treat the ė as regular function-returning function?)

Should there be a way to set/query the sub-ės of an ė?  Is this a debugging-only feature?  When one writes a λ, one generally doesn't get to "look inside of it".  The debugger has to do extra work to display the λ body in human-readable terms.

[^pronunciation]: In the first working paper, I describe why I chose this name.  Currently, I pronounce it as "A dot", where "A" rhymes with "stay" and "away".  This pronunciation is incorrect and/or redundant in any language.

Inner (child) ės can communicate only with their direct parent.

Sending information to peers cannot be done.  In some situations, the parent mayb contains a routing table and can route outputs from child ės to other child ės.

The lambdas are evaluated in an environment.  The environment is determined by the parent (typically a stack-wise concatenation of all ancestor environments).