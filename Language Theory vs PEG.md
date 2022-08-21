In my vocabulary:

- a Language is a formal specification of a sequence of words
- a Parser is an app that transpiles a Language into executable code (usually a state machine)
- sometimes, there is a wide gap between what can be formally specified and what a Parser can actually parse, example: PEG can parse balanced parentheses, but, LR(k) cannot specify languages that need balanced parentheses
- you can build a Parser by 
1. transpiling from a formal Language spec or 
2. writing an ad-hoc pile of code (say in Haskell, Python, etc.) to pattern-match words or 
3. writing a less-ad-hoc pile of code using a DSL made for the purpose.
- IMVOO (in my very-opinionated opinion), PEG straddles the best of both worlds, PEG formalizes a DSL for writing parsers and can create parsers that LR(k) can't be used for
	- instead of formalizing Languages, PEG formalizes the creation of Parser programs
- background example:
	- bottom up (LR) plus-expression parser: `number + number`
		- a compiler-compiler uses the above spec to generate a state machine which uses some other technology (e.g. REGEX) to recognize `number` things then piece the low-level things into higher-level layers -> if you see `number` followed by `+` followed by `number` conclude that the phrase is a `Plus Expression`
	- TDPL expression parser: 
```
function parsePlusExpresssion () {
    if (see (number)) {
        need ('+');
        need (number);
        return "Plus Expression";
    } else {
        return "Parse Failed";
    }
}
```

Note that `+` and the 2nd `number` is parsed ONLY if we /think/ that we are parsing a PlusExpression (want-to / expect-to see a PlusExpression).  We might parse the same digits as a `float` instead of a `number` if we /think/ that we are parsing some other kind of phrase (contrived example).

TDPL doesn't pattern-match the digits and conclude that they form a `number`, unless asked to, whereas bottom-up *always* pattern-matches the digits first, concluding that they form a `number`, before passing the match upwards to the state machine.

Language theory defines classes of languages, e.g. LR(k), LL(k), etc.  The theory defines the language.  A Parser, otoh, might parse phrases that don't fit Language theory. IMVOO, the difference is the choice between theoretical easiness and UX.  I don't know of a Language Theory that allows matched parens nor a Language Theory that describes spreadsheet GUIs, etc.

Instead of formalizing Languages, PEG formalizes the creation of Parser programs.

