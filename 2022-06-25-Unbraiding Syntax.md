# Unbraiding Syntax
## Textual Programming Was Caused By History
Programmers and programming language designers settled on textual progamming languages due to the fact that mid-1900s hardware supported characters more easily than it supported overlapping bitmaps of graphical entitities.

Text-based programming languages are based on grids of non-overlapping small bitmaps (AKA characters).

*Programming* consists of controlling a machine (an electronic computer).

There is no inherent reason that control scripts need to be written in textual form.  

The choice of text for expressing programming scripts was purely pragmatic, based on the abilities of mid-1900s hardware.  

Some textual programming languages use mathematical notation which was invented for use with pen-and-paper and clay tablets.  Mathematical notation carries baggage with it - in the form of blocking function calls - that use only a subset of the available functionality of electronic computer hardware.  Functional programming is a suitable notation for parts of computing (functions which need synchronous parameter blocks, exhibit blocking behaviour and always return synchronous value blocks), but is less suitable for non-mathematical operations, such as distributed programming (witness the problems incurred by JavaScript's callbacks (which are twisted expressions of distributed computing that are forced to fit into the functional paradigm)).

# Extending Syntax
## ASCII Art
Most humans understand diagrams to contain isolated units of functionality.

Non-programmers, like CEOs, spontaneously create whiteboard diagrams to express their intentions regarding software products.

Whiteboard diagrams tend not to use a standardized "syntax" (sets of symbols).  This non-standardization issue is misunderstood to mean that diagrams - in general - cannot be used for creating program scripts.   One needs to look only at non-standard forms of text, e.g. human language, to see that such an argument against using diagrams is specious.  Programming language designers found ways to standardize text and to make text suitable for creating program scripts.  Programming language designers would have found ways to standardize technical diagrams, if other factors (such as hardware inabilties) were removed.  Also, consider the fact that technical diagrams are used in many fields of Engineering, e.g. blueprints in construction and schematics in electronics.  Such examples make it clear that diagrams can be used as technical documentation.

Programming lanuage designers try to capture diagrammatic ideas using ASCII Art.  The ASCII notation was prematurely optimized and does not faithfully represent concentric containment of layers (e.g. boxes within boxes) which led to gotchas like "the global variable problem".  One would not, naturally, draw concentric boxes on diagrams and include global variables, but, this happened in ASCII Art because full-bracketing was optimized away during language design.

For further discussion and examples, see [[2022-06-04-Global Variables Caused By Textual Coding Practices]], and, [[2022-06-19-Evils of Premature Optimization - The Dangling Else Problem]].

The choice of text-only for programming languages has hidden repercussions on expressivity.

## SVG
Computer hardware in the 2020's is capable of drawing overlapping windows containing simple graphical elements.

It would be possible to upgrade our notion of programming atoms from characters-only to a hybrid system that included:
- rectangles
- ellipses
- lines
- text.

Note that SVG already supports these atomic units, and, it allows them to be overlapped instead of being arranged in strict grids.

Most SVG editors that I have encountered are ill-suited to editing technical diagrams.  The effect 
is like being forced to use Microsof Word for writing programs instead of using vscode/vim/emacs/etc. Presently, I use a severely restricted subset of `draw.io` for my technical drawings of programs.