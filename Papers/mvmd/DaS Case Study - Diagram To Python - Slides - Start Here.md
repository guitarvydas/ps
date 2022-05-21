## Introduction
1. The Diagram
2. How to Transpile the Diagram to Python
3. Diagram internals talkthrough


## 1. The Diagram
![[mvmd.png]]


![[Recording 20220511153301.webm]]
![[Recording 20220511153554.webm]]

![[Recording 20220511153748.webm]]


![[Recording 20220511154257.webm]]

---
## 2. How to Transpile  the Diagram to Python
a. draw the diagram in Draw.io.
b. Sight-read the diagram  into text format (manual traspilation from mvmd.drawio to mvmd.das)
c. run the DaS transpiler (machine transpilation from mvmd.das to mvmd.py)

Step (b) is done manually on purpose, to demonstrate how this can work.  We will look at a machine transpiler, later elsewhere.

---
### a. Draw the Diagram

Learn to use the draw.io [editor](https://www.diagrams.net) at a basic level.

Use *rounded rectangle*s for the boxes.

Set the text to be at the top of each box and to be left justified with five pixel left margin.

Position the boxes and nest them appropriately.

---

### b. Sight-Read The Diagram Into Text Format

Create one pair of brace-brackets for every box on the diagram (this is ASCII Art).

Nest the bracket-pairs as shown on the diagram.  

Copy the text, verbatim, fromthe diagram into the text.

If you're not sure, see #das below.

This step should be *very* mechanical, and, therefore, could be done by a machine.

This should be too boring to do more than once.

---
### c. Run the DaS transpiler
```
	./prep/prep "." '$' mvmd.ohm mvmd.fmt --stop=1 --fmt=`pwd`/fmt.js <mvmd.das >mvmd.py
```

This says run the prep tool creating a chunk starting at the beginning all the way to the end stop after one go use fmt.js for support and use of the `mvmd.ohm` and `.mvmd.fmt` for the grammar and rewrite specifications taking input from `mvmd.das` and putting output into `mvmd.py`.

See the Makefile in [mvmd](https://github.com/guitarvydas/mvmd)

The *prep* tool is included in a subdirectory.  *Prep* is based on *Ohm-JS*.

---
### (d) Use the Result

The transpiled file is `mvmd.py`.

---
### (e) Machine Transpilation of the Diagram
If you really want a machine to transpile the diagram
1. See [das2json](), use das2json to transpile `mvmd.drawio` into `mvmd.json`.
2. Write some code in some language (e.g JS, Python, Ohm-JS, C++, PROLOG, Clojure, Haskell, Rust, etc.) to breathe in `mvmd.json` and to spit out `mvmd.das`.

---
## 3. Diagram Internals Talkthrough

---
### The Diagram (Again)
![[mvmd.png]]

---


## Transpiled to .DaS
{id: #das}

```
{ parameter <from> = $1
  { parameter <to> = $2
    { for every .md file in <from>/_posts => filename
      { strip date from front of filename => strippedFilename
        { copy filename to <to>/strippedFilename }
      }
    }
  }
}
```

![[Recording 20220511154743.webm]]

---
## Transpiled .DaS to Python
```

import os
import glob
import re
import shutil

def mvmd (p1, p2):    
    LTfromGT = p1
    LTtoGT = p2
    for filename in glob.glob (f'{LTfromGT}/*.md'):    
        temp = os.path.basename (filename)
        match = re.match (r'(^[0-9-]+)(.*)', temp)
        if match:
            strippedFilename = match.group (2)    
            shutil.copy (f'{filename}', f'{LTtoGT}/{strippedFilename}')
        else:
            pass
   

```

![[Recording 20220511155054.webm]]

---
## DaS To Python Transpiler using Ohm-JS
```
Main = "{" SyncBox "}"
SyncBox = Command
Rec = "{" SyncBox "}"

Command =
 | "for" "every" ".md" "file" "in" name "/" "_posts" SetSynonym Rec? -- foreveryCommand
 | "strip" "date" "from" "front" "of" GetSynonym SetSynonym     Rec? -- stripCommand
 | "copy" GetSynonym "to" name "/" GetSynonym                   Rec? -- copyCommand
 | "parameter" name "=" ParamName                               Rec? -- parameterSynonym

...
```

![[Recording 20220511164322.webm]]

---

## Re-Format Partial
```
...
Command_foreveryCommand [k1 k2 k3 k4 k5 Name k6 k7 SetSynonym @Rec]
= [[\nfor ${SetSynonym} in glob.glob (f'\{${Name}\}/*.md'):${fmt.ind ()}${fmt.lines (Rec)}${fmt.outd ()}]]
...
```

![[Recording 20220511171303.webm]]

---

### Re-Format Command Name
```
Command_foreveryCommand ...
```

![[Recording 20220511171530.webm]]

---
### Re-Format Parameters
```
... [k1 k2 k3 k4 k5 Name k6 k7 SetSynonym @Rec] ...
```

![[Recording 20220511171707.webm]]

---
### Re-Format Rewrite
```
...
= [[\nfor ${SetSynonym} in glob.glob (f'\{${Name}\}/*.md'):${fmt.ind ()}${fmt.lines (Rec)}${fmt.outd ()}]]
...
```

![[Recording 20220511171854.webm]]

---
### As JavaScript
```
Command_foreveryCommand : function (_k1,_k2,_k3,_k4,_k5,_Name,_k6,_k7,_SetSynonym,_Rec) { 
_ruleEnter ("Command_foreveryCommand");

var k1 = _k1._glue ();
var k2 = _k2._glue ();
var k3 = _k3._glue ();
var k4 = _k4._glue ();
var k5 = _k5._glue ();
var Name = _Name._glue ();
var k6 = _k6._glue ();
var k7 = _k7._glue ();
var SetSynonym = _SetSynonym._glue ();
var Rec = _Rec._glue ().join ('');
var _result = `\nfor ${SetSynonym} in glob.glob (f'\{${Name}\}/*.md'):${fmt.ind ()}${fmt.lines (Rec)}${fmt.outd ()}`; 
_ruleExit ("Command_foreveryCommand");
return _result; 
},

```


![[Recording 20220511172827.webm]]

![[Recording 20220511172940.webm]]

![[../../Statecharts/Recording 20220511173042.webm]]

---
## The Grammar and Re-Format Specifications

![[Recording 20220511173353.webm]]

[[Appendix - mvmd.ohm]]
[[Appendix - mvmd.fmt]]
