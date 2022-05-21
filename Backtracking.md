Classically, backtracking was built in PROLOG (and hoary Lisp - see "On Lisp" and "PAIP").

Backtracking's main feature was *exhaustive search*.

Today, miniKanren has evolved the notion of exhaustive search.

MiniKanren is available, I believe, as `core.logic` in Clojure (there is a miniKanren for emacs) and in many implementations, starting with `Scheme`.

PROLOG, also, pioneered the concept of separating the evaluation engine from the syntax.  The syntax of PROLOG does not say *how* to figure something out, only *what* to figure out.  PROLOG is relational programming.

The CUT (`!`) operator was added to PROLOG to appease premature optimization'ers.  CUT breaks the fundamental semantics of PROLOG, but the programs run faster (and buggier :-).

The simplest explanation of exhaustive search and backtracking, that I have found, is [Nils Holm's Prolog Control in 6 Slides](https://www.t3x.org/bits/prolog6.html)

[miniKanren.org](http://minikanren.org)
[Barliman - TDD on steroids ; program synthesis from examples](https://www.youtube.com/watch?v=er_lLvkklsk)