Data described by Object.

Syntax wraps syntactic sugare around Objects.

For example

instead of `new CollectionObject (A, B, C)`

we write `[A B C]`

and, instead of

`Z.first ()`

we write

`car(Z)` or `first(Z)` or `Z[1]` or `Z.1` or `Z#1` or `Z[Head] <- Z[Head|Tail]`...

A, B, C are Objects. 

- We can have one Object, or,
- We can have a List of Objects

Internally, we always have a list of Objects and one Object is just `[A]` instead of `A`, and,

internally we have 
- `new List (A)` for one Object, and,
- `new List (A, B, C)` for a list of Objects

BUT,

UX-wise, we have
- `A` for one Object, and,
- `[A B C]` for a list of Objects

So, a list-processing language is just a list-processing *syntax* which internally handles low-level Collection Objects.

An orthogonal language is made up of two (2) parts:
1. Objects (low-level, OO paradigm)
2. syntax *skin* which provides a nicer (for some purposes) access to low-level Objects

Different syntax *skins* are designed for each purpose.  For example in Design, we are concerned only with *things* and *lists of things*, whereas in Production Engineering, we are concerned with the *type* of the things and their internal structures.

Maybe

`Z` for `first(Z)`
and `Z*` for `rest(Z)`

or

`Z` for `first(Z)`
`$Z` for `all-of Z`
`Z*` for `rest(Z)`

Q: what is the most common use-case? `All-of Z` or `first(Z)`?  We want the most economical syntax for the most common use-case.

Maybe

`Z` for `first(Z)`
`@Z` for `all-of Z`
`&Z` for `rest(Z)`

That is three (3) operators:
1. first
2. rest
3. all-of.

Currently, we reserve the most-economical syntax (the name) to mean `all-of` and we apply functions to make the other two operators.

Maybe, we will want:

`Z` for `first(Z)`
`Z*` for `all-of Z`
`Z&` for `rest(Z)`

Maybe, we will want:

`Z:` for `first(Z)`
`Z` for `all-of Z`
`:Z` for `rest(Z)`

[[Orthogonal Programming Languages - Lists]]