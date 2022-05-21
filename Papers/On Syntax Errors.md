# Error Messages
- `throw` is not an error message
- A useful error message tells programmer where to look
	- 1 line of information
- A useless error message
	- too much information (e.g. `throw`)
	- gives details about what went wrong *inside* the compiler, instead of what is wrong with the programmer's program
	- or, too little information
	- or, information that doesn't fit the original UX (usually a text editor using line numbers and character offsets)

## Example
junk.py:
```
from = 1
```
```
$ python3 junk.py
  File "junk.py", line 1
    from = 1
         ^
SyntaxError: invalid syntax
```

Misleading error message points to `=`.

The actual problem is that `from` is a keyword and is causing a parse error.

The parser sees `token(keyword, 'from')` instead of `token(identifier, 'from')`.`

A better error message might be:
`syntax error expected an identifier, but received keyword('from')`.

## How to make this happen?

Beginnings... Using Ohm

![[not a keyword.png]]
But, this still gives a misleading error message for...

![[errors 3rd variant.png]]
More thought required ...
