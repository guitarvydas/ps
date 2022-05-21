WP1 contains a general lay-of-the-land.  

WP1 shows a rudimentary sequential diagram that forms the basis of some of the code that implements ė machinery.  (There were 4 code diagrams, eventually).

WP1 contains the hand-transpiled version of this diagram. The diagram is drawn in draw.io `routing.drawio` then transpiled into text `routing.das`[^das].  The Makefile converts `routing.das` into `routing.js` using `dev.bash` (which uses the `prep` tool).

The interesting characteristics of the sequential diagram `routing.drawio` are:
- concentric boxes are used to indicate sequential nesting and inheritance (child inherits, both, input ports and output ports of its container)
- one line of text per box
	- sequentialism is signified by nesting of boxes, not spacing of text (usually line-oriented)
- subroutines (same-page connections) are created by disjoint boxes with square ports and referred to by dotted-line boxes, subject to change
- *synonyms* are like *let* statements which wrap data with more-human-readable names
- the syntax of the `.das` files is grokked by the `dia.ohm` specification and formatted by the `dia.fmt` specification.  See, also [[Diagrams ė]].

[^das]: DaS means Diagrams as Syntax.

I know that the syntax of the `routing.drawio` diagram can be transpiled into `routing.das` by a compiler program, but, I haven't shown how to do this (yet).

(for work in progress, see [d2py](https://guitarvydas.github.io/2022/01/25/Diagram-to-Python-Transpiler.html), this works, but probably needs a better explanation)

I believe that it is important to demonstrate that you can hand-compile something before trying to use a machine to compile it for you.

I, also, believe that showing the hand-transpilation takes all of the *magic* out of the picture.  Hand-transpilation should be very boring.  So boring, in fact, that you feel compelled to get a machine to do the transpilation for you.