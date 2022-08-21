
Prep* is a parsing tool that helps build parsers. I describe *prep* later.  *Prep* is a fairly straight-forward application of Ohm-JS.

I compose an application in layers of successive *prep* calls.

I give a simple Ohm grammar and a formatting spec to each layer.  I feed one layer's output to the next layer.  For example, to convert diagrams to text from .drawio files, I use a pipeline of four (4) calls to *prep*, followed by a few calls to standard text-manipulation commands (like *sed*) to clean up the final code.  (You can examine this code at [d2f (see d2f.bash)](https://github.com/guitarvydas/das/tree/main/d2f)  and [das](https://github.com/guitarvydas/das))