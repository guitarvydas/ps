In this simple example, there are two queue-based components:
- A, when fired, outputs 2 events X, followed by Y
- B, when fired, outputs 2 events: Z to the "feedback" output and a copy of the input to the "out" output

What is the final output of the system?

I think that it should be XYZZ, not XZYZ (or anything else) instead.

## Diagram
![[Excalidraw/2023-01-20-Concurrency Question 2023-01-20 09.01.49.excalidraw]]

## If-Then-Else

To get the XYZZ behaviour I specified, the diagram needs to be redrawn.

Opinion: never use If-Then-Else.  It is too general.  McCarthy used COND to mean a specific use-case for condtionals: a conditional *value*.  OOP uses type-based dispatch to handle a different use-case for conditionals - *case on type*.  Harel specified yet another use-case for conditionals - *conditional on State*.  The FP crowd is talking up "pattern-matching" (AKA "parsing").  If-Then-Else can be use - like assembler - to implement each of these use-cases along with ad-hoc blow-your-foot-off unstructured cases.

If we can trust me, the new diagram is
![[Excalidraw/2023-01-20-Concurrency Question b 2023-01-20 18.56.32.excalidraw]]
- A, when fired, outputs 2 events X, followed by Y
- B, when fired on "in", outputs 2 events: Z to the "feedback" output and a copy of the input to the "out" output
- B, when fired on "fb", outputs 1 event: Z to the "out" output
