## Sample parse
Let's see how a very, very simple line of text parses...

`## c d`

## AST

The Ohm grammar respresents the AST as flat text.  The AST is the abstract grammar which specifies all of the *possible* ways that input text can be matched by the parser app.

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

A *grammar* is like a *REGEX* (regular expression) that provides subroutines and has a less unreadable syntax for specifying matches.  

The drawback of grammars vs. REGEX is that grammars take up more space - multiple lines.

The advantage of grammars over REGEX is that grammars provide programmer-defined subroutines (rules), whereas subroutines need to be hard-coded into REGEX.. For example, to match alphanumeric symbols in Python REGEX, we must write `\w` whereas, in Ohm, we can write our own rules or use the built-in `alnum` rule.

Both DSLs, REGEX and Ohm, are used for specifying text matchers.  REGEX is good for short one-line patterns, but, when more complicated patterns are desired, one should switch to using Ohm grammars.

### Parse Tree

The abstract tree (AST) is applied, by the parser to the string `## c d` and creates a concrete parse tree (CST):


![[mdparse.png]]

### Parse Trace
The parser creates a JS array `[...]` that is the final CST (concrete parse tree).

Nested lists of arrays are used to represent the above 2D tree diagram in 1D text[^1d].

[^1d]: The text is, also, 2D, but is more *flat* than the diagram.  I use the term 1D to emphasize the difference, despite the fact that the term is somewhat inaccurate.

In nested list notation, we see the parse tree as...

| rule | args | |
| ---- | ---- | -------------------------------------------- |
| main | line | `[[[[[[#] [#]]]] [[]] [[c] [] [d]] [[] []]]]` |
| line | indent ; spc ; toEOL ; linetail | `[[[[#] [#]]]];[[]];[[c] [] [d]];[[] []]` |
| linetail_withContent | newline ; toindent | `[];[]` |
| toEOL | c | `["d"]` |
| toEOL | c | `[" "]` |
| toEOL | c | `["c"]` |
| sp | c | `[" "]` |
| indent | indentChar | `[["#"] ["#"]]` |


