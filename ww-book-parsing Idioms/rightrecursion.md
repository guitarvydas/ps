# Deep Matching - Right-to-Left

It is possible to group matches from right-to-left (or left-to-right (see the appropriate section) using Ohm-JS.

In parsing terminology, this is called `right recursion`.

## Deep Matching - Right-to-Left Pattern
```
rightRecursion {
  Main = Item
  Item = Primary Item -- recursive
       | Primary      -- bottom
  Primary = alnum
}
```

## Deep Matching - Right-to-Left Pattern In Action
![[rightrecursion.png]]