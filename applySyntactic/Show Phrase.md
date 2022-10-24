# ApplySyntactic Show Phrase Grammar

![[ohm editor ShowPhrase.png]]
The grammar REPL - called Ohm-Editor - has 4 main windows
1. top left - the grammar - the pattern-matching specification
2. top right - example input text, multiple examples are allowed, but, only one is shown
3. the middle row of characters, spaced to show their correspondence with the parse tree
4. the bottom window - the parse tree, formally called the CST (Concrete Syntax Tree) which shows how the input (window 2) matches the grammar (window 1)
	- the parse tree is gray when the matching is successful
	- the parse tree contains red nodes when matching is unsuccessful
		- the red nodes can be expanded, by clicking on them, to show what what the parse engine found
		

Look at the grammar rule "ShowPhrase".  About half-way down in the grammar window. 

`ShowPhrase = "Show" filename "at" Coordinate "."`

The *ShowPhrase* rule needs 5 sub-matches to succeed.
1. The literal string *Show* (with a capital S)
2. A sub-match specified by the rule *filename*
3. The literal string *at*
4. A sub-match specified by the rule *Coordinate* (capitalized)
5. The literal string containing just a period.


```
ShowPhrase = "Show" filename "at" Coordinate "."
             1      2        3    4          5
```

The *ShowPhrase* rule doesn't specify whitespace matches.  PEG-based parsers usually require such detail, but, the Ohm matching engine performs automatic whitespace skipping when a  rule name begins with a capital letter.

Now, looking at the *text* rule (lower-case first letter), we see 2 legs.  

```
text =
  | applySyntactic<Macro> -- macro
  | any                   -- ignore

```

Each leg is tagged using "--" and a name.  Such tags are most useful in the *fabrication* (AKA *semantics*) processing portion of the final app.  Tags, though, are checked in the grammar compilation phase.  Each alternative leg of a rule must have *exactly* the same number of sub-matches, or each leg must have a tag.

In Ohm, rule legs are tried in order. In this example, the *text* rule
1. first, tries to match the first leg *macro*
2. if that fails, the rule tries to match the second leg *ignore*.

Ohm checks that lexical rules (lower-case first letter) do not call syntactic rules (capitalized).  The Ohm grammar syntax *applySyntactic<...>* overrides this check.  The point of doing this is that the programmer is allowed to switch from a PEG-style parser specification, to the more convenient Ohm-style space-skipping specification.  This seemingly subtle difference allows programmers to write macros in a convenient way while preserving the format of any input that doesn't look like a macro.  This subtle difference makes it imaginable to write transpilers in *layers* instead of trying to specify *everything* in one, big, flat specification.

In the end, the top *text* rule examines each input character one at a time.  If a character looks like the beginning of a macro, then the succeeding characters are matched against the macro spec.  If the character doesn't look like the beginning of a macro, or, if the macro match fails, the *text* rule simply accepts the character "as is" without space-skipping.  In this example, the 2nd leg called *ignore* is the "as is" catch-all.  The name *ignore* has no special meaning to the parse engine.  The name is used  later in the fabricator engine.  The fabricator specifies one fabrication rule for each grammar leg.  In this case the *text* rule needs 2 fabricator rules, *text_macro* and *text_ignore*.  The fabricator creates different strings depending on whether the input matched the "*-- macro*" tag or the "*-- ignore*" tag.

# Apply Syntactic Show Phrase Parsing Explorer
We switch, now, to the *parsing explorer* tool.

The first yellow window contains the input source.

The second yellow window contains the grammar.

The third yellow window contains the *fabrication specification*.

The fourth white window contains the output after matching and fabrication.

The first and second windows of *parsing explorer* correspond to windows in Ohm-Editor.  The *src* window corresponds to the *examples* window of Ohm-Editor and the grammar window (second in *parsing explorer*) corresponds to the grammar window of Ohm-Editor.  The third and fourth windows do not appear in Ohm-Editor.  These windows only appear in the *parsing explorer*.

![[parsing explorer ShowPhrase Screen Shot 2022-10-23 at 12.06.00 AM.png]]
