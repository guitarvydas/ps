need:
- REASons for using Ohm
	- https://guitarvydas.github.io/2021/08/30/Ohm-JS.html
	- [ohm in small steps](https://computingsimplicity.neocities.org/blogs/OhmInSmallSteps.pdf) and https://guitarvydas.github.io/2020/12/09/OhmInSmallSteps.html
	- arithmetic github https://github.com/guitarvydas/arithmetic
	- [PEG cheat sheet](https://computingsimplicity.neocities.org/2021/PEG%20Cheat%20Sheet.pdf)
	- PEG/Ohm https://guitarvydas.github.io/2021/08/30/Ohm-JS.html
	- 

- FP pattern matching
- code formatting suggestions
- appendix using PEG for Ohm-like grammars
	- left recursion?
	- splitting grammar from semantics

- exercise: S/SL ohm
- exercise: TXL ohm
- continuations - across and down
- heal thyself (AKA "eat your own dogfood")- add @ (continuation) operator to ohm syntax
- def vs. ref
- peepholer
- - pattern matching operations vs. capture
- exercise - make prep that returns js objects instead of strings
- exercise add path testing to s/sl
- parsing indentation-based languages, e.g. Python
- parsing markdown
- markdown as a programming language
- glue syntax layer for generation of semantics code
- do all examples as .html using pure Ohm-JS, no prep
- backtracking
- syntax directed
- tree transformation (nested lists are trees)

[*We split mathematics into two broad categories:*
1. notation
2. thinking.
*Note that mathematical notation reduces to simple text editing, i.e. string manipulation.  If it's good enough for mathematicians, it's good enough for us.*]

Other stuff, maybe of interest:

[PEG Cheat Sheet](https://guitarvydas.github.io/2021/04/02/PEG-Cheat-Sheet.html)
[REGEX vs PEG](https://guitarvydas.github.io/2021/03/24/REGEX-vs-PEG.html)
[Racket PEG](https://guitarvydas.github.io/2021/03/19/Racket-PEG.html)
[PEG vs Other Pattern Matchers](https://guitarvydas.github.io/2021/03/17/PEG-vs.-Other-Pattern-Matchers.html)
[PEG](https://guitarvydas.github.io/2020/12/27/PEG.html)
[What If Making A Compiler Was Easy?](https://guitarvydas.github.io/2021/04/26/What-If-Making-A-Compiler-Was-Easy.html)
[Glue tool](https://guitarvydas.github.io/2021/04/11/Glue-Tool.html)

- idiom for balanced parens
- idiom for macros (applySyntactic)
- idiom for right recursion (a(b(c d)))
- idiom for left recursion (((a b) c) d)))
- idiom for matching idents vs. keywords
- idiom for re-using rules (RY instead of DRY), declaration vs. definition
- embedded code
- idiom for identity matching
- mangling
- idiom for math

- balancedParens.ohm + balancedParens.txt
- macros.ohm + macros.txt
- rightRecursion.ohm + rightRecursion.txt
- leftRecursion.ohm + leftRecursion.txt
- ident.ohm + ident1.txt + ident2.txt
- ry.ohm + ry.txt
- nested.ohm + nested1.txt + nested2.txt + nested3.txt

references
- ohm github
- ohm-editor
- ohm math
- abc
- abc glue
- abc wasm
- blog (free version)
- code github
- blog for RY
- 

## leftovers
like regex101
	- ohm-editor is like regex101, but for Ohm (PEG)
regex
separation of concerns
why Ohm is better than PEG
	- separation of concerns
	- left recursion
	- Ohm is a DSL based on PEG idea
why PEG is better than REGEX
	- backtracking
	- call rules
diff -w for automatic regression testing
embedded code can be matched by tokenizer, then passed down the pipeline for further matching
unspoken: this code and `prep` are experimental, hope that someone will volunteer to maintain them

## free version

## leanpub settings
- cover
- classification
- dedication
