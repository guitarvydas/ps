## Macros

Using Ohm parsers in a pipeline, allows you to pre-process macros.

### Macro Pattern
```
macro {
lotsofstuff = stuff*
stuff
  = applySyntactic<Macro>
  | macroName
  | anychar
  
Macro
  = macroName

macroName = "fxyz"

anychar = ~macroName any
}
```

Here, we use a feature specific to Ohm-JS, the `applySyntactic` construct.

#### Lexical vs. Syntactic Rules

Ohm-JS differentiates between `lexical` and `syntactic` rules by the case of the first letter in the name of the rule.  Upper case means that the rule is `syntactic`, lower case means that the rule is `lexical`.

A `lexical` rule works like standard PEG.  The rule needs to include consideration for all whitespace characters.

A `syntactic` rule in Ohm-JS skips over whitespace, allowing the programmer to write less detailed code in rules.

Here, we want to use `lexical` matching for most of the stuff, but, drop into `syntactic` mode to define the macros.

Input that is not part of a macro should remain untouched, i.e. treated in a `lexical` manner.  I.E. we want to leave even whitespace alone unless we hit a macro.

Switching between Ohm-JS's `lexical` and `syntactic` modes lets us have the best of both worlds - we can gloss over input characters until we match a macro.  The macro is written in less-detailed mode - `syntactic`.

The distinction between `lexical` and `syntactic` modes is a feature of Ohm-JS, and, is not found in other PEG libraries.

The ability to write macros as `syntactic` rules becomes important when there are a large number of macros.  The above pattern may look cumbersome, but that is because it deals with only a single macro for this simplified example.

Note that it is possible to use batch-editors like `sed` and `REGEX` features of languages to perform macro replacement.  We show the above pattern in Ohm-JS to show what can be accomplished and let the software architect decide which technology to use for specific solutions.

### Macro Pattern In Action
![[macros.png]]