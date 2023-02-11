Title: editor  
Author: Paul Tarvydas

# Graphical Atoms - Gratoms #

Graphical Atoms are the lowest level graphical units that can edited by an editor.

For lack of a better term, I will use the word gratom to denote graphics atoms.


# Editor Basic Operations #

An editor can create various gratoms:

* rectangle
* line
* text
* ellipse
* curvy line

The editor does not know what it is editing.  The editor simply creates gratoms and allows the user to edit them.

Understanding what is on a diagram is left to later passes in the chain.



# Analogy #

For an analogy, imagine a generic programming editor (emacs, vim, vscode, etc.).

The generic programming editor allows one to create and edit text (only).

It does not "know" what programming language it is editing.

It only knows a few basic rules:

* how to move the cursor
* how to insert a new characters at the cursor
* how to delete characters
* how to save / load a file of characters
* how to load scripts (aka modes) that help to pretty-print the text.

A text-only programming editor creates grids of non-overlapping bitmap glyphs (called characters).

A more general editor, as described here can:

* create and edit gratoms
* allow gratoms to overlap
* create / load a gratom file, describing each gratom with its (x,y,w,h) pixel coordinate and it's type.

# Operations #

## Text ##

* position x,y of a text box
* change w,h (width, height) of text box
* edit the characters contained in a text box (maybe by bringing up a textual editor)

## Rectangle ##

* position x,y of a rectangle
* change w,h (width, height) of rectangle
* edit characteristics of rectangle (colour, border, rounding, etc.)	

## Ellipse ##

* position x,y of an ellipse
* change w,h (width, height) of ellipse's bounding box
* edit characteristics of ellipse (colour, border, etc.)	

## Straight Line ##

* define start point of a line
* define ending point of a line
* edit syntactic sugar of a line - editing polyline points, thickness, etc.

## Curvy Line ##

* define start point of a line
* define ending point of a line
* edit syntactic sugar of a line - editing bezier points, thickness, etc.

# SVG? #

Maybe the editor is just an SVG editor?

We need to use only a subset of SVG.  

We could write a routine that strips out all of the unwanted parts of SVG.

We could write a checker routine that checks that the stripped-down SVG diagram follows certain rules.  Such a checker is given the fancy name "parser" in traditional compiler lore.  A parser checks that the tokens follow certain rules.  In fancy compiler terminology: the parser checks that the tokens make up well-formed phrases in the language (DSL/PSL, in this case). 

Parsing is not contained in the editor proper.  Attempts at putting a lot of smarts into the editor were tried and failed.  Such editors - "structured editors" - were too complicated to maintain.  It was always better to put the parser in a separate pass.   Such structured editors also tried to deal with the conundrum of ill-formed code - some editors would not let you save an unfinished piece of code.  The user should be able to create garbage files using the editor, as long as the parser complains when fed garbage.  Let the editor edit, the parser parse, etc.
