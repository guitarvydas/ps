I argue that the "global variable problem" was caused by the use of text-based programming languages.

For example

```
var x;
function f (...) {
  var y;
  y = 1;
  x = 2;
}
```

Would be written in diagram form as:
![[globals-freevariable.png]]

Upon seeing this, we would be compelled to rewrite it as:

![[globals-boundvariable.png]]

Which immediately wraps a *scope* around the global variable `x` and makes it obvious, to the reader, what the scope of `x` is and where it can be used.

Note that λ-calculus does exactly this, but, in textual form, by wrapping a λ around the global variable `x`.  

Note that λ-calculus uses a more politically-correct name for the word 'global'.  It is called a *free variable*.

The "global variable problem" was ultimately solved by wrapping variables in textual scopes, mimicking diagrammatic expressions of programs. `{ ... }` means `box`, but isn't as visually obvious as a drawing of a box.

[[2022-06-07-Abstraction In Diagrams]]