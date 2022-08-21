## COS The Component Operating System
Cos is based on the principles espoused in [Call Return Spaghetti](https://guitarvydas.github.io/2020/12/09/CALL-RETURN-Spaghetti.html)

Cos is a mutual-multitasking operating system.  

Mutual multitasking got a bad rep when it was used for the wrong purposes, i.e. to run multiple apps on a single computer. 

In this case, though, I want to build a *single* app using multiple independent components.  A bug is just a bug.  Endless loops are bugs.  There is no reason that mutual multitasking cannot be used to write the guts of an app.

In fact, I argue that there are fewer bugs and surprises when components are truly independent (which is more than saying components are *encapsulated*).

Processes, used by preemptive operating systems (like MacOS, Windows, Linux, etc.) are actually *closures*.

If you have *closures* you don't really need operating systems at all (if you keep reading, you will see that I, also, argue that you don't need programming languages at all).

If you wrap all software in isolated components, you are, effectively, using *closures*, and, therefore, you don't really need operating systems.  Just snap the Components you want, together.

Thinking this way leads to the notion that multitasking is backwards.  Instead of wrapping apps inside of processes, we should be wrapping multitasking inside of lambdas.

When you have truly isolated components, you can draw meaningful diagrams of systems.

If you have isolation inside of lambdas, you could draw meaningful diagrams of the innards of the lambdas.

I've explored these issues in [[ė]] and have successfully implemented an inner portion of Sector Lisp using diagrams of lambdas [xxx]

[[COS Breakdown]]