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




| rule | captures |
| ---- | -------------------------------------------- |
| main | `[[[[[[#] [#]]]] [[]] [[c] [] [d]] [[] []]]]` |
| line | `[[[[#] [#]]]];[[]];[[c] [] [d]];[[] []]` |
| linetail_withContent | `[];[]` |
| toEOL | `"d"` |
| toEOL | `" "` |
| toEOL | `"c"` |
| sp | `" "` |
| indent | `[["#"] ["#"]]` |


| line | `[` | `[indent]?`       | `[spc]?` | `[toEOL]+`    | `linetail` | `]` |
| ---- | --- | ---------------- | -------- | ------------- | ---------- | --- |
|      |  `[`  |  `[[[[[#][#]]]]` | `[[ ]]`  | `[[c][ ][d]]` | `[[[\n]]]` | `]`     |

| line | `[` | `[indent]?`       | `[spc]?` | `[toEOL]+`    | `linetail` | `]` |
| ---- | --- | ---------------- | -------- | ------------- | ---------- | --- |
|      |  `[`  |  `[[[[[#][#]]]]` | `[[ ]]`  | `[[c][ ][d]]` | `[[[\n]]]` | `]`     |

| main | `[` | line |

| `[`| `[[[[[[#] [#]]]]`|` [[]]`|` [[c] [] [d]]`|` [[] []]]]`|`]`





`main <- [[[[[[#] [#]]]] [[]] [[c] [] [d]] [[] []]]]`
`line <- [[[[#] [#]]]];[[]];[[c] [] [d]];[[] []]`
`linetail_withContent <- [];[]`
`toEOL <- /d/`
`toEOL <- / /`
`toEOL <- /c/`
`spc <- / /`
`indent <- [[#] [#]]`


