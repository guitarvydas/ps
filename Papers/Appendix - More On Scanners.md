- easier to handle in subsequent compiler passes
- does not require re-scanning of strings
- dealing with an *int* is more efficient than dealing with a *string*
- string -> int (e.g. hashcode)
- machine doesn't care that *token* is "unreadable" (by humans)

## Divide And Conquer
- divide and conquer
	- scanners are a small step, but, relieve cognitive load in later passes (the hard parts)
	- scanners are easy to automate (so simple, even a machine can do it)

## REGEX
- REGEX is a DSL for building scanner programs
- creates sub-programs to match character sequences
- usually creates a state machine (pattern matcher), but, programmers don't need to know this or even look at the code
	- i.e. a "good" DSL
