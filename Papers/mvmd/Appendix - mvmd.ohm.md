The full grammar specification for `mvmd.ohm` is listed below...

```
script {
Main = "{" SyncBox "}"
SyncBox = Command
Rec = "{" SyncBox "}"

Command =
 | "for" "every" ".md" "file" "in" name "/" "_posts" SetSynonym Rec? -- foreveryCommand
 | "strip" "date" "from" "front" "of" GetSynonym SetSynonym     Rec? -- stripCommand
 | "copy" GetSynonym "to" name "/" GetSynonym                   Rec? -- copyCommand
 | "parameter" name "=" ParamName                               Rec? -- parameterSynonym
 
SetSynonym = "=>" name
GetSynonym = name

name = nameFirst nameRest*
nameFirst = nameLetter
nameRest = digit | nameFirst
nameLetter = ~space ~digit ~delimiter any
delimiter = "/" | bracket | ","
bracket = "(" | ")" | "[" | "]" | "{" | "}"
ParamName =
 | "$1" -- p1
 | "$2" -- p2
}
```

Ohm-JS provides grammar inheritance, which could have been used to chunk the above specification into smaller pieces.

Maybe, the smaller pieces, would be more understandable to human readers.

I treat *text programs* as *assembler* for the next generation of languages (hybrids of diagrams plus text), and, hence, don't see a need to spend time making the above more readable to humans.

My main (only) concern is to make the specifications readable to machines (AKA computers, computer programs).  Human-readability[^text] is of only secondary importance, in my view.

[^text]: Human-readability of the text.  I argue that human readability is paramount, but, that diagrams should be used for this purpose.