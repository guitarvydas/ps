---
tags:
- hardwirednames 
---

Names of callable functions cause dependencies when the names are hard-wired into code.

This practice is promoted by most current programming languages.

For example:
```
f(...)
```
is meant to call a function.

The name `f` is hard-wired into the above code.  

The above code *depends* upon the function `f`.

This kind of dependency inhibits flexibility.  

It is hard to change a design since the design is constrained by the above code, to include the function `f`.

It is difficult to test the above code, since you also have to drag in the function `f` for the test.

DLLs (dynamic link libraries, shared object code, `.so`, `.dll`, `.dylib`, etc.) attempt to alleviate this problem by using one-way indirection, but, they indirectly still use dependency-creating dynamic bookmarks (`return addresses`) and, thus, DLLs do not achieve the goal of 0D (zero dependency)