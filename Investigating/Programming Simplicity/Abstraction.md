Abstraction ≣ lasso a design, reduce/restrict interfaces (input AND output interfaces), cut then paste elsewhere, leaving only a signature box with a smaller (simpler) interface -> always make the interface smaller (like recursion - divde and conquer)

At some point, the newly abstracted design will become "too complicated" which simply means that another layer of abstraction is required (lasso, cut/paste, climb up to the next rung of the abstraction-layer ladder).

"Good abstraction" makes the problem simpler and elides lower-level details (pushes details down and hides them, but doesn't get rid of the details).

"Bad abstraction" performed for the purpose of implementation, but, doesn't make the problem appear simpler.

Abstraction for concepts is useful to Architects and subsequent readers (e.g. Engineers, Implementors, Testers, etc., etc.)

Abstraction for implementation is useful only for Implementators, but, not for Architects.

Abstraction creates a new "syntax" (a new DSL), which I call an SCN (Solution-Centric Notation).  Abstraction using the same trick syntax (e.g. lambdas) is useful only up to a point.  New syntax makes the abstraction "more obvious".  Programmers avoided new syntax because building languages was a mega-project.  Ohm-JS changes that (new language in an afternoon[^toolbox]).

[^toolbox]: Especially when the new language transpiles to an already-existing language (I call this a *toolbox language*), like Python, C, JS, etc.