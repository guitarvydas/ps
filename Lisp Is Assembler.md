Lisp is a dynamic language which is like an assembler of triples.

The basic format of a lisp expression - a *sexp* - is:

- relation
- subject
- object

`(rel subject object)`

Lisp is an *expression language*.  Everything returns a value.  Statements basically don't exist in Lisp.

### Normalization

The beauty of Lisp is that its syntax is normalized - it is always the same, everything looks like a function.

This extreme normalization makes it possible to write programs that create Lisp programs. 

This is why macros (real macros, not the C kind) were first invented in Lisp.

(*Actually, another reason for macros is the existence of FEXPRs, before they were prematurely optimized out of the language. Optmization of FEXPRs caused certain aspects of FEXPRs to be elided (hidden) and removed, which, then, inhibited programmers from thinking out-of-the-box.*).

### First-Class Functions, Closures

First-class functions first appeared in Lisp, as *lambda*s.

### Operating System Processes

Processes are closures that are hand-built in C and assembler[^greenspun].

[^greenspun]: See Greenspun's 10th Rule.  Anti-lisp bigotry has caused a lot of epicycles.

### Design vs. Production Engineering

Early Lisp contained features that made Design easier.

Now, Common Lisp makes Production Engineering easier, but inhibits Design.

### Dynamic Languages vs. Static Languages

Dynamic languages encourage Design.  Designers can change their minds at the drop of a hat, without worrying about code that they've already got.

Static languages encourage Production Engineering - the attention to optimization and detail.

The self-editing required to do Production Engineering is different from the free-flow thinking required to do Design.  

Design is like *flow* or *being in the zone*.  Any self-editing will break the flow[^golf].  Questions, like "where do you want me to save this file?" break *flow*[^scapple].

[^golf]: Ask any golfer.

[^scapple]: The only programming tool, that I've used, that doesn't break flow, is Scapple.  Its bigger sibling, Scrivener, asks a bunch of up-front questions which don't allow you to just jot ideas down.  From completists' perspective, "it's all there", but the UX does not encourage *flow*.