## Locality-of-reference in grammar
```
	Thing
	 = Thing1         -- optionA
	 | "(" Thing2 ")" -- optionB
```

Ohm-JS allows you to write grammars that are compact and keeps grammar productions together.  Other technologies (e.g. YACC, LR(k), LL(k), PEG, etc.) require grammars to be broken up to appease the transpilers.

In Ohm-JS, when a rule has multiple legs, and the legs don't match with respect to the number of captures, Ohm allows you to label each leg, instead of creating separate rules.

The usual solution this kind of problem is to warp the grammar.  This is what I was taught and I warp grammars without thinking about it.  Of course, readers of my grammars need to try to figure out what I originally meant.  When I don't warp the grammar, my intentions are "more obvious" to readers.

In original PEG, you would have to write a warped grammar, like:
```
Thing = OptionA | OptionB
OptionA = Thing1
OptionB = "(" Thing2 ")"
```

In this specific case, the rules `OptionA` and `OptionB` are *noise*.  The grammar is warped to appease the PEG transpiler.  Using Ohm-JS, you don't need to do this kind of appeasement, and, the grammar remains unsullied by implementation details.  Unsullied grammars are, generally, more readable by humans.  I feel that it is important to leave enough breadcrumbs (i.e. readable code) for other humans to understand what I had intended (they don't need to agree with my intentions, they only need to understand what I was doing).

## Separation of Semantics From Pattern Matching

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

This may *seem* like a lack of options, but, options are the bane of automatability (scripting, machine readability, machine translation).  Assembler is normalized and allows programmers to invent compilers.  At first, assembler programmers hated the normalization and regularity (they wanted to pass parameters in registers, but only in some cases).  Smart people figured out - later - how to capitalize on the regularity of assembler.  For example, Fraser-Davidson invented an optimizer (RTL) that worked in two stages - first, (1) they treated everything like a (fake) register, then, (2), they wrote scripts (algorithms) that searched-and-replaced runs and common patterns.  Cordy's Orthogonal Code Generator normalized everything into *descriptors* (more general than fake registers), then built a declarative tree-walker that could portably emit code for various CPUs from the same front-end output.  GCC (arbitrarily?) used RTL and blew the doors off of what human assembler-programmers could do.  Assembler programmers quietly retired and everyone uses high-level languages now.

Options lead to bloatware.  

Normalization fights bloatware.

## Left Recursion

Ohm-JS allows "left recursion".

Originally, PEG had a problem with "left recursion".

"Left recursion" allows one to write grammars in a "more natural" manner.

