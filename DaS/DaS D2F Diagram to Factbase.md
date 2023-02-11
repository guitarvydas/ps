```
$prep '.' '$' $d2fdir/drawio.ohm $d2fdir/drawio.glue --input=$name --stop=1 --support=$d2fdir/support.js \
     | $prep '.' '$' $d2fdir/diagram.ohm $d2fdir/diagram.glue --stop=1 --support=$d2fdir/support.js \
     | $prep '.' '$' $d2fdir/styleexpander.ohm $d2fdir/styleexpander.glue --stop=1 --support=$d2fdir/support.js \
     | $prep '.' '$' $d2fdir/factbase.ohm $d2fdir/factbase.glue --stop=1 --support=$d2fdir/support.js \
     | $sed -E -e 's/</\n</g' \
     | $sort \
     | $sed -E -e '/^[ \t]*$/d'

```

# Drawio Format Graphml
Draw.io is a diagram editor.

It saves diagrams in and XML format called .graphml.

I believe that .graphml is a precursor to SVG.

Graphml contains various features not found in SVG:
- multiple diagrams (each on a separate tab in the editor)
- Edges
- Source elements for each edge
- Target elements for each edge

An *edge* is a connection (line/arrow) between two graphical elements.

Each separate diagram is saved in compressed form.  The wrapper XML containing the tabs is not compresses and appears in ASCII text.

# Prep
Prep[^rhyme] is a command-line tool that takes several parameters.
1. the first parameter is a REGEXP denoting the beginning of a block of text to be matched 
2. the second parameter is a REGEXP denoting the end of the nlock
3. a grammar in Ohm-JS fomat
4. a glue rfabricator specifiction
5. --input hotels it would file to come to read minus minus stop equals one tells it not to iterate repeatedly just do this once what is minus support points to support file written in JavaScript

[^rhyme:] "Prep" rhymes with "grep", but, uses grammars instead of REGEXPs at its core.  "Prep" also contains the prefix "pre" which indicates the original intent - if was imagined to be the beginnings of a pre-processor.  Prep uses REGEXPs to bracket a chunk of text in the input.  Once the chunk of text has been determined, the Ohm grammar is used to match against the text and, if the match is successful, the *glue* fabricator spec alters the text and outputs newly-created text to *stdout*.  The *prep* tool has been subsumed by the more recent *fab* tool (for *fabricator*).  I've kept *prep* around for backwards capability in d2f, das2f and das2j.
# Step 1 Parse Draw.io Tabs
## Goal
The goal in this step is to parse a ???.drawio file and to find each tab containing a diagram and to de-compress each diagram back into parseable ASCII.

The tab-related fluff is peeled off and the resulting diagram is represented by the *Diagram* rule.

This step could be combined with subequent steps, but, this hasn't been done.  It was easier to develop this process in small pieces arranged sequentially in a pipeline.  No effort has been made to optimize the workflow by flattening the pipeline.

The Ohm-JS grammar finds diagrams then passes them to the *drawio.glue* file where *support.decodeMXDiagram ()* is called to de-compress the diagrams.

## Command
```
$prep '.' '$' $d2fdir/drawio.ohm $d2fdir/drawio.glue --input=$name --stop=1 --support=$d2fdir/support.js
```
## Drawio.ohm
```
AppDiagramsEncodedNet{
TabbedDiagrams = Header Diagram+ Trailer
Header = "<" "mxfile" encodedChar+
Trailer = "</mxfile>"
Diagram = "<diagram" Attribute* ">" encodedChar+ "</diagram>"
Attribute = alnum+ "=" attributeValue
string= "\"" notDQ* "\""
notDQ = ~"\"" any
encodedChar = ~"<" any		   
attributeValue = number | string
number = digit+
}
```

## Drawio.glue
```
TabbedDiagrams [h @d t] = [[${d}]]
Header [k k2 @ec] = [[${k}${k2}${ec}]]
Trailer [k] = [[${k}]]
Diagram [k @a k2 @ec k3] = [[${k}${a}${k2}\n${support.decodeMxDiagram(ec)}\n${k3}\n]]
Attribute [@an k s] = [[\ ${an}${k}${s}]]
string [q1 @cs q2] = [[${q1}${cs}${q2}]]
notDQ [c] = [[${c}]]
encodedChar [c] = [[${c}]]
attributeValue[x] = [[${x}]]
number [@n] = [[${n}]]
```
# Step 2 
## Command
```
$prep '.' '$' $d2fdir/diagram.ohm $d2fdir/diagram.glue --stop=1 --support=$d2fdir/support.js 
```
## Diagram.ohm
## Diagram.glue

# Step 3 
## Command
```
$prep '.' '$' $d2fdir/styleexpander.ohm $d2fdir/styleexpander.glue --stop=1 --support=$d2fdir/support.js
```
## Styleexpander.ohm
## Styleexpander.glue
# Step 4 Create PROLOG Factbase
## Command
```
     | $prep '.' '$' $d2fdir/factbase.ohm $d2fdir/factbase.glue --stop=1 --support=$d2fdir/support.js \
```
## Factbase.ohm
## Factbase.glue
# Step 5
## Command Cleanup
```
     | $sed -E -e 's/</\n</g' \
     | $sort \
     | $sed -E -e '/^[ \t]*$/d'

```
