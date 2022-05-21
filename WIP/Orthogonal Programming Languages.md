Cordy, in his Orthogonal Code Generator thesis, implicitly made the observation that
```
MOV x,y
```
is a *triple*, where
```
MOV
```
is the operator (*relationship*)
and
```
x
y
```
are the operands (*subject*, *object* resp.).

This observation leads to the idea that code can be generated into two phases:
1. deal only with operators
2. deal with the operands.

Cordy went on to create a declarative specifcation for this 2-step process, called *MIST*.

The *MIST* encodes a tree of possibilities for each low-level operation (1).  A tree-walker converts each operand (2) into real code depending on the *operation* and on the *cpu architecture*.

If we extend this idea to higher-level programming languages, we see that programming languages can be decomposed into 2 parts:
1. control flow (operations)
2. operands (data).

The ideas of OOP (object-oriented programming) deal with data implementation (2), but tend to make a hash of control flow (1).

With the advent of PEG parsing technologies, and Ohm specifically, it becomes easily possible to write specifications for control flow (1) separately from data implementation (2).

Traditionally, PEG involves describing both (1) and (2) in the same specification.

We can, instead, constrain ourselves to writing *only* control flow (1) sequences in PEG specifictions.  The sequences reference generic data objects.

## Example
For example, we could write an addition operation as:
```
Addition = GenericDataDescriptor '+' GenericDataDescriptor
```
We could even write high-level *MIST*s that map GenericDataDescriptors to object accessors in particular languages (like Python, JavaScript, Lisp, etc.).

### Data Descriptors
Holt defines Data Descriptors in a paper.

In that paper, DDs (Data Descriptors) have *base*s that correspond to memory areas in compiled code.

Instead, we can change *bases* to refer to generic data areas supported by most programming languages, like:
- parameters
- temporaries (local variables)
- global variables
- heap (objects).

And, we might give each *base* a set of attributes, like `mutable`, `indirect`. `constant`, etc.

We can add new data areas, like `input message`, `output message`, etc.