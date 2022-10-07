
> Can we fake out dynamic languages and get the benefits of static typing?
>

No.

The “benefits of static typing” are useful for Production Engineering (optimization of already-existing Designs).

“Static typing” impedes Design, though.

Maybe we want automated typing.

Maybe we want gradual typing (type pipelines, type stacks).

Static Typing leads to something like the State Explosion problem.  I tried to show this effect in [[../2022-09-20-Bloatware Caused By Type-Checking]].  The typed version of the program requires a lot more code than the untyped version.

Sometimes, cubby-holing parts of the not-yet-understood Design into classes is a good thing.  Sometimes it is not a good thing.

You should not be forced to make that decision until you have savoured the fullness of the problem domain.

You should start out by saying something like "I want to understand and solve this problem" instead of starting out by saying something like "I will use a functional language".

If Physicists always started out using *only* functional notation, we wouldn't have Feynman diagrams nor "Order Out Of Chaos" (Nobel laureate Prigogene).