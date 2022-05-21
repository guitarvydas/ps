# Nesting
Nesting is a play on the balanced parenthesis pattern.

The grammar is written in a way that allows deep nesting.

[*We imagine that deep nesting could be used to embed languages into other languages, using pipelines.*]

## Nesting Pattern
```
nested {
main = nested*
nested
  = "{" nested* "}" -- nested
  | stuff          -- flat
stuff = ~"{" ~"}" any
}
```

Here, we've used braces `{ ... }` for nesting instead of parentheses.

## Nesting Pattern In Action
![[nested1.png]]
![[nested2.png]]

![[nested3.png]]