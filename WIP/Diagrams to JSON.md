Transpile diagram to JSON.

DaS to JSON.

DaS means "Diagrams as Syntax".

[github](https://github.com/guitarvydas/das2json)

**Current**: diagram is `testbench.drawio`.

**Output** is: testbench.json

**Usage**: make

The das2json tool transpiles a .drawio diagram into JSON.

The .drawio diagram must follow certain rules (see README.md).

The current goal (wip) is to duplicate [hamburger workbench 0D](https://github.com/guitarvydas/hamburgerworkbench0d) using a diagram (`testbench.drawio`).

The program `pyemit.py` converts .JSON component files into Python.  I believe that you could transpile .JSON to just about any language (e.g. JS and HTML, C++, etc.).

The current goal becomes: 
- clone `pyemit.py` to `jsemit.py`
- hack on `jsemit.py` to make it produce JS components that can be used in the hamburger workbench.

Note that only some of the components on the diagram contain sync code (red box).  The code inside `phraseparser.js` is too involved to bother putting it on the diagram.  We leave that box "blank" and expect to implement `phraseparser.js` as pure JS text code in its own file. JS code is synchronous by definition[^pysync].

[^pysync]: Code in just about any language, e.g. Python, C++, etc., is synchronous by definition.

See also [README](https://github.com/guitarvydas/das2json/blob/main/README.md), [[Edge Containment]]