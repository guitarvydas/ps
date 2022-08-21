The following is a simple grammar for recognizing markdown - lines of text that have zero or more `#`s (octothorpes) at the front of the line:

```
MarkDown {
main = line+
line = indent? spc? toEOL+ linetail
linetail =   newline toIndent* -- withContent
| newline? end -- withoutContent
indent = indentChar+
indentChar = ("#" | "*")
toIndent = ~indentChar any
toEOL = ~newline any

newline = "\n"
spc = " "
}
```

In the 5th rule down - `indent` we recognize an indent as 1 or more octothorpes.  If there are zero octothorpes, the `indent` rule does not fire.

At this point - when we fire the `indent` rule, we know how to count and query the depth, i.e. the number of octorhorpes.

We want to query this information in the 2nd rule `line`, but, we don't want to know how the information is stored, i.e. we don't want to know if `indent` created a list or an array or anything else.

In essence, we want `indent` to pass the count back up the tree.  We could put the number on a stack and allow `line` to query that stack.  Better yet, we could create a *function* that contains a closure that can be queried to return the resulting count to the parent rule `line`.

The parent rule `line` invokes the pattern-matching rule `indent?` and expects the child rule to return a usable closure.  The parent does not need to know how the child rule `indent?` performs a match nor how it counts (or otherwise calculates) the depth.

For this to happen:
- the parent rule needs only to know that it can call `indent?`, and, that `indent?` will leave a usable closure, named `depth()`, and, 
- the parent rule needs to know how to invoke the child's closure, and,
- that the child's closure returns a number
- the `?` operator (`optional` - which fires 0 or 1 matches) needs to allow the child to return the closure to the parent
- the `?` needs to allow the parent rule - `line` - to invoke the closure even if there are zero (0) matches, i.e. if the child `indent?` is null or undefined or otherwise non-existent.

I think that this implies that we need a *reverse* lookup mechanism, like JavaScript's dynamic variable lookup chain, but that allows the parent to look *down* into the child rule.  

This can be implemented by
1. having the child return a closure
2. ensuring that `?` does not affect the returned closure, `?` does its work but wraps the result in a pass-thru wrapper that invokes the closure only if the child rule was matched, and, produces some sort of *default* value as a placeholder if the child match is non-existent.

The desired semantics are obvious - at least to me - when I look at a diagram of the situation.

Most of the semantics can be implemented using existing technology, with `?` returning a `maybe` closure that can always be called without harm.  The child produces a closure, the `?` operator wraps it in a `maybe` closure.  If the child node does not exist (i.e. did not match at all), the `maybe` closure returns a default value.  

In general, the parent rule needs to know to check the `maybe`ness of the result.  Specifically, in the case of no-match, if the parent expects a number, it should get `0` and, if it expects a string, it should get `""`.  Ideally, the parent doesn't need to "check" the result, it just forges ahead. The default values are convenient *sentinels* that allow progress without insertion of code-bloated checking.