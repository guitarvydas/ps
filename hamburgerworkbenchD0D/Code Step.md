```
flowchart Try-component {
  start main
  skewer main {
    unless has-children try-self/1
    memo-readiness-of-each-child
    step-each-child
    unless any-child-was-previously-ready try-self/2
    > activated/0
  }
  skewer try-self {
    : try-self/1
    : try-self/2
    unless self-has-input not-activated/3
    self-first-step-with-input
    > activated/0
  }
  skewer not-activated {
    : not-activated/3
    > finished/0
  }
  skewer activated {
    > finished/0
  }
  skewer finished {
    end
  }
}
```