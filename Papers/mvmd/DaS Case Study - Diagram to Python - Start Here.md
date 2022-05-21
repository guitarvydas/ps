## Synopsis

Write a diagrammatic script to move some files.

Transpile the diagram to Python.

Often, this kind of process is written as a script in a so-called scripting language, like *Bash* or *Python*.  This essay shows how to accomplish the same kind of thing using a diagram.

## Manual Transpilation

I believe that it is important to understand how to do something manually before trying to automate  the process.

In that vein, 
1. I show how to draw a simple diagram
2. Then, transpile the diagram, manually, to text
3. Then, to use Ohm-JS to transpile the transpiled diagram text to Python.

Note that the text in (2) doesn't look like Python code.

DI (Design Intent) is shown in (1) and (2), then, Ohm-JS transpiles (2) into the details required by (3).

To draw the diagram, I use `draw.io`.

## Divide and Conquer - You Don't Need a Compiler
[[Discussion - Divide and Conquer - You Don't Need a Compiler]]

## The Pure Essence of the Intention

[[Discussion - The Pure Essence of the Intention]]

# The Diagram DI
![[mvmd.png]]

The diagram is not exactly rocket science, it is not complicated.

- I want to take 2 parameters, *fromdir* and *todir*, containing directory names
- I want to grab all .md files from *fromdir* and copy them to *todir*, but, to rename them in the process.
- The *fromdir* files are in *jekyll* format (originally written in Github Pages format), containing a date embedded in the filename.
- I want to remove the date from the filename, then copy the contents into a new file in *todir*.  The new file has the date stripped off of its filename.

I'm going to do this once.  Whatever technology I use to perform the task, must not stand in my way in accomplishing this once-only task.


Steps, sequential:
1. Rename the parameter `$1` to the name `<fromdir>`.
2. Rename the parameter `$2` to the name `<todir>`
	- names are for human readers
	- machines don't care about the actual names, as long as they are used consistently
	- as a human, I want to use the characters `<` and `>` in the names.  These characters remind me (and readers) that there is something special about these two names (they are parameters to my script).  The machine doesn't care if I use `<` and `>` characters in the names.  Actually, the machine doesn't even care if I use spaces in names, but we'll save that for another essay.
3. Step through each file in `<fromdir>/_posts` 
	- use the synonym `filename`  to hold the current filename in each step
	- I've written the phrase to state what I want to do, then I show what synonym to use for the result (`=> filename`).  This choice is *my* choice and isn't cast in stone.  Others might choose different phrasings.
4. Strip the date from the filename to produce a new filename, and to save that new filename in a synonym called `strippedFileName`.
5. Finally, copy the original file into a new file, using the new, stripped file name. Along the way, `<fromdir>` is used to specify the location of the original file and `<todir>` is used to specify the locaiton of the new file (with a new name, into the directory `<todir>`).

As already said, the script doesn't do very much, but, the details for actually implementing the script are slightly different depending on which language is used (e.g. Python vs. JavaScript vs. Bash vs. ...).

The general gist of what I want to do is in a pattern-matching script called `mvmd.ohm`.

The implementation details are buried in the formatting code, called `mvmd.fmt`.

## Diagram Syntax

This diagram uses a simple syntax for nested-sequential commands.

The syntax consists of two (2) constructs:
1. A one-line command written as text
2. A box containing the command plus, maybe, another box[^rec].

[^rec]: recursively.

The boxes on this diagram are not independent[^ind].

This particular diagram shows boxes nested like Russian Dolls.

The commands in the boxes are executed sequentially, one after another - outside to inside.

See elsewhere for a full description of DaS diagram syntax for nested and independent program units.

## Independence
[[Discussion - Independence]]

## How a Compiler Works
[[Discussion - How a Compiler Works]]

## Doing Less Work
[[Discussion - Doing Less Work]]

# Transpiling The Diagram to DaS Text
The diagram can simply be sight-read into a text editor.

Each box on the diagram becomes a nested pair of braces `{ ... }`.

Each command at the top of each box is written as a line of text after the opening brace `{`.

Nesting is written as further bracketed text.

The final version of this diagram, expressed as DaS text is:

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

[[Discussion - Compressing the DaS Text Format]]

## 1. Grok

A pattern-matcher for the above code can be written directly in Ohm-JS.

The important aspects are:

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

...
```

A *box* is described in the rule *SyncBox*.

Each command is described on its own and includes an optional nested box ("Rec").

The rest of the stuff (elided above) consists of details to appease the Ohm-JS transpiler tool.

The full specification appears in the [[Appendix - mvmd.ohm]]

## 2. Re-Format

The transpilation - re-formatting - of the above textual code can be done in raw Ohm-JS.

I chose to write a small tool (you guessed it - in Ohm-JS) to create boiler-plate code for me.  I call the tool `prep`.

The main elements of the `prep` tool are:
- rule names must correspond exactly with rule names in the `.ohm` specification
- each rule consists of a rule name followed by a list of parameter names
- all parameters that use Ohm iteration operators - `*`, `+`, `?` - must be marked with a special character (`@`)[^check]
- each rule returns exactly one value - a string
- the Right-Hand-Side of the rule contains a special syntax that specifies JavaScript *template string* formatting based on raw text and on evaluated[^ev] rule parameters
- the underlying mechanism tree-walks the CST generated by step (1) and calls `prep` rules in the appropriate order, plugging match captures into the parameters of the `prep` rules.

[^check]: In the current version of the tool, I don't bother to check that `@` is correctly used.  This leads to some puzzling errors.  Obviously, the problems are not severe enough to have caused me to fix this oversight.

[^ev]: Tree-walked.

The full re-formatting specification is found in the appendix [[Appendix - mvmd.fmt]].

Summarizing, the *Main* re-formatting rule is specified as:
```
Main [lb SyncBox rb] 
= {{ fmt.setIndent (0); }}
[[
import os
import glob
import re
import shutil

def mvmd (p1, p2):${fmt.ind ()}${fmt.lines (SyncBox)}${fmt.outd ()}
]]
```

which says:

- The rule is called `Main`
- The rule takes 3 parameters, called `lb`, `SyncBox` and `rb` resp. (`lb` is an invented mnemonic for *left brace*)
- The re-format consists of 2 parts
	1. downward code `{{ ... }}`
	2. upward code. `[[ ... ]]`
- Downward code is infrequently used in .fmt specifications, but, in this case, we need to fiddle with Python's requirement for indented syntax.
- The upward code, creates a string containing 
	- 4 imports statements
	- a *def* function definition which formats strings returned by other parts of the tree and fiddles with Python indentation (`fmt.ind()` and `fmt.outd()` and `fmt.lines()`)
- The generated code (the upward code) hard-codes the parameters to the function with obfuscated names (`p1` and `p2`).  Later parts of the specification attach more meaningful code to these obfuscated names (the rules that handle `parameter` phrases).

As a further example, consider the rule that handles the *for every ...* phrase...
```
Command_foreveryCommand [k1 k2 k3 k4 k5 Name k6 k7 SetSynonym @Rec]
= [[\nfor ${SetSynonym} in glob.glob (f'\{${Name}\}/*.md'):${fmt.ind ()}${fmt.lines (Rec)}${fmt.outd ()}]]
```

- I chose to call the rule `Command_foreveryCommand`.  This corresponds to the `mvmd.ohm` pattern-matching rule `Command` labelled by `-- foreveryCommand`.
- This rule takes 10 parameters
	- 7 constant ("k") strings (like "for", "every", etc.)
	- a parameter that holds the matched sub-match for the *name* part, called `Name`
	- a parameter that holds the matched sub-match for the synonym-part (`=> ...`) called `SetSynonym`
	- a parameter that holds the rest of the sub-matched boxes, called `Rec`.  This parameter corresponds to the `Rec?` pattern in `mvmd.ohm`.  Because it uses the `?` "iteration" operator, I prefix the parameter with the marker `@`[^at].
- The re-formatting specification on the right-hand-side of the `=` creates a string containing a Python "for" method call and plugs in 3 strings returned by other rules (`SetSynonym`, `name`, and, `Rec`).  And, it fiddles with Python-required indentation syntax.

[^at]: The underlying `prep` machinery needs to know how to process each parameter.  Handling "iteration" parameters needs different processing than handling of normal parameters. If you mistakenly leave off the `@` parameter, you get mysterious error messages like `._glue () is not a function`.  If you see this, just fix it and move on, or, if you feel particularly industrious, upgrade the `prep` tool. My own goal was not to produce a robust `prep` tool, but to lift my head off the table and to begin using diagrams for programming.

### 3. The Generated Python Code
[[Appendix - Generated Python Code]]

Note that the re-formatter changes all names into legal Python names, disregarding human-readability, e.g.
```
<from>
```

is re-formatted as
```
LTfromGT
```

The rules for legal names are different depending on which target language is required, for example, names that begin with capital letters are special in PROLOG, but not special in many other languages. And, `<` is a legal name character in Lisp, but not in most other programming languages.

Separate variants of `mvmd.fmt` are needed for each target language[^tl].

[^tl]: To reiterate, I believe that this is only a temporary situation, and, that we will eventually forego the step of transpiling diagrams to intermediate text.
# Using the Transpiled Code

To actually use the script, I added 3 lines of text, specifying the file pathnames in question and calling the generated function.

[[Appendix - Using the Generated Code]]

I could have written rules to create syntax for this kind of usage, but, I had to stop somewhere...  

Exercise for the reader: add syntax that calls the generated code, or, simply edit the diagram, and, re-transpile it to `.das` format.