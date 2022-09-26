- 0D
- Bloatware
	- [[../2022-09-20-Bloatware Caused By Type-Checking]]
	- [[../Papers/On Bloatware]]
- Macros
	- Lispers understand macros.
	- Lisp macros were invented in pre-CL Lisp, inspired by FEXPRs
		- it is not clear to me that macros would have been invented using more modern "static" languages
			- "static" languages require programmers to appease compilers by specifying a great amount of detail
			- macros were invented as simple text-replacement functions
				-  the invention of macros was accidental and "backed into" instead of being deliberately designed (later improvements to macro processing required more deliberate design, though)
			- I believe that the amount of detail required to appease modern compilers would have affected the way programmers-of-the-day thought and would have prevented them from "backing into" the invention of macros.
		- early Lisps employed EXPRs and FEXPRs
			- the difference between the two is simple
				- EXPRs are functions whose arguments are evaluated before the function call (the norm for more modern programming languages)
				- FEXRs, on the other hand, are functions whose arguments are *not* evaluated before the function call
					- FEXPR arguments are automatically quoted
					- the callee is responsible for evaluation of the arguments
						- hence, the callee can alter the argument before causing it to be evaluated
					- in Lisp, quoted arguments are turned into lists
						- the equivalent, in non-lisp languages, would be to convert arguments into strings which can be later interpreted by an EVAL-like function

## IF-THEN-ELSE Example
## Fictitious String Language
Let us imagine a fictitious string-based language that uses FEXPRs to make an *if-then-else* macro...

```
if (abc > 0) then def else ghi
```
might call the "if" macro with 5 arguments:
1. "(abc > 0)"
2. "then"
3. "def"
4. "else"
5. "ghi"

(this is reminiscent of how TCL/TK works and how /bin/sh (or /bin/bash) works)

The macro might return a string to the compiler:

"if (abc > 0) { return def; } else { return ghi; }"

It can be more interesting than this, but I'm trying to keep this example simple.  I'm deliberately leaving out a lot of nuance, for example is the first arg "(abc > 0)" or something more destructured?

The "if" macro uses standard string-manipulation functions (e.g. regexp, substitution, concatenation, etc.) to hack on the arguments and glue the interesting bits into a single string for returning to the compiler.

Maybe the macro is written as:
```
return "if" + arg1 + "{ return " + arg3 + "} else { return " + arg5 + "}"
```
The macro code simply discards args 2 and 4.

(If you understand this, then you probably can see all sorts of details that I'm skipping over).

Lisp uses trees - also called "lists" - for all of its program code.  Lisp has a rich library of functions that can be used to create new lists.  

## Lisp
In Lisp, we might write

```
(if (> abc 0) then ( def ) else ( ghi ))
```
This is a list of 6 items:
1. the Atom *if*
2. the List (> abc 0)
	- which is a list composed of 3 items
		1. the Atom *>*
		2. the Atom *abc*
		3. the Atom *0*
3. the Atom *then*
4. the List ( def )
	- which is a list composed of 1 item
	1. the Atom *def*
5. the Atom *else*
6. the List ( ghi )
	- which is a list composed of 1 item
	1. the Atom *ghi*

The "if" macro returns a List to the compiler: `(if (> abc 0) def ghi)`.  

As above, the "if" macro simply dumps the arguments "*then*" and "*else*" (they happen to be Atoms in this example).

As above, there are a number of nuances that I'm simply skipping over.

The programmer who creates the "if" macro is free to use any list-creating functions available in the toolbox.

The programmer who creates the "if" macro is free to add as many error checks as necessary.  If the "if" macro is to be generalized, a lot of extra code for error checking is included.  On the other hand, if the macro is a one-off, the macro-programmer might assume that the user is intelligent and careful, so very little error-checking code is included. 

## Hygenic Macros
It is possible to write the "if" macro in a way that checks for every kind of error, ensuring that the macro never generates code unless everything checks out.

Doing this is a lot harder, and, is the basis of "hygenic macros" used in Racket and Scheme.

The loosey-goosey macro definition is about 1 line of code, whereas the full-blown hygenic version is about 1 page of code (many lines).

## Which Is Better?

So, which way of writing the macro is "better"?

The word "better" needs to defined:
1. "better" meaning error-free
2. "better" meaning go-with-the-flow
	- invent new ideas and toss them out at will

If you want to Production Engineer - optimize - code to create a final product which is smaller / faster (which one, smaller or faster?), then, you want option (1) - lots of details, with the guarantee that the macro-expander super-checks all code and doesn't let any stupid error slip through the cracks.

If you want to invent a new product, then you want to eschew details and write your code using broad strokes and whiteboards.  In this case, 1 line of code is "better" than 1 page of code.  What happens if you make a mistake?  Bad things, but, you're smart and expressiveness is more important than detailing.  What you really want is to express what-you-want in only 1 line, then have your ideas automatically checked for errors by a magical box.  The magical box doesn't tell you how to express your ideas, but it checks for errors and gives informative suggestions about how you might make your code more-checkable.

- not models, compilation/diagram-syntax
	- different mindset
	- compilation => need to cull notation and ensure that each element is compilable (machine readable/writable)
	- models => too "loose" ; humans can understand many more "notations" and nuances than can machines
		- "let's designers off the hook" for needing to be precise, stick people and clouds and hand-waving


# notes
- PEG, Ohm-JS, Verbatim, nesting
- nesting, layering
- 