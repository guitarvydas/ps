My goal is to introduce the ideas of drawing a program in several gentle steps.

Simplistic, ad-hoc, parsing is introduced in the book "Hamburger Workbench - A Gentle Introduction to Parsing".

This paper takes that same code and transforms it into a drawing, in 3 steps.

The final drawing is that of a test bench for the "Order Taker" component.

In the process, I develop a component based on legacy code - the "Phrase Parser".  This component creates a wrapper for legacy Javascript code - Ohm-JS - and makes it possible to use this code in the async design paradigm.

This introduction consists of several steps:

1. An ad-hoc implementation of a browser-based app that performs only a simple function (hopefully understandable and easy to explain).  This implementation is the subject of the previous book "Hamburger Workbench - A Gentle Introduction to Parsing".

2. A less ad-hoc re-organization of the app into *components*.

3. A *drawing* of the component-based app, transpiled into a running app.  Note that this step is simpler than what is often called a VPL (Visual Programming Language), using only
- rectangles
- ellipses
- lines
- text

These basic graphic elements are already supported by SVG and this step presents no new technology, just a different way to organize programs.


I call drawings of programs, *DaS*, for Diagrams as Syntax.

We begin with a look at "what is programming?", then dive into steps 1-3, the development of a simple, frivolous, application as a web client.

We will discuss the question of what makes a good drawing for representing programs.  What ideas can be used to construct DaS syntaxes? [[What Makes a Good DaS Syntax?]]

The issues of using Ohm-JS and why Ohm-JS is better than PEG which better that REGEX are discussed in the previously-mentioned book.

We will discuss the use of current programming languages as *assembler* for the next generation of progamming languages, esp. DaS. [[The Next Generation of Programming Languages]]

A separate book will be devoted to a collection of text-parsing idioms.  A cookbook for pattern matching.

Future writing, whether in book form or in blog form, will discuss
4. Transpiling `helloworld.drawio` (a drawing) to Python (transpiling to Python instead of to Javascript, which the subject of this book)
5. Transpiling a drawing of a Python program to transpile `helloworld.drawio` to Python (a diagrammatic Python program that performs step 4)
6. Toolbox languages
7. Orthogonal Programming Languages.

[[2022-06-07-Parts of Programming]]
[[hamburgerworkbenchD0D/HamburgerD0D - Start Here]]
