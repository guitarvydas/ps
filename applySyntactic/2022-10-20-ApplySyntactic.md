# Overview: applySyntactic

For completeness, here are some of my musings about *applySyntactic*.

I believe that *applySyntactic* opens up a new way of thinking about parsing, hitherto available only to Lisp programmers.

- *applySyntactic* allows writing some rules in a convenient manner while "ignoring" the rest
- *applySyntactic* makes it easier to write source-to-source transpilers
- *applySyntactic* makes it possible to write *macros* in character-based languages, providing lisp-like abilities to character-based languages

# Details: Ohm-JS applySyntactic
- Ohm-JS differentiates between PEG-like rules and space-skipping rules
- if a rule name begins with a lower-case letter, it is a PEG-like rule and does not skip spaces
	- called a *lexical rule*
- if a rule name begins with a capital letter, the rule uses space-skipping
	- called a *syntactic rule*
	- i.e. `R = A B` means that...
		- spaces are skipped between `A` and `B`
		- spaces are not skipped *inside* of `A` nor `B` 
		- see below
- Ohm-JS checks that lexical rules cannot call syntactic rules
	- but, `applySyntactic<...>` allows this check to be overridden
		- like a C *cast*, except for text pattern-matching

Implications:
1. it is possible to mix and match rules without space-skipping with rules that perform space-skipping
	- it is possible to write some rules in a more-conventient *syntactic* form, while leaving other rules in *lexical* form
2. macros can be written in "convenient" form, while whitespace is preserved elsewhere
3. therefore, a macro-processor can be written that finds certain phrases in the input while "ignoring" the rest
4. therefore, there is no need to specify every detail in a target language
	- a programmer needs to specify only the "macros" and can ignore the rest
	- whereas parsers based on language theory require that the full language be specified 
		- a lot of work
		- not conducive to "quickie" search-and-replace apps
5. mixed with Ohm-JS's/PEG's ability to find matching brackets
	- possible to write MVP search-and-replace apps that find-and-replace only certain phrases
	- instead of needing to specify the whole target language
- example
	- pattern-match C code and search for idioms
	- replace idioms with phrases that are more human-readable
	- re-replace phrases with C code that is more machine-readable
	- "round trip" - rewrite C code to be more human-readable, then rewrite human-readable code to be more optimized C code
	- similar to low-level techniques like RTL (Fraser-Davidson, gcc) and OCG (Cordy, Orthogonal Code Generation) and Lisp-ish macros, but closes the loop ("round trip") between human-readable form and machine-readable form

---

# R = A B
```
test {
R = A B
A = a
a = letter space letter
B = b
b = digit space digit
}
```
text
```
x y 3 4
```
![[R = A B Screen Shot 2022-10-21 at 11.19.03 PM.png]]
