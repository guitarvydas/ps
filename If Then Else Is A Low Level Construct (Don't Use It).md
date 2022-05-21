*If-then-else* was invented to describe return data from functions.

In some situations, the return data should be something, in other situations the return data might be something else.

*If-then-else* was then mis-applied to expressing sequencing.

Low-level usages of *if-then-else* for sequencing usually involve *flags* and various kinds of global variables.

We need two (2) DSLs, not just one GPL:
1. for describing data and describing functions
2. for describing sequencing (control flow).

Parsers are attempts at (2), which use text mini-DSLs for describing sequencing.

We need better DSLs for (2) that hide (elide) ugly, low-level concepts like *flags*.

Harel's Statechart notation is a DSL for describing control flow.

Drakon diagrams are a notation for describing control flow.


Parsers, Statecharts, Drakon, etc. encapsulate the use of flags.

Sequence diagrams describe control-flow.

[[%Parsing Idioms/Parsing Diagrams]]
