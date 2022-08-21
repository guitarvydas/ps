## Balanced Parentheses

PEG can build parsers that match balanced parentheses (or, balanced anything-else).

### Balanced Parenthesis Pattern
```
balancedParens {
main = inner
inner
  = "(" inner* ")" -- nested
  | stuff          -- flat
stuff = ~"(" ~")" any
}
```

### Balanced Parenthesis Pattern in Action
![[balancedParens.png]]
