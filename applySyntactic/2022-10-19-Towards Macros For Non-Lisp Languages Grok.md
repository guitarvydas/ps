# Towards Macros for non-Lisp Languages - 1 of 2 - Grok
Paul Tarvydas

---

# Synopsis
Running example = snippet of "Ghost Stars" game script

The game script is ultimately transpiled into JSON

In this talk, I point out certain software tools that make parsing this game script easy. 

---
# Overview
1. Show input game script
2. Show grammar to grok (parse) the script

---
# Disclaimer
wart: current version does not dive deeper and does not recursively unwind macros contained in operands
- easier to explain and comprehend
- maybe not needed in practice?
- left as exercise to future thinkers
- 80% rule - leave out complexity - simplicity = "lack of nuance"
 
---
# Overview Continued
- *Ohm-JS* used to build parser
- *fab* used to build code fabricator

---
# Overview - 2 Parts
This video is snipped into 2 parts
1. general idea
2. lots of detail

(1) General idea might be enough.  Feel free to skip section (2).

(1) is (2), but, many slides have been deleted.

---
# Ohm-JS Features That Makes Macro-Processing Easy
- applySyntactic< ... >

---
# Game Script
- part of an app which is a dungeon-like game called Ghost Stars
- on itch.io https://oofoe.itch.io/ghost-stars
- game jam
- game unfinished
	- significant part of script was written
	- visuals

---

# Game Script Snippet
```
❖ Show prolog_bg at 0x-550. Move prolog_bg to 0x0
over 300 frames. Wait 150 frames.

		    CHEL:NA
	  The last time I saw
	  her... She was smiling. As
	  if she had some secret that
	  she couldn't wait to tell me.
	  
	  And then, in a sudden wash of
	  red, she was gone.
	  
	  Gone as if she had never stood
	  beneath the uncaring stars.

❖ Fade to black over 43 frames. Jump INTRO.

```

---
# Game Script Elements
- 6 phrases
	- "Show" ...
	- "Move" ...
	- "Wait" ...
	- "Say" ...
	- "Fade to black" ...
	- "Jump" ...

# Grokking the Game Script - Overview
1. use Ohm-JS and Ohm-Editor https://ohmjs.org
2. main rule tries to apply macro(s) 1 or more times
3. macro rule tries to match the phrases in order
4. if nothing matches, falls into catch-all *any* that does not perform any action

# Main Rule
```
text = macro+
```
- match "macro" 1 or more times
- I chose "text" as the name of this first rule.
- Name doesn't matter.

---
# ApplySyntactic
- the *secret sauce* for macro processing
- allows lower-case rule to invoke upper-case rule (see Rules for Matching)
- allows programmer to specify phrases in convenient format
- non-matches are untouched

---
# Whitespace Skipping
- rule "ShowPhrase" begins with upper-case letter, hence, skips spaces during matching
- rule "lex_spoken" begins with lower-case letter, hence, keeps spaces intact
	- we want to leave formatting alone for text that is supposed to appear "as-is" in the game

--- 
# Ohm-JS Rules for Matching
- each rule has a name
- if name begins with lower-case letter, then standard PEG behaviour
- if name begins with upper-case letter, then match engine skips whitespace (eg. spaces and newlines)
- double-quoted string matches exact string, e.g. "Show" (case sensitive)
- unadorned identifier -> call sub-rule for sub-matching
- if match is successful, engine invokes *semantics* code (herein called *fabricate.fmt*)

---
# Ohm-JS Syntax At A Glance
- a *grammar* is a pattern-matching specification, similar to BNF
- *rule-name = pattern* - case of *rule-name* matters
- `?` means *optional*
- `*` means 0 or more
- `+` mean 1 or more
- `"..."` matches characters inside string, verbatim
- `~` means NOT - doesn't consume any characters, but, used to block (guard) patterns
- *name* means match sub-rule *name*
- `|` means alternative match branch
- `--` name of branch (used in semantics code)
- ... more in Ohm-JS documentation
---
# Ohm-JS vs. PEG vs. Language Theory vs. REGEXP
- Ohm is better than PEG
- Ohm is better than Language Theory
- Ohm is better than REGEXP

(see longer video for details)

---
# Ohm-JS vs. PEG
- PEG means "parsing expression grammar"
- Ohm-JS is a language derived from PEG

---
# Ohm-JS vs. PEG - Whitespace
- PEG requires all whitespace matching to be explicitly specified
- Ohm-JS can implicitly skip whitespace
- Ohm-JS grammars are "cleaner" than PEG grammars
	- easier for humans to read and understand
	- not cluttered with niggly details

---
# Ohm-JS vs. PEG - Semantics
- "semantics" ≣ what to do with the captured matches
- Ohm-JS separates grammar from semantics
- most PEG libraries attempt mix semantics processing in with the grammar specification
- Ohm-JS grammar split from semantics is easier for humans to comprehend
	- computer does more work in sorting out and joining the two specifications
	- but, who cares?  Machines are supposed to work *for* us, we shouldn't have to expend brain power to appease computers
	
---
# PEG vs. Language Theory
- Language Theory, e.g. YACC, LR(k), et al, is a set of rules on how programming languages can be defined
	- 
- PEG, OTOH, is a set of rules on how to define a *parser*
	- PEG grammars look like Language Theory grammars
- PEG is better than Language Theory
- PEG can parse nesting

---
# PEG vs. REGEXP
- PEG is better than REGEXP
- Ohm-JS (PEG) programmer can create rules as subroutines
- REGEXP syntax does not allow subroutines
	- programmers need to find workarounds ("epicycles")
	- 
