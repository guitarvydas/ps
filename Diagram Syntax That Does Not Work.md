Using too many shapes and icons on diagrams makes the diagrams too complicated to be useful. 
For example, electronics schematics used to use a number of symbols, e.g. zig-zag lines for resistors, transistor symbols, etc.  Later, all 2D symbols were reduced to rectangles to reduce the visual busy-ness of diagrams, esp. symbols that represented VLSI.  VLSI was too variable to be represented by unique icons.

Drawings of constructs that are well-served by existing notations, e.g. mathematics expressions like `a = b + c`, doesn't work well, since there is no need to complicate pre-existing syntax by diagramming it.

Colours for *types* appears like a good idea, but doesn't work well in practice.  We tried using colours to signify *types* but quickly ran out of colours and created too much nuance in the visuals.

Using a grain that is too fine does not work well.  In an early project, we used some 20,000 instances of visual components, many of them simple, like inverters.  We found that there was too much detail and that it didn't help in understanding the code.  Better layering - better architecting - was needed.  In analogy, the *structured programming* revolution added no new technology to programming, it simply suggested how to organize use of the existing operations (assembler, at the time)