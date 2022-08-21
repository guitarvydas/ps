# Pattern Matching Lines of Text in Ohm-JS

```
Article {
Article = Title TagDefinitions #text
Title = lineContent nl
TagDefinitions = tagDef+ nl
tagDef = "#" name
text = any*
lineContent = (~nl any)*
name = letter alnum*
nl = "\n"
spaces := (~nl space)*
}
```

```
Testing
#test #fish
Once upon a time, we were there.
Ż```

An Article consists of 3 parts:
1. Title
2. Tag Definitions
3. text

We want to skip spaces in (1) and (2), but we want to keep every character in (3).

This means that (1) and (2) are written as Syntactic rules (upper case letter as first letter of the rule name)

(3) is written as a lexical rule (lower case name)

The magic sauce is the last line[^pd]
```
spaces := (~nl space)*
```
which says that Ohm-JS should not consider an `nl` (newline) to be a `space`.

[^pd]: [Patrick Dubroy in OhmLand Discord](https://discord.com/channels/779282197152661525/779286678266576906/938514980234489947)

N.B. this grammar could be shrunk further to have fewer rules, but, when we get to writing semantics, we will want the parser to tell us the history of the parse.  An easy way to do this is to give unique names to the sub-rules.  In fact, I have found it helpful to write *noop* rules that do nothing but invoke another rule and to allow more than one *noop* to point to the same base rule.  This appears "inefficient" at the grammar level, but avoids if-then-else code in the semantics.

For example, one might wish to differentiate between *name* definitions and references...
```
NameDefinition = name
NameReference = name
name = ...
```
After a successful parse, NameDefinition and NameReference will, both, contain matches for what looks like the same thing (a name), but, the parser will call different semantic rules for each version.  If we see a name match in NameDefinition, we want to check that the name has not been used and we want to install it into a lookup table.  When we see a NameReference, though, we want to check that the name has been defined (i.e. is not a typo) and slurp information out of the lookup table about that name.

# Screenshot
![[pm lines.png]]