Syntax colouring: helped by splitting syntax into 
1. operators
2. operands.

Different colouring schemes can be used at each layer.

Instead of treating the whole program as one syntax-ful blob, you can colour only the "current" layer.

For example, imagine a separate state-machine layer that may contain code for other layers.  Colour can be applied to only the elements of the state-machine layer, leaving the other code greyed out (or at a lower opacity).

Maybe, 
- every operator at the given layer, is coloured with a unique colour
- every operand *definition* at the current layer, is coloured with a unique colour (and/or italiced, bold, underline, etc.)
- every operand *reference* at the current layer, is coloured with a unique colour.

Colours and font styles can be used instead of declaration statements.  Declaration-before-use can be expunged.

![[../../opl/opl.png]]

In this example:
- major headers, such as octothorpes, are coloured light-red
- operators are coloured red/normal-weight
- operand definitions are coloured red/bold-weight
- operand references are coloured red/italic
- statements intended for other languages are coloured gray/50%-opacity.

Clearly, this UX, and, its colours, should be redesigned by someone schooled in graphic design (i.e. not software architecting/engineering/implementation[^cyan]).

[^cyan]: The reader might appreciate that the colour most-favoured by software engineers in the mid-1900s era - cyan -was not used :-).