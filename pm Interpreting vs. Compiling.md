An interpreter is a program that reads a script and executes it immediately.

A compiler is a program that reads a script and tries to optimize by separating the wheat from the chaff.

For example, the expression
```
a = 2
b = 5
a + b
```
is immediately evaluated (to 5) in an interpreter, whereas a compiler encodes the pre-calculated result, 5, into the binary code and discards the names and assignments "a" and "b" (after checking that "a" and "b" aren't needed elsewhere in the program).

What is commonly called a *programming language* is most often a compiler program that checks for various errors then produces a stripped-down binary program that runs faster/smaller than the full-blown version of the (interpreted) program.

Certain language constructs lend themselves to compilation, other features inhibit compilation.

For example, early versions of Lisp created the forerunner of anonymous functions, called *lambda*s.  In order to be able to compile *lambda*s, changes were made to the language, to tighten it up, resulting in a stripped-down version of *lambda*s called *closure*s.  The new, stripped-down language, lost some of the flexibility of early Lisp, but, gained in speed and size and compilability.  An example of a feature that was stripped down is the `eval` function.  `Eval` is the complete compiler.  To support `eval` in all of its generality means that every Lisp program has to include the whole compiler.  If programmers avoid `eval` and use only the kinds of *lambda*s provided in the stripped-down language, the final result is a program that runs faster and is smaller and doesn't need to include the compiler.

Another feature that was modified to create the new Lisp - called Common Lisp - was the addition of *class*es. Classes are a compile-time optimization of the ad-hoc technique of creating data structures.  In early Lisp, data structures were created by composing various fundamental types (strings, numbers, lists, etc.) using *defstruct* and using lists to compose data.  *Class*es define data as modules that include operator functions. Class modules inherit structure and functionality from other classes.  A more flexible - albeit non-compilable - version of *classes* is *prototype*s. Javascript is based on prototype inheritance.  The *Self* language explored the issues of prototypes[^jit].  Common Lisp skipped over prototype inheritance to include the optimized form of classes. 

[^jit]: Self "invented" the concept of JIT (Just In Time Compiling), although nascent versions of this concept were found in earlier Lisps (*fastcalls* - dynamic linking/loading).