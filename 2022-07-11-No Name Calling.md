# Solutions: No Name Calling
- Prohibit naming of callees.

Suggestion: Use message-passing FIFOs and let a Container wrapper route the messages.

Python: instead of `f(x)`, use

```
self.send (..., outputPort, data, ...)
```

suggestion: 
- outputPort is a string
- data is any Python datum
- just Send the message, let the Receiver check the validity of the input (type, design rules, etc.)

[[2022-07-11-Type Stacks]]