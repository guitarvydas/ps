The function call `f(x) ...` means
1. Send message `x` to callee.
2. Enter a state "waiting for result from callee", i.e. "block"
3. Invoke the callee.

And, the return `return z` means
1. Send message `z` to one's own output queue
2. Wake up the caller
3. Terminate
4. The caller, upon waking up, pulls the result(s) from the output queue of the callee and "moves" the result(s) to its own addressable memory space.