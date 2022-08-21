The *shu* part of *shuhari* is 
- _shu_ (守) "protect", "obey"—traditional wisdom—learning fundamentals, techniques, [heuristics](https://en.wikipedia.org/wiki/Heuristic "Heuristic"), proverbs

According to [wikipedia](https://en.wikipedia.org/wiki/Shuhari)

To enable *shu* for programming...
- the program must be human readable, understandable, simple
- the program must be clonable and hackable.

A *program* is a script of instructions that control a machine ("computer").  

Note that there are no fundamental rules specifying *how* a script must be represented.


## Programs as Text
Historically, programmers have represented programs in text form.

This historical represenation is due to the limitations of mid-1900s computing hardware and accompanying biases towards optimization of program representation.  This historical representation is, also, based on the idea of forcing the paper-and-pencil notation of mathematics onto programming.

Programs are often thought of as being composed of grids of non-overlapping, small bitmaps, read from top-to-bottom and left-to-right.  This format is text composed of characters.  Typically, text programs are written using QWERTY keyboards.

### Runtime Inefficiency

CPU APIs, called *assembler*, tend to contain runtime grouping constructs for forming islands of progamming instructions and invoking the islands at runtime via CALL and RETURN instructions.

The islands are called routines (functions).

The islands pack and unpack data using CPU runtime operations.  Incoming data is called *parameters* and outgoing data is called *return values*.  Programming languages formalize the concepts of packing and unpacking, calling the processes structuring and destructuring.

Representing program scripts in this way entails a certain amount of runtime inefficiency, since CPU cycles are expended to create routines and data structuring.

## Programs as Technical Diagrams

Many longer-lived Engineering professions use diagrams instead of text, to represent designs.

For example,
- building construction is specified with diagrams called "blueprints"
- chemical analysis uses diagrams called molecular models, atomic models and [structural fomulae](https://en.wikipedia.org/wiki/Structural_formula)
- electronics engineering uses diagrams called schematics
- Feynman diagrams are used in a section of Physics
- etc.

Presently, the field of Software is young and a diagrammatic form for programs as not been standardized.

One of the blocking factors in developing diagrammatic programs is the over-use of synchrony in current-day programming languages.  

Program units need to be 0D (zero-dependency), but, tend to be N0D (non-zero-dependency).

The concept of 0D is usually tangled up with other concepts such as parallelism and concurrency.

Programmers have created work-arounds to the 0D problem, in the form of package managers, makefiles, etc.  These work-arounds have allowed practitioners to continue using N0D programming notations without improving the state of the field of programming.

## Editors
To allow for the basic elements of SHU, program representations must be easy to read, clone and hack.

Programmers use editors to create program representations.

Editors for textual programming are mostly based on the character model.

Editors for diagrams are most often based on creating paintings instead of creating technical diagrams.

Editors for non-programming tasks, such as word-processing, spreadsheets, etc., have advanced further than editors for programming tasks.

## Simplicity
Simplicity is defined as "the lack of nuance".

Options are nuances, hence, give the appearance of complexity.

Parameters are nuances, hence, give the appearance of complexity.

Up-front decisions, like "where do you want to create this file?" are technical nuances, hence, are perceived as complex.  I have encountered only two (2) applications that allow you to jot ideas down without being confronted with up-front decisions, (a) Scapple, and (b) Kinopio.  So-called "mind maps" generally fail at simplicity, by imposing structure on the thinking process.  Jotting ideas down on the back of envelopes is a simple process that allows after-the-fact structuring and organization.  Most software applications do not achieve this level of simplicity.

## Making Do
Currently, I use [draw.io](https://app.diagrams.net) to create technical diagrams.

I transpile these diagrams to "structured text" then process the structured text using text parsing tools such as Ohm-JS.

Transpilation from technical diagrams (`.drawio`) to textual form (`.das`) can be done:
- in an automated fashion, using a combination of Javascript and PROLOG (or other technologies)
- manually, e.g. sight-reading diagrams into a brace-bracketed textual format, for example, [[hamburgerworkbenchD0D/Diagram Handling]].

Note that editors edit.  Editors must not have hard-wired notions about what they are editing.  For example, *emacs* edits characters that are arranged in text files.  It has plugins that will colorize text, but none of the colorization is hard-wired into the basic editor.

Editors should allow the creation of "incorrect" programs.  Later stages can check for programming errors.

These ideas also define what is needed for editing technical diagrams.  Editors edit rectangles, ellipses, lines (arrows), and, text[^svg].  The rest of the error checking and semantics inferencing comes later and must not be hard-wired into technical diagram editors.

[^svg]: Note that these kinds of things - rectangles, ellipses, lines, text - are supported in SVG.