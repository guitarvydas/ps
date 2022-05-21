# Deep Matching - Left-To-Right

It is possible to group matches from left-to-right (or right-to-left (see the appropriate section)) using Ohm-JS.

In parsing terminology, this is called `left recursion`.

Standard PEG has problems with `left recursion`.  Ohm-JS does not have such problems.

## Deep Matching - Left-To-Right Pattern
```
leftRecursion {
  Main = Item
  Item = Item Primary -- recursive
       | Primary      -- bottom
  Primary = alnum
}
```

## Deep Matching - Left-To-Right Pattern In Action

![[leftrecursion.png]]