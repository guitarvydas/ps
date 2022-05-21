Much of the code for ė is written as diagrams (instead of being written as hoary .js text files).

I use two (2) kind of diagrams:
1. `.das`
2. `.drakon`

`.das` diagrams use a new syntax.

`.drakon` diagrams (try to) follow the [Drakon](http://drakon-editor.sourceforge.net) format

Most of the code isn't special, it is something that most programmers would write in their favourite languages at the drop of a hat.

Yet, there are small twists and turns that - I feel - are better-described in diagram format.  For example, the meat of `routing.drawio` is contained in the inner-most box, but, there is a lot of data-unpacking that must be done first.  Again, this unpacking is nothing special and is usually handled by `.` syntax (methods and attributes) of textual languages.  Yet, the text version of the code hides the important actions behind a wall of implementation detail.  This is, in some way, just a UX issue - the programmer UX. Textual languages are just UXs (IDEs) for programmers.  

Text languages try to address many of the same issues by more syntax, e.g. *let* and *where*.

I was allowed to tune my text snippets exactly for this problem (the problem of creating code to execute ė programs).  I collected up all of the text snippets that described my solution and stuffed them into `dia.ohm`.  I didn't bother to generalize, I simply used Ohm-JS (*prep*) as a big, fat macro processor to handle my specific solution.  The goals were:
- "to make it work" rather than buffing code sequences to make them prettier.  
- "to allow others to understand what I did".

The `.drawio` programs are:
- `handling.drawio`
- `routing.drawio`
- `find_connection.drawio`.

The `.drakon` programs are:
- `step.drakon`

(It looks like I built find_connection__in_me.das by directly hacking on the transpiled version of `find_connection.das`).

In the end, these all are transpiled to `.js` files and `require`d in the usual JavaScript manner.

I didn't draw diagrams for every bit of code.

The goal was to aid others in understanding what I'd done, not anally draw diagrams of *everything*.

I mix diagrams and textual code at will.  Diagrams are better at expressing some things, and textual code is better at expressing other things.  ATM, I think that diagrams are good for expressing control-flow and concurrency while text is good for expressing subroutine calls and function calls and grade-school math.

The diagrams don't make the algorithms any easier - the algorithms are still the same and, you need to study them to see what I meant.  The diagrams, though, (hopefully) elide some of the implementation details that get in the way of understanding.  Use of syntax - textual or diagrammatic - is a *style* thing.  You don't have to like my style to understand what I did.  If I wrote everything in text, you'd have to reverse-engineer what the textual code does before understanding what I had intended to do.