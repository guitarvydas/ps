Docker kills a problem that occurs in *bash* scripts
- the use of `PATH`.

`PATH` is a shell variable.

`PATH` is usually different on different machines and is settable by users (developers).

`PATH` is a *free variable* (the politically-correct way of saying *global variable*).

*Docker* wraps apps in envelopes.  

The envelopes are set up using scripts, scripted by the developer of the app.

*Docker* envelopes contain *only* the shell variables that are specified in *Docker scripts*.  All local variable values are hidden.  Shell variables, like `PATH`, are set up by the scripts and are unaffected by local, user-defined values.

In this way, the *app* sees *only* the variables as they were defined in the *Docker script* and the *app* runs "the same" on every machine that it is downloaded to.

This situation is bound to change as developers write more complicated apps.  For example, what happens if the app wants to know more about its surroundings - is this a desktop machine, or, is this a tablet, or, is this a phone?  Will the app look only at the variables defined in the *Docker script*, or, will it try to reach around the script and peek at its surrounding?  If the app looks at *only* the variables in the script, who sets those variables?  Does the app come with a user manual that tells the user how to parameterize the app?

Flat-anything has this problem.  It solves the immediate problem, but will encounter headaches in the future.  Incremental fixes are like golf tips.  They work for a while, then "stop" working when things get more interesting.

Opinion: what is needed is a way to transpile diagrams to Docker components.  That would be a start.  Later, someone will figure out how to optimize this combination.