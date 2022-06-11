
I suggest that a ė is composed of:
- ū - the evaluation environment
- f₁ - a pure unit of code
- f₂ - a pure unit of code

f₁ is the main body of the pure function which is executed before another function is called
f₂ is the continuation body of the pure function which is executed after the callee function has returned and unblocked the caller.

What is currently called a λ, is actually an ė.