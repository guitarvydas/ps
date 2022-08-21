## Appendix - Why Ohm?

### Locality-of-reference in grammar
```
	Thing
	 = Thing1         -- optionA
	 | "(" Thing2 ")" -- optionB
```

When a rule has multiple legs, and the legs don't match with respect to the number of captures, Ohm allows you to label each leg, instead of creating separate rules.

In original PEG, you would have to write
```
Thing = OptionA | OptionB
OptionA = Thing1
OptionB = "(" Thing2 ")"
```

### Separatation of Semantics From Pattern Matching
#### Labelling Captures
In many PEG libraries, one needs to label the captures:
```
Thing = a:OptionA | b:OptionB
OptionA = c:Thing1
OptionB = d:"(" e:Thing2 f:")"
```

In Ohm-JS, though, the labels are omitted and the semantic rules are expected to have the same names as the pattern matching rules.

In Ohm-JS, each capture is bound to a function parameter in the semantics.

## Normalization -> Machine Readability

In Ohm-JS, each capture is bound to a function parameter in the semantics.

Always.  

The programmer doesn't need to decide which parts of the pattern to capture.

This may *seem* like a lack of options, but, options are the bane of automatability (scripting, machine readability, machine translation).  Assembler is normalized and allows programmers to invent compilers.  At first, assembler programmers hated the normalization and regularity (they wanted to pass parameters in registers, but only in some cases).  Smart people figured out - later - how to capitalize on the regularity of assembler.  For example, Fraser-Davidson invented an optimizer (RTL) that worked in two stages - first, (1) they treated everything like a (fake) register, then, (2), they wrote scripts (algorithms) that searched-and-replaced runs and common patterns.  Cordy's Orthogonal Code Generator normalized everything into *descriptors* (instead of fake registers), then built a declarative tree-walker that could portably emit code for various CPUs from the same front-end output.  GCC (arbitrarily?) used RTL and blew the doors off of what human assembler-programmers could do.  Assembler programmers quietly retired and everyone uses high-level languages now.

Options lead to bloatware.  

Normalization fights bloatware.

## Left Recursion
Ohm-JS supports grammars that use left recursion.

Emphasis is on programmability / readability of grammars irrespective of technical issues like manual refactoring of grammars to handle left recursion.
