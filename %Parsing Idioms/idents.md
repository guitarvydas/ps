# Identifiers
Most programming languages use identifiers for variable names and function names and type names.

Each programming language has its own set of rules for which characters are allowed in identifiers.

Usually, the first character is different from the rest of the characters.

The pattern below shows a generic way to parse such identifiers.

The pattern needs to be modified for specific rules of specific languages.

## Identifier Pattern
```
ident {
main = ident
ident = identFirst identRest*
identFirst = letter
identRest = digit | identFirst
}
```

## Identifier Pattern In Action
![[ident1.png]]
This next screenshot shows an illegal identifer (according to the rules of this particular pattern).

![[ident2.png]]