---
# What's the Big Deal?
- PEG can parse matching brackets
- Language Theory cannot parse matching brackets
- subtle difference - huge implications

---
# What's the Big Deal? Layers
- PEG parsers can be built in layers
- parser can parse a section of code, then pass it to a sub-parser for further refinement and more detailed semantics

---
# What's the Big Deal? Nesting
- PEG can parse nested strings, nested brace-bracketed code, etc.
- PEG can match `{ ... }` where `...` might contain more `{ ... }`
	- (recursive nesting)
- YACC can't specify `{ ... { ... } ... }` where `...` is of unknown depth

---
# Rules In Grammar.Ohm - Details
# Show Phrase Rule
```
macro = 
  | applySyntactic<ShowPhrase>
...
ShowPhrase = "Show" filename "at" Coordinate
...
```

- lower-case rule "macro" is allowed to call upper-case rule "ShowPhrase"
- "ShowPhrase" written in convenient style - skips whitespace
- sub-rules: *filename* and *Coordinate*
---

# Other Phrases
- *MovePhrase*, *WaitPhrase*, *FadeToBlackPhrase*, *JumpPhrase* are all similar to *ShowPhrase* 
- lex_spoken Rule is different (see below)

---
# lex_spoken Rule
`lex_spoken = speaker spoken`
- lower case -> doesn't skip spaces
- matches *speaker* then *spoken* without skipping spaces
	- in particular, *spoken* text is unaltered, formatting preserved
- matches *name* then *spoken* "as-is" (no space skipping)

---
# period Rule
- matches "."
- Not useful in this grammar, but, included to make a point in discussion of semantics.

---
# separator Rule
`separator = "❖"`

- uses Unicode character as a "left-handle"
- not needed - Ohm-JS/PEG is powerful enough to not need left-handles
	- the grammar as written, assumes that *phrases* are *always* macros and that the *spoken* portion can never contain text that matches one of the phrases
- useful during early debug and "eyeballing" of matching actions

- we need some way of detecting the end of a *spoken* portion from the rest
	- if the *spoken* portion is allowed to contain text that matches one of the phrases, then a *separator* is required
	- the C language uses ';' as a statement separator, because early parsers did not backtrack, 
	- Ohm-JS (PEG) does backtrack and resolves text ambiguity by treating possible matches in order
	- Language Theory, e.g. LR(k), does not require backtracking, but, needs separators to avoid ambiguity
	- backtrcking appeared in Early's parser technology", but, was deemed to be too inefficient
	- backtracking was explored in PROLOG (and SNOBOL and ICON, etc.)
---
# nls Rule
```
nls = nl+
nl = "\n"
```
- plural naming convention (not necessary, but used for human readability)
- matches 1 or more newline
---
# any
- matches one character
- often used in conjuction with NOT (~)
- order of alternatives matters, *any* appears last as the "catch-all"

---
# speaker Rule
```
...
speaker = speakerSpaces name
speakerSpaces = 
  | "                    " -- spaces20
  | tab tab "    "         -- tabtabspaces4
...
```
- matches 20 spaces followed by *name*, or,
- matches 2 tabs followed by 4 spaces followed by *name*

---
# spoken Rule
```
spoken = spokenchar+
spokenchar = ~separator any
```
- intent is to match "as-is" a run of characters
- need *separator* to indicate where text chunk ends
	- there are probably other ways to do this, this choice was made for simplicity of explanation
- ~ means "Don't match this", e.g. *spokenchar* is any character except a *separator*
	- ~ does not consume any characters itself, but guards the alternative
	- without the "~separator" guard, *any* would match *every* character up to the end of the file
---
# tab Rule
`tab = "\t"`

- lower-case - doesn't skip whitespace
- important: top-most rule is lower-case, hence, spaces are preserved when parser reaches here
- hard-coded escaped character (see Ohm-JS Syntax documentation)

---
# name Rule
```
name = nameFirst nameRest*
nameFirst = letter
nameRest = "_" | ":" | digit | nameFirst
```
- a name is (1) a letter, followed by (2) 0 or more letters/digits/underscores/colons
- lower case, therefore whitespaces not skipped

---
# Coordinate Rule
`Coordinate = number "x" number`
- matches *number*, any-number-of-spaces, letter "x", any-number-of-spaces, *number*
- begins with upper-case, skips spaces between first *number* and "x" and between "x" and second *number*
- does not skip spaces *after* the end of the rule, i.e. after second number
- called by "ShowPhrase" and "MovePhrase" which skip leading whitespace before Coordinate

---
# TimeSpan Rule
`TimeSpan = "over" number "frames"`

- matches one number bookended by syntactic sugar
- "over" and "frames" are syntactic sugar
	- not strictly needed by the engine
	- make the script more human-readable
---
# number Rule
`number = "-"? digit+`
- matches optional "-", then 1 or more digits

---

# filename Rule
`filename = name`

- "redundant" use of rule *name*
- allows programmer to say *what* needs to be matched, without regard to *how*
- let the engine do the work, grammar is "more clear" to human readers
	- machine doesn't care about redundancy
	- trade-off: CPU cycles vs. human readability
	- engine runs only during development, we can afford to burn CPU cycles here

# ChapterName Rule
- similar to filename Rule
- *name* never includes whitespace, so capitalization of *ChapterName* vs. *filename* doesn't matter
---
# Github
https://github.com/guitarvydas/fabghoststars

This talk referred to *grammar.ohm*.

---
# Related
See, also, "2022-10-19-Towards Macros For Non-Lisp Languages Fabricate JSON" for 2 of 2 - how to transpile the game script into JSON, once Grokked.