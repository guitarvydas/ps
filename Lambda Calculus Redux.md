Using only high-level languages, like Assembler, C and Bash, what is

`λx.x`?

knee-jerk in C:

`int f(int x) { return x; }`

but, that's wrong.

`f` must return a function. `x` is a function that returns an `int`

2nd try:

```
???
return (*x)();
}
```

In `bash`, 

```
cat fname
```

becomes
```
$cat `fname`
```

where `fname` is a shell "function" (command) that returns a ???

and "cat" is just a string that is passed in as a parameter, or better yet, in a pipe.

PATH doesn't come into play, since, by the time it reaches us the string `cat` will be fully qualified.

You can test `cat.bash` in-situ by hard-coding a test script
- `cat.bash ~/test.txt`

So, what is `λx.x`? in C and in Bash?

## Lessons 
### Indirection
Indirection, e.g.`(*f)(...)` leads to flexibility.

#### DLLs (Shared Libraries)

DLLs go only half-way
- DLLs use indirection on the `call`-side
- DLLs use a global variable (The Stack) on the `return`-side
- DLLs insist on synchronizing the `caller` and the `callee`
- Programming, as we know it, insists on blocking the `caller` when it sends a command to the the `callee`.

### One (1) Type
All "parameters" have a single type, a callable `function`.

What we call `type`s are actually sub-types or destructurings. The fundamental unit of data is the callable function.

### Explicitness
Nothing, but nothing, is hard-coded into the code.

`f(x)` does not name the function `f`, but refers to a callable function `(*f)(...)`

### Syntax is Cheap

We can do Lambda Calculus in C, in Bash, in Assembler, etc.

Lambda Calculus is just a *skin* that gives us syntactic sugar for a better notation for thinking in this way.

LC teaches us that variable names are superfluous (i.e. De Bruijn indexing, α-conversion).

Parsing teachs us that syntax, too, is superfluous.

Hmm, is syntax just the ultimate end-point of naming?

Ohm-JS makes it easy to crank out various syntaxes (in hours instead of years).  PEG comes close, but, muddies the water by mixing semantics with grammar.

## Rhetorical Question

What is `λx.x` in C?

What is `λx.x` in Bash?

Of course, it is do-able, since lambda-calculus, like everything else, boils down to assembler (which boils down to electrons being injected into oxides, which ...)

The syntax in C and Bash is probably grungy, but, compilers can convert any syntax into any other syntax (esp. with Ohm-JS).