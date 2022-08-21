The `.tbx` (toolbox) language allows programmers to use names that have embedded whitespace.

Language designers were constrained to use characters in the ASCII alphabet and did not want to create programming languages that quoted strings and quoted names.

Using characters from the Unicode alphabet allows more freedom in choosing brackets for quoting names.

Language syntax comes in two flavors:
1. human readable syntax - UX/IDE for programming by programming
2. machine-readable syntax - syntax designed to allow manipulation programs by machines (computers) whic downplay the aspect of human-readability.

Language designers have tended to target human-readability (1), instead of machine readability (2).

It is simple to create a syntax for machine-readability (2), although the result may look cumbersome to human programmers.

Language design for machine-readability requires that every semantic construct have a machine-parsable syntax.

Language design for human-readability is a *skin* over machine-readable syntax that elides certain details and removes syntactic noise, from a human-readable UX/IDE perspective.

I suggest bracketing all names at the machine-readable syntax level.  When such syntax is presented as a UX/IDE to human programmers, we can use devices like html *text areas* as names (possibly containing embedded whitespace) and convert the contents of such areas to bracketd machine-readable syntax.

For example

![[names.png]]

might be converted to

```
❲name containing whitespace❳
```
In this particular case, `drawio` displays the string "name containing whitespace" with a breaking space after the 2nd word - the breaking space is saved as a non-breaking space (nbsp) in the bracketing process.

# Grammar For Compound Identifiers
```
name {
main =
    | other* "❲" main "❳" main? -- bracketed
    | other+ -- pre
other = ~"❲" ~"❳" any
}
```
I've used Ohm-JS *lexical* rules (lower-case names) to stop Ohm-JS from removing *space* characters.  The grammar parses all characters, except the brackets, using the "other" rule.

# Format Specification for COnverting Compound Identifiers to JavaScript
```
main_bracketed [@other lb main1 rb @main2] = [[${other}${fmt.unspace (main1)}${main2}]]
main_pre [@x] = [[${x}]]
other [c] = [[${c}]]
```

## Name-fmt.js
In this case, spaces "` `" are converted to underscores "`_`" for use as Javascript identifiers.

The conversion is performed by the `fmt.unspace (...)` function in `name-fmt.js` file used as support in the Makefile invocation of `prep`.

```
exports.unspace = function (s) {
    return s.replace (/ /g, '_');
}
```