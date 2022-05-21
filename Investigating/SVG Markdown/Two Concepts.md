further clarity (?): 

I am talking about 2 different things: 
1. SVG markdown 
2. 2. HLL (Hierarchical Level Language) 
	- a way to plumb hierarchical components together and to connect them.

 2 -> a Child (Leaf) can be /anything/, C code, JS code, stub, markdown, HTML, CSS, literate programming, Haskell, Rust, 
 - but, HLL must allow them to be composed and must write composition information out in some format (which can then be checked and transpiled) 
 - not everything can be transpiled into runnable code, the checker checks for this
 -  The Editor implements gestures for constructing /anything/ (say, by invoking emacs or draw.io, or ...) and creates .HLL files. 
 
TBD: 
- how do we draw Harel Statecharts? 
- how do we draw Drakon diagrams? 
- how do we draw C code? 
- how do we draw JS code? 
- how do we draw anything that plantuml can draw, but un-backwards?
	- Kinda like org-mode-babel but un-backwards. 
	- Edit->text instead of text->??? Text is but a subset of SVG. 
	- You /draw/ text in an editor, which produces .svg (.html?) files.  In 2020's, we have hardware that can create bitmaps that overlap (we call them "windows"). Text is but a subset of that. 
	- 
	- 
