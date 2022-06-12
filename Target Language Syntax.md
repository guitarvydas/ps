
#targetlanguagesyntax 

Target-language syntaxes also make a difference for writing programs that write programs.  

Syntax-less languages, like assembler and Lisp, make targetting them easy.  

Expression-based languages, like Lisp, make it easy to glue bits and pieces together build up whole programs.

Languages that support first-class functions and anonymous functions make it easier to glue bits together.

Languages with lots of syntax make harder targets.  

Languages that use text and balanced constructs (`if-then-else-endif`, `{ ... }`) make easier targets.  

Javascript is a reasonable target language.  Lisp is better.  Assembler is even better.  Python indentation-syntax makes it harder to crank out Python code from programs (I guess that you would want to use Python's built-in parsing stuff).  Markdown syntax is hard with the current set of tools.  Markdown is "more human readable", but less-good as a target for automatic cranking.  I've used markdown as a programming syntax, so, it's not impossible, just harder with current tools.