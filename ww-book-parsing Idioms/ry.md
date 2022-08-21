# RY (Repeat Yourself)

In programming, one is usually taught the DRY principle - Don't Repeat Yourself.

This principle relates to code that is written manually.

In the case of parser generators, like Ohm-JS, the machine creates code for us and we can use RY (Repeat Yourself) vs. DRY to our advantage.

In this example, it seems that the `W1` and `W2` rules are redundant - they simply call the `word` rule.

Including redundant rules can benefit later stages of the compiler/transpiler.  Later, we might want to know the `history` of the matches.  For example, the `Word` (note the capitalization - this rule is different from the `word` rule), rule first matches `W1` then zero-or-more `W2` rules.  The transpiler might wish to emit different code for the `W1` rule vs. the `W2` rule, say, because the first time it sees `W1` it *declares* the word and all subsequent uses, `W2`, are *references* to the previously-declared word.  In this example, `W1` allows any word to be used, where `W2` checks that the word has already appeared and have been declared by the programmer.  This kind of checking is common in modern programming languages and prevents typos from inadvertantly creating new variables.

The parser generator does what it is told to do and faithfully builds RY for us.

Note that the machine generates RY code for us and we are obeying the DRY principle by doing the real pattern-matching work in the common rule (`word`).

Note that RY is related to the concepts of *pattern-matching* in functional programming (see appropriate section).

## RY Pattern
```
repeatyourself {
Main = Word*
Word = W1 W2*
W1 = word
W2 = word
word = letter+
}
```

## RY Pattern In Action

![[ry.png]]