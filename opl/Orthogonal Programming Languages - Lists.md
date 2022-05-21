Lists have three (3) operations:

- first ()
- rest ()
- all-of ()

A possible UX-oriented *skin* for these might be

- `Z:` for first (Z)
- `:Z` for rest (Z)
- `Z` for all-of (Z)

Which is the most common use-case?

- first(Z), or,
- all-of(Z)?

We would want to pick the most economical syntax for the most-common use-case.  For example, maybe we will want

- `Z` for first (Z)
- `:Z` for rest (Z)
- `Z*` for all-of (Z)

in some cases, but, not in other cases.

Syntax is cheap, we can afford to have more than one syntax *skin* for each use-case.

It is *not* good-enough to just make sure that all bases are covered, we must *design* a UX that people will find useful.

At the lowest, most rigorous level, we can simply represent everything as function calls:

- `first(Z)` for first (Z)
- `rest(Z)` for rest (Z)
- `Z` for all-of (Z)

or, even more rigorously:

- `first(Z)` for first (Z)
- `rest(Z)` for rest (Z)
- `identity(Z)` for all-of (Z)

but, from a UX perspective, we want more-economical choices, e.g.

- `Z` for first (Z)
- `:Z` for rest (Z)
- `Z*` for all-of (Z)

or

- `Z:` for first (Z)
- `:Z` for rest (Z)
- `Z` for all-of (Z)

or 

`...`

Ohm-JS (and PEG) make building multiple *skins* easy.  We are no longer bound to only one choice of syntax *skin*.

We have a more-or-less economical *skin* for randomly accessing arrays, e.g.

- `A[37]`
- `A[0]`

We need a better, "more economical", *skin* for accessing lists.  JS and Python beat around this bush, but they lock you into exactly one choice.

Likewise, JS suggests two *skins* (but, only two) for accessing maps:
- `Z.key`
- `Z["key"]`

Rebol suggests a different kind of *skin*

- `Z/key`

Syntax is a UX issue, that shouldn't be left up to theoreticians to design...

Lambda calculus is the theoreticians' wet-dream, but, lambda calculus is a horrible UX for just about anyone else[^rice].

[^rice]: If I wanted to decompose my program into 2,000 pieces of something, I'd boil a pot of [rice](https://www.facebook.com/becomedyuk/videos/i-like-rice-rice-is-great-when-youre-hungry-and-you-want-2000-of-something/362130138111477/).

Using `Z` to represent `all-of(Z)` (or `identity(Z)`) pre-supposes that `Z` is an Object and that we must apply *method*s to that object.  UX-wise, we might want to forget about the internal structure of `Z` and use the results of applying *methods* to those objects without knowing how the underlying system implements them.