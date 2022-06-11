My goal is to introduce the ideas of *parsing* in a gentle / frivolous way.

*Parsing* is often thought of as a compiler-only technology.

I think of *parsing* as a programming paradigm that can be applied to many kinds of programs, not just compilers.

In general, *parsing* is simply *pattern matching*.

In this book, I address only the issue of using existing parsing technology, namely Ohm-JS.  Extensions to using this existing technology to parse other formats are discussed in other books and blogs.  

The goal, then, is to, first learn how to use the basic tool, then, later, to use it to carve up other inputs.

This introduction of parsing consists of using an ad-hoc implementation of a browser-based app that performs only a simple function which is, hopefully, understandable and easy to explain.  The implementation uses Ohm-JS which is inspired by PEG (Parsing Expression Grammars)

We will discuss why Ohm-JS is better than REGEX.  REGEX is commonly found built into various popular languages (Perl, JavaScript, Python, etc.) and libraries. [[Parsing vs REGEX]]

