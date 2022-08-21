# Unicode Brackets
I chose to use Unicode bracket characters in my syntax.  The choice is arbitrary and can be changed.

# Verbatim Grammar
```
verbatim {
main =
    | other* "⟪" main "⟫" main? -- bracketed
    | other+ -- pre
other = ~"⟪" ~ "⟫" any
}
```
# Verbatim Transpiler - Formatting
```
main_bracketed [@other lb main1 rb @main2] = [[${other}${main1}${main2}]]
main_pre [@x] = [[${x}]]
other [c] = [[${c}]]
```

The `verbatim.fmt` rule `main_bracketed` corresponds to the first branch of the grammar rule `main`, i.e.
```
    | other* "⟪" main  "⟫" main? -- bracketed
```

The above format rule `main_bracketed` has five (5) parameters that hold the captured sub-matches
1. `@other`
2. `lb`
3. `main1`
4. `rb`
5. `@main2`

The names `lb` and `rb` are meant to be reminiscent of `left bracket` and `right bracket`, respectively.

The first parameter `@other` is prefixed with `@` to signify that it corresponds to a repetition grammar sub-match, `other*`. TODO: Currently, the programmer must specify `@` explicitly.  This *could* be automated to glean the corresponence with `other*` directly from the grammar.  As it stands, the programmer is expected to write perfect formatting code and is presented with mysterious commas (`,`) when the format is specified incorrectly.  Cleanup and tightening is expected to be done later.

Likewise, the fifth parameter `@main2` corresponds to another "repetition" grammar sub-match `main?`.  (Ohm-JS defines three (3) repetition operators `+`/`*`/`?`.  See the Ohm-JS documentation.)

