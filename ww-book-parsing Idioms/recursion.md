## Thinking Inside The Box Inside The Box Inside The Box ...

The `+` operator can be replaced with recursion.

This is not important for matching, but, may become important in applying semantics.

The `+` operator produces a CST node that represents a *sequence* of items.  The node can be walked *across*.

Recursion, though, produces a CST node which represents a recursive sequence - an item plus a continuation,  The node can be walked *downwards*.

When applying semantics, if you want to pass data from one item to the next, recursion becomes useful.

### Recursion In Action
This small example shows the use of both, `+` and *recursion*, to pattern-match the same input.

I needed to insert a non-matching ";" in the sequence to stop the first pattern from gobbling up all of the input.  The parser matches `a b c` with the `alnum+` rule, then comes up for air (fails to match more alnums), matches the ';' then matches `d e f` with the `Item` recursive rule.
![[recursion.png]]