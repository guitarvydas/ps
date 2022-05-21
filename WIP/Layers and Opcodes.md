Riffing on what you said…
{id: #layers}{id: #opcodes}
  

1) key insight: grouping (I call it layering)

  

2) insight: opcodes, opcodes are funnels that group together functionality and present a restricted interface to all of that functionality  

- opcodes made VLSI usable

- (VLSI made groupings of transistors usable, transistors made … usable, … made oxides usable, oxides made atoms usable, atoms made sub-atomic particles usable, etc, etc)

- denotational semantics (FP on steroids) is flat (2 layers), Peter Lee made den. sem. usable by re-inventing layers with “opcodes” in between each layer, so that one didn’t have to address the whole problem in one bit gulp

- Lisp, Scheme, etc. is “opcodes” for assembler, way too much detail for modern programming, but less detail than pure assembler, lassos concept of 1st class functions (lambdas) and makes the concept of 1st-class functions easier to use than in pure assembler (I /can/ write 1st-class functions in assembler or C, but I tend not to)

  

So, what are the opcodes for an ideal editor?

- rects

- ellipses

- lines, arrows

- text

- layers 

  

(where “text” means any media thingie, markdown, mp3, mp4, etc, etc).

  

I was going to ask you if there is already a library for this kind of thing.

  

If there isn’t, I think the answer is CLOG (a very restricted form of CLOG).  Maybe this kind of stuff is already simple-enough to do using only JS? 

  

JS (and CLOG) give me too much freedom (too many choices).

  

Question to self:

- so, what is the mininim (7 +-2) set of opcodes for such an ideal editor?

  

pt