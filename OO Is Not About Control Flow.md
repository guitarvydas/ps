OO objects contain methods.

OO objects describe data and operations on data, but do not describe (well) the actual control flow, the sequencing of operations.

Parser ASTs describe sequencing of operations.

Sequence diagams describe sequencing of operations, but aren't as easy to automate as parsers.  

Parsers were invented in the mid-1900s and have a long history and the technology to automate parsers is better developed than the technology to automate sequence diagrams.

OO methods should *not* contain control-flow operations, e.g. arbitrary usage of if-then-else.

OO methods *do* contain conditionals which can result in different return values depending on conditions.  McCarthy invented *cond* to mirror mathematical functions that had different branches.

Later, *cond* was generalized to *if-then-else* and abused.  *If-then-else* can be used to describe at least two kinds of things:
1. the multi-branch value of pure functions
2. control flow in a program.

OO handles (1), but, does a poor job of (2).  In fact, a sufficiently abstracted OO class tends to obfuscate control flow (2).  I find it very hard to follow what is going on (in time) by just looking at an OO class.

[[Control Flow Separated From Data Description]]