```
NameList =
  | Name NameList
  | Name
```

```
```

## Grammar

![[Environment Inheritance/envinherticance-grammar.png]]

## Environment Inheritance

![[Environment Inheritance/envinherticance-inheritance.png]]

## Lambdas

![[Environment Inheritance/envinherticance-lambdas.png]]

## Recursion
Recursion creates a dynamic (encapsulated) scope.

Each recursive call inherits the dynamic scope of its caller.

λs are just a way to reduce the visual noise of the notation, making the notation more human-readable.

Instead of making every parameter explicit and pushing each parameter onto the growing dynamic scope, λs do this under-the-hood with less visual noise.

`λa.body` means:
- push `a` onto the scope
- evaluate `body` in the (extended) scope (that includes `a` now)

## PEG Kleene Star
```
Rule = Pattern1 Pattern2*
Pattern2 = Rule
Pattern1 = ...
```

is the same - pattern-matching-wise - as:
```
Rule = Pattern1 Rule
```
At the semantic level, though, only the recursive rule grants access to it environment to Pattern1, and the two variants do not have the same "semantics".

If, instead, we modify `*` to grant access (inheritance) to any environment it creates, then the two variants become semantically equivalent.

In Ohm-JS, this can be implemented by writing the `_iter` semantic rule to create a stack and to allow searching upwards through the stack (inheritance).  Alternately, one could "optimize" the stack to clone the previous stack and to extend it, hence, constraining all lookup operations to look in only the top stack entry.

The `_iter` semantic rule would need to extend the stack before evaluating child nodes.