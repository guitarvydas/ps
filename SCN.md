## SCN
I call mini-DSLs *SCN*s (Solution-Centric Notations)

The name *SCN*, reminds me that I shouldn't waste lots of time tuning the code.  

I expect to crank out an SCN in only a few hours.  With Ohm and divide-and-conquer, I can do this.  I let the underlying language (Pyhon, JS, etc.) do the heavy work of checking for errors and figuring out what the final code will look like.  

I use Ohm like I use macros.  I hide implementation details, but, I don't do lots of checking (the next layer down, will check my work).  I don't even *define* user-defined data structures, I just use handles to data structures that are defined in layers below my code.

Handles are common in operating systems.  If you want to open a *window* on a screen, you call the operating system to open the window and it passes back an opaque *handle* to the window, that only the operating system knows how to manipulate.

Programming can be like that.  Instead of using a GPL (General Purpose programming Language), we can use an SCN.  The SCN transpiler boils the mini-DSL notation down to GPL code.

In fact, one SCN can feed another SCN and so on.  Each layer adds/subtracts a bit of information and makes the final translation to GPL code easier.

This is how I use the *prep* tool.  

I compose an application in layers of successive *prep* calls.

I give a simple Ohm grammar and a formatting spec to each layer.  I feed one layer's output to the next layer.  For example, to convert diagrams to text from .drawio files, I use a pipeline of four (4) calls to *prep*, followed by a few calls to standard text-manipulation commands (like *sed*) to clean up the final code.  (You can examine this code at [d2f (see d2f.bash)](https://github.com/guitarvydas/das/tree/main/d2f)  and [das](https://github.com/guitarvydas/das))