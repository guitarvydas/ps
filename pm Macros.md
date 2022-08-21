A *macro* is, fundamentally, a text-replacer.

A *macro* replaces a bit of code with a different bit of code.

Programmers use macros to
- automatically generate boiler-plate code
- make their intentions more clear to others who reader the code, by eliding details (hiding details in the macro code)
- reduce keyboarding effort when writing code
- elide magic numbers and functions in a way that can efficiently be handled at compile time.

Macros tend to come with their own language (essentially a DSL).

Lisp macros are considered to be more "powerful" because
- the Lisp macro expander is built into the compiler
- the macro DSL is Lisp
	- Lisp programmers can use *any* Lisp function to write macros
	- Lisp programmers only need to learn one language - Lisp - to be able to write functions and macros.  In contrast, C programmers have to learn 2 languages - C and the preprocessor "language" (#ifdef, etc.).

# Macros in Languages
Full-blown macros exist in Lisp and Racket.

C has macros, but, in the macro facility is very limited.

Microsoft Word has a limited macro facility - Search and Replace.

Apple MacOS allows for keyboard macros ("shortcuts").

# Why Lisp?
Lisp's syntax makes it very easy to imagine macros.

The fact that Lisp stores all code as Lists, makes it very easy to create new code via Lisp's built-in List operations.

Lisp syntax supports the construction of tree data structures.  Tree data structures lend themselves to representing code and for generating code automatically.

In Lisp syntax, *everything* looks like a function.  At first glance, you can't tell if a function is a function or a macro.

In most languages, a function call looks like:
```
f(x,y)
```
and, in Lisp, it looks almost the same:
```
(f x y)
```

In Lisp, every operation returns a value.  Lisp is an *expression language*.  In Lisp, even apparent statements like `if...then...else...end if` are expressions which return values. In Lisp, `return` is mostly implicit.  Since every operation results in a value, there is (almost) no need for an explicit `return` statement.

This regularity makes it very easy to compose bits of code into larger bits of code.

Expression languages - functional substitution - also makes it very easy to compose bits of code into larger bits of code.

Most languages require more "syntax" and indirectly inhibit the idea of gluing bits of code together automatically.

# Assembler
Assembler has most of these same properties, which explains why it was easy to invent the idea of *compilers*.

On top of all of these features, assembler syntax clearly defines a line between *operations* and *operands*.  This *orthogonal* model also adds to the ease-of-code-generation mentality.

# Bash
The UNIX® shell, \*sh (/bin/sh, /bin/bash, /bin/zsh, etc.) makes it easy to generate programs (scripts) due to things like:
- pipelines
- text manipulation scripting language
- etc.

Pipelines create isolated code (AKA *commands* and *scripts*).  Isolation is an essential ingredient for gluing bits of code together (scripts invoking other scripts).

UNIX® normalizes all normal I/O via *file indirection*.  Everything looks like a file.  This feature makes it easy to compose bits of code to make larger bits of code.

# Recursive Replacement
A macro processor is like a compiler, except that the macro processor works recursively to expand all macros before compilation.

The Lisp compiler has a macro-expander built into it, so the Lisp compiler and the Lisp macro-expander perform compilation in a tag-team manner.  When the compiler encounters a macro, it hands-off the work to the macro-expander.  The macro-expander does its work then hands expanded code back to the compiler.

This combination means that Lisp can be used to re-program the Lisp compiler.

This combination is not necessary, in general, if a sufficiently powerful grok-reformatter language is used to preprocess code before it reaches the compiler.  

Ohm-JS is one such grok-reformatter language.

Ohm-JS processes arbitrary text in a sufficiently powerful manner to enable macro processing for most textual languages.

# Depdendencies
Dependencies of any sort, make it more difficult to compose bits of code to make larger bits of code.

## CALL / RETURN
[[Dependencies Due to CALL RETURN]]
## Synchrony
[[2022-06-07-Mind Virus of Over-Synchronization]]
## Hard-Wired Function Names
[[WIP/blogs/Hard-Wired Names]]
## Multitasking
[[Dependency Reduction Using Multitasking and Processes]]

# Macros For Any Language
With the advent of Ohm-JS and PEG technologies, it is possible to batch-edit text files and to expand macros for any textual programming language.

[[pm Prep]]

This is exactly the manner in which the Lisp macro-expander works in the Lisp compiler, except that, instead of matching Lisp lists, *prep* matches and replaces arbitrary text.

Macros for any text language can be implemented by using *prep* as a front-end filter before the compilation stage.

Multiple *prep* filters can be used to pre-process text files in small increments.

## Unicode Brackets
In the past, language designers were restricted to using characters from the ASCII alphabet of only 127 different characters (some of which are non-printing).

Ohm-JS can process specifications and text files that contain Unicode characters.  

Unicode offers are wider array of possible bracket characters and prefix characters than has been traditionally used.

For examples, see the #advancedidioms section, which discusses *verbatim* sequences, *symbols that contain whitespace* and *syntax stacks*.

# M4
The UNIX® command *m4* was developed as a general-purpose macro language that is more powerful than the macro language built into the C programming language.

# REGEXP, AWK, Sed, Perl, ETC.
REGEXP does not inherently support subroutines (for matching).

This makes REGEXP less powerful than PEG-based matchers such as Ohm-JS.

For example, Ohm-JS can pattern-match balanced parentheses.  REGEX cannot match balanced parentheses.  Language-Theory based parsers cannot match balanced parentheses.

REGEXP is a DSL for text-matching.  I believe that the syntax of Ohm-JS is superior to the syntax of REGEX.