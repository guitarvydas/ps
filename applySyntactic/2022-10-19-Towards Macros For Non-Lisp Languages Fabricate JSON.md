# Towards Macros for non-Lisp Languages - 2 of 2 - Fabricate
## Transpile Game Script To JSON After Grokking The Script
Paul Tarvydas

---

# Synopsis
Running example = snippet of "Ghost Stars" game script

The game script is ultimately transpiled into JSON

In this talk, I describe software tools that follow-on after the initial *Grok* phase and fabricate JSON.

---
# Overview
Once the game script has been grokked, the captured matches are passed to the Fabricator to "do something" with the captured matches.

In this case "do something" means to fabricate .JSON code from the information.

The script, the grok phase and the fabrication phase
- simplistic (on purpose, for easier explanation)
- only hint at how this might be done for real production apps.

---
# Rules For Writing A Fabrication (.fmt) Specification
- each *.fmt* rule must correspond 1:1 with a rule of the same name in the grammar (*.ohm*)
- fab rule: 
	1. *name*
	2. *parameters*
	3. *string builder*

---
# Fabrication Syntax (.fmt)
- parameters must include `+`/`*`/`?` suffix if corresponding grok match is suffixed
- parameters are enclosed in square brackets `[...]`
- *string builder* enclosed in begin/end quotes `‛` and `’`, respectively
- string builder string can contain only 2 kinds of things:
	1. characters "as is"
	2. parameter evaluations of the form `«...»`
		- parameter in eval-quotes`«...»` must correspond *exactly* with the name of one of the parameters
		- evaluation contents can contain any JavaScript expression or function call or variable name

N.B. the same parameter can appear more than once in an evaluation.

N.B. parameter evaluations need not be in the same order as declared in the parameter list.

Parameter names are arbitrary, but, human readability is enhanced by using names that appear in the *.ohm* grammar.

"As is" characters can use JavaScript character-escapes.  For example, to include a newline, you can:
1. insert a RETURN - breaking the string onto the line, or,
2. use `\n`.

---
# Fabrication Code (Rules)
```
GhostStars {
 ...
}
```
---
## Text Rule
```
text [macro+] = ‛\n{ onenter:\n[«macro»true]\n}\n’
```
- This is the firstmost rule 
- it returns the final, single string, based on string returned by child rules, e.g. *macro*

The corresponding grammar rule is:
```
text = macro+
```

---
## Macro Rule
```
macro [x] = ‛«x»’
```
The corresponding grammar rule is:

```

macro =
  | applySyntactic<ShowPhrase>
  | applySyntactic<MovePhrase>
  | applySyntactic<WaitPhrase>
  | applySyntactic<FadeToBlackPhrase>
  | applySyntactic<JumpPhrase>
  | lex_spoken
  | period
  | separator
  | nls
  | any
```

The grammar rule has 10 alternate branches.  Each branch consists of exactly one match.

After a successful match, the grammar rule *macro* will match only one branch and will invoke the fabrication rule *macro* with a parameter containing that match.

The fabrication rule *macro* uses the parameter name `x` to represent the single match.

The fabrication rule *macro* creates a string containing that single match and "returns" the string.

The string building syntax `‛«x»’` instructs the fabrication engine to evaluate the parameter `x` and to insert it into the resulting string.  There are no other characters inserted into the string.  The resulting string consists only of the contents of the match capture parameter `x`.

---
## Show Phrase Rule
```  
ShowPhrase [kShow filename kat Coordinate] = ‛\n["image","«filename»",«Coordinate»],’
```

The corresponding grammar rule is:
```
ShowPhrase = "Show" filename "at" Coordinate
```
By arbitrary convention, I use the letter `k` as a prefix for parameters that correspond to verbatim string matches ("konstant").

The *showPhrase* grammar rule consists of 4 sub-matches.  After a successful match, these 4 sub-matches are associated with the 4 parameters of the *showPhrase* fabrication rule.

