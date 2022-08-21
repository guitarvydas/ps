## SCN
I call mini-DSLs *SCN*s (Solution-Centric Notations). I use the name SCN (Solution Centric Notation) to mean DSLs that are not generalized, but, are specialized for a particular problem.  

  I believe that, with Ohm-JS, programmers can build *several* SCNs for a specific problem instead of building generalized DSLs.  
 
 To me, SCNs are like batch-edit operations.  You should be able to build an SCN in an afternoon without breaking a sweat.  
 
 If you use REGEX for projects, then you already use SCNs, albeit with a write-only syntax.
 
Using the name *SCN*, reminds me that I shouldn't waste lots of time tuning the code.  

I expect to crank out a new SCN in only a few hours.  With Ohm and divide-and-conquer, I can do this.  I let the underlying language (Pyhon, JS, etc.) do the heavy work of checking for errors and figuring out what the final code will look like.  

I use Ohm like I use macros.  I hide implementation details, but, I don't do lots of checking.  I leave the checking to the next layer down.  I don't even define data structures, I just use handles to data structures that are defined in layers below my code.  

Handles are common in operating systems.  If you want to open a *window* on a screen, you call the operating system to open the window and it passes back an opaque *handle* to the window.  Only the operating system knows how to manipulate the data associated with a *handle*.

In essence, there are only two (2) kinds of data:
- a datum
- a list of data.

Everything else is an implementation detail.

Instead of using a GPL (General Purpose programming Language) for programming, we can use many little SCNs.  The SCN transpiler boils mini-DSL notation down to GPL code.

In fact, one SCN can feed another SCN and so on.  Each layer adds/subtracts a bit of information and makes the final translation to GPL code easier.


