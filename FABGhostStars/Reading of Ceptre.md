# Paper
https://www.cs.cmu.edu/~cmartens/ceptre.pdf

# Reading...

Main elements:
- factbase
- rules arranged in *stages*

factbase
- facts
- containers (states)
- rules

in the current State
1. pick any rule that is applicable
2. create a new factbase by applying the rule to the factbase
3. write out the new factbase, as factbase'

nondeterminism: rules are unordered, engine is free to choose any single rule

# Predicates
Predicates are attribute triples.  Predicates are facts.

e.g.
```
at character location : pred. 
likes character character : pred. 
anger character character : pred. 
has character object : pred. 
depressed character : pred.  
dead character : pred.
```

Likes and Anger use two Characters, the Subject and the Object.

Likes and Anger can appear more than once in the factbase, instead of themselves containing counters. For example, if A Likes B with a count of 3, the factbase would contain three separate `likes A B` facts.

# Combinations of Predicates

Predicates can be *composed* using the Conjunction operator `*` (called "tensor"). 

# Transforming The Factbase

## Transformation
The main transformation operation is signified in the paper by `-o` (called "lolli").

The *lolli* looks a lot like `:-` in PROLOG.  The main difference is that PROLOG uses backward chaining whereas Ceptre uses forward chaining.  PROLOG looks for matches on the RHS (right-hand side of `:-` ) and replaces lumps of such matches by the single LHS (left-hand side) abbreviations (well, there's more to it, but, that's good enough for a first approximation).  Ceptre looks for matches on the LHS of *lolli*, then replaces such matches by the RHS of *lolli* (again, there's more to it, like `$`, but is good enough for now).

`name: X -o Y` creates Y when X is applicable.  The rule has the given name `name`.

Each of X and Y are combinations of Predicates.


### Replacement

When X matches, all of its parts are removed from the new factbase and replaced by all of the parts of Y.

By default, Predicates in Y are fresh creations.

If a Predicate in X is preceded by the `$` operator, the Predicate is preserved in the new replacement Y.  This appears to be cosmetic only and saves keyboarding.

## Permanent Transformation
`!name` means that the system enters the State *name* permanently, and can never exit that State.

# Examples
The paper shows a script for the rule called `do/murder`.  Lispers know that `"/"` is just another character, like `"_"` and has no further meaning.  In most other languages, `/` means `divide`, but, that's not the case here.  Here, `/` is just another character in the rule's name.
```
do/murder  
: anger C C’ * anger C C’ * anger C C’ * anger C C’ *
  $at C L * at C’ L * $has C weapon -o !dead C’.
```

The rule says:
- IF character C is angry at character C' at a degree of 4 (at least 4 anger facts)
- AND IF C is at location L
- AND IF C' is also at the same location L
- AND IF C has a weapon
- THEN C' becomes DEAD
- PRESERVING the location of C
- PRESERVING the weapon that C has


And, the paper shows a script for another rule for grieving, called `do/grieve`
```
do/grieve : $at C L * likes C C’ * dead C’ -o depressed C * depressed C.
```
which says:
- IF C Likes C'
- AND IF C is at any location L
- AND IF C' is DEAD
- THEN C' becomes depressed at a level of 2
- PRESERVING the location of C

[it seems to me that `$at C L` is redundant and is not examined nor changed by this rule, it seems that this portion of the rule could be omitted]

It can be seen that Ceptre uses some of the syntax of PROLOG, namely, that capitalized names represent variables ("logic variables") while non-capitalized names represent constant symbolic literals.  In Lisp, the syntax is different - a quote (`'`) character is used for constant symbolic literals, while all other names represent evaluated variables, except in the first position of a code-list where a non-quoted symbol represents the name of a function.

Hence, the rule clause written in Ceptre, `likes C C'` could be rewritten as `likes C D` (to remove the `'` character which is illegal in names in Lisp) and would be written in Lisp as `(likes c d)`. The symbols `c` and `d`, both, represent variables, while `likes` is the name of a function (relation).

# Wrappers and Containment
A major goal of high-falutin' Computer Science is to find ways to wrap code and to adhere to the DRY principle (Don't Repeat Yourself). 

For example, in Lisp, *lambda* is a wrapper with its own mini-environment - the parameters. Everything you need to know about the code is wrapped up into a small bundle, all of which is available for viewing at the same time.  So-called *global variables* are sneered at, since such variables are almost-always off-screen and not obviously part of the wrapped bundle.  Globals silently *leak* into code and cause unexpected gotchas.

Ceptre provides code wrappers called *stages*.  AFAICT, a *stage* is a State.  The Ceptre engine does not need to look for rules anywhere but in the current stage.  The rules in the current stage might cause a transition to another stage for the next time around.  As it stands, the Ceptre factbase is global.  Rules access the global factbase.  The paper's author implies that this arrangement is "good enough" for useful work.

# Steps and QUI

Each *stage* contains, possibly, many rules, but, only one rule is fired in each step through the system.

The process keeps firing one rule in the current *stage* at a time during each "turn".

When there are no more rules that apply in the current *stage*, the *stage* is said to be *quiescent*.

Ceptre provides an operator (predicate) to test for quiescence - `qui`.  The game designer is free to specify a rule to step to another *stage* when all of the rules in the current *stage* have been fired.

Ceptre provides the equivalent of a quoted stage name using the operator `stage «name»`.

A correct use of the `qui` operator is to supply `*` and a stage name as the operands, e.g. `qui * stage act`.