The fabrication rule discards the 2 constants *kShow* and *kat*, then builds a string containing a newline, an open square bracket, the characters `"image","`, the value of the *filename* match capture parameter (a string), the characters `",`, the value of the *Coordinate* match capture parameter (a string) and the characters `],`.

### Example
For example, the input string
```
Show prolog_bg at 0x-550
```
matches the grammar rule *ShowPhrase* and calls the fabrication rule *ShowPhrase* with the parameters:
- kShow ≣Show
- filename ≣ prolog_bg
- kat ≣ at
- Coordinate ≣ 0,-550

These parameters cause the *ShowPhrase* fabrication rule to build and return the string
```
\n["image","prolog_bg",0,-550],
```

Note that the *Coordinate* fabrication rule returns the string `0,-550` which is a rewrite ("fabrication") of the input `0x-550`.  The details of the fabrication can be determined by reading the fabrication rule *Coordinate*, below.

---
## Other Phrase Rules
```
MovePhrase [kMove filename kto Coordinate TimeSpan] = ‛\n["moveto","«filename»",«Coordinate»,«TimeSpan»,"ease in"],’
WaitPhrase [kWait number kframes] = ‛\n["wait",«number»],’
FadeToBlackPhrase [kFade kto kblack TimeSpan] = ‛\n["fadeout",«TimeSpan»],’
JumpPhrase [kJump ChapterName] = ‛\n["jump","«ChapterName»"],’
```

The other .*..Phrase* fabrication rules are similar to the *ShowPhrase* fabrication rule, and, are not treated in more depth here.

---

## lex_spoken Rule
```
lex_spoken [speaker spoken] = ‛\n["say","«speaker»«spoken»"],’
```
The *lex_spoken* rule creates a string that looks like a JSON clause containing the string `"say"` followed by the the name of the *speaker*, followed by the unaltered string containing the formatted text of the sentences spoken by the game character.

The corresponding grammar rule is:
```
```
### Example
For this example, I pare down the actual code snippet to:
```
		    CHEL:NA
	  The blah blah blah
```
In this case, the *lex_spoken* rule would build the string
```
["say","                    CHEL:NA
  The blah blah blah
"],
```

The whitespace before the speaker's name is preserved by the *speakerSpaces* rule.  In general the actual format depends on the requirements of problem, the game engine in this case.  From the fabrication perspective, it might be equally valid to remove the whitespace prefix before the speaker's name, but, this was not desired in this particular solution.

---
## speaker Rules
```
speaker [speakerSpaces name] = ‛«speakerSpaces»«name»’
speakerSpaces_spaces20 [spaces] = ‛                    ’
speakerSpaces_tabtabspaces4 [tab1 tab2 spaces4] = ‛                    ’
```

---
## Coordinate Rule
```
Coordinate [number1 kx number2] = ‛«number1»,«number2»’
```
---
## TimeSpan Rule
```
TimeSpan [kover number kframes] = ‛«number»’
```
---
## ChapterName Rule
```
ChapterName [name] = ‛«name»’
```
---
## filename Rule
```
filename [name] = ‛«name»’
```
---
## spoken Rule
```
spoken [cs+] = ‛«cs»’
spokenchar [c] = ‛«c»’
```

---
## name Rule
```
name [nameFirst nameRest*] = ‛«nameFirst»«nameRest»’
nameFirst [letter] = ‛«letter»’
nameRest [c] = ‛«c»’
```
---

## number Rule
```
number [kminus? digit+] = ‛«kminus»«digit»’
```
---
## NewLines Rules
```
nls [cs+] = ‛’
nl [c] = ‛«c»’
```
---
## tab Rule
```
tab [c] = ‛«c»’
```
---
## period Rule
```
period [c] = ‛’
```
---
## separator Rule
```
separator [c] = ‛’
```

---
# Github
https://github.com/guitarvydas/fabghoststars

This talk refers to *fabricate.fmt*.

---
# Related
See, also, "2022-10-19-Towards Macros For Non-Lisp Languages Grok" for 1 of 2 - how to Grok (parse) the game script.