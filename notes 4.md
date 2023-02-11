[[WIP/blogs/Data Descriptors]]

strcpy

---

I would call it "Lisp" or a "tree editor".

Features:
- very regular syntax, limited choices
- recursive definition
- machine-readable, machine-writable.

The different views ("projections") might be called "skins".  They are micro-syntaxes that make the machine-readable stuff more palatble to humans, i.e. mappings from human-readable -> machine-readable.

---

Losing the use of your hands or only half of your hands gives you the opportunity to think declaratively - what, not how.

teaser:

What is the point of programming?  To control a machine.  To accurately break down an action in steps so small that even a machine can perform the steps.   Current electronic machines provide us with a bag of potential steps called "opcodes".  

QWERTY keyboards are favoured by programmers, because they allow programmers to supply very fine detail using 10 fingers each of which contain a lot of nerve endings and fine motor control. I'd argue that QWERTY keyboards are better than piano keyboards, because you don't have to move your arms.  The drawback is that current QWERTY keyboards are not velocity sensitive nor "wiggly" sensitive.  aside: A mouse wastes 5 fingers plus an arm to operate.

I don't know how to solve the HCI problem of entering and editing details in a computer, but I did have my hand in a cast for one week and began exploring speech-to-text.  Speech can contain a lot of detail and speech-to-text can convert that detail into editable strings of characters.  The subsequent editing can be done in broad strokes (up, down, highlight, delete, etc.).  Maybe a solution lies transforming detailed speech into some other less-detailed domain, i.e. use more than one domain instead of a single text editor.  Maybe the finger-based editor can be split into 2 parts - entering details, editing in broad strokes.  ATM, I'm using Descript to replace Logic and iMovie to "write" papers and books (i.e. to document experience). Descript uses AI to suck detail out of speech, then converts it to a form that can be edited in broad strokes (a finger-and-mouse based word processor UI).  It ain't perfect, but is less painful to use than iMovie and Logic and OBS and etc. for what I want to do.  Descript expects a user to use a QWERTY keyboard and a mouse, so this doesn't directly solve your problem, yet is an example of a UX that treats data entry and editing as two separate technologies.

---

I believe that Colin Lupton is in the business and has offices in UofT campus https://github.com/thephoeron

---

Keywords I would search for: design recovery, meta programming, round trip.  Cordy, Holt, ...

My opinion: round trip isn't worth the trouble it causes.  Assembler gurus used to hand-edit output from compilers until gcc blew them away.  Think like a compiler-writer: design a low-level notation that works in only one direction and includes all of the "opcodes" that you need, then wrap syntaxes around them. Ohm-JS makes for easy syntaxing.  Divide and conquer: (1) full set of opcodes (2) syntax skins for human use.

---
```
Hello               anybody  in  there?
^         ^         ^        ^

Hello               anybody      there?
^         ^         ^        ^

Hello               anybody in   there?
^         ^         ^        ^

Hello               anybody   in  there?
^         ^         ^        ^
```

1: boring, 2-4: lyric setting ("musicality" applied to where lyrics fall on melody), 5...: other options

Frank Sinatra avoided 1.  Sting avoids 1.

"in" is a little word that doesn't deserve being in the spotlight.

---

proximity sensors tickled: "design recovery", "meta progamming", "round trip", Cordy, Holt, ...
opinion: this sounds like "round trip"
opinion: one-way: good, round-trip: bad
opinion: "round trip" is a crutch
xyz.c->xyz.asm discards semantic info making xyz.asm->xyz.c impossible
options: (1) forget "round trip", go for "one-way" only, (2) keep semantic info

---

> how can we have languages that let us powerfully gracefully manage the unhappy paths first and foremost?

Drakon, StateCharts, ...

Textual syntax doesn't do justice to this sort of thing.

Text over-emphasizes the happy path.

---


Squinting: 
Lisp source code is: hand-written ASTs
e.g. in a ficticious high level language: `a := b + c`
In ficticious Lisp: `(assign a (plus b c))`
In real Common Lisp: `(setf a (+ b c))`
Lisp's main operations are tree manipulation operators - CAR, CDR, CONS.  The rest are nice-to-have noise operations that deal with with the contents of tree nodes and/or convenience functions.
Any AST editor boils down to Lisp operations.
[Quibble: CST is a more precise term for this, instead of AST]

---

Not in my alley, but, it might be worth checking Ohm-JS (Ohmland on Discord) to see if someone has used Ohm for syntax coloring.  Ohm claims to be a parser generator (in JS), but ... I would say that Ohm is a game changer, something like 10++ times easier to use for parsing than anything else.  I use Ohm for parsing all sorts of things, including SVG and non-programming-languages...

---

I suspect that I'm not understanding what you mean...

But, that doesn't stop me from commenting :-).

At this moment, I believe that software development is severely one-sided.

The problem with software is the attempt to make everything into clockwork - including Design (bad idea).

Humanity has spent 1,000's of years developing methods to deal with / control independent units (like, other people, and, more recently LEGO block childrens' toys).  Clockworkiness is fairly young, though - only a few 100 years old.  Software as clockwork is even younger (70-ish years).  Software is "hard" because it violates normal human assumptions about how things work (i.e. independently, instead of clockwork-y).

Node-based software and diagrams are but a symptom of trying to break out of clockwork-iness and (back) into independence.

Clockwork-iness works for Production Engineering, but, clockwork-iness is anathema to Design.  Split the two apart and you get better productivity.

The "fad" that I see is the idea that clockwork-iness takes top priority.  That fad is leading us into epicycles (called, in politically-correct circles "work arounds"). An example I often use is the Mars Pathfinder disaster.  It was solved in the same way that we take Aspirin - fixed the symptom, but did not cure the cause. (Cause: building async on top of sync on top of async)

LEGO is not clockwork-y.  Software fools programmers into thinking that they are building with LEGO blocks.  Far from the truth.

Example: Your description of the way that Film Industry projects are managed is - at least to me - a process for managing independent pieces (assets, creators).  Software using clockwork languages (i.e. just about every programming language that is popular - Rust, C++, Python, Racket, etc., etc.) does not work like that and resists that kind of project structure.  But, software COULD be made to work like that and COULD be managed in the same way. [The "answer" is infuriatingly simple: used queues instead of CALL/RETURN for inter-component communcation].

Grafting diagrams and node-based ideas onto a clockwork substrate doesn't make it "independent" or "better".  It just makes it "more complicated" (anti-clockwork-iness built on top of clockwork-iness built on top of anti-clockwork-iness).

Missing technological piece: how to bolt Design assets together, then, Production Engineer them in a clockwork manner.  My current answer: 0D + Ohm + Lisp.  Lisp was on the right track, but then the clockwork-fadists derailed it and made it more clockwork-y.  Lisp got 1 thing right and 1 thing very wrong.  (a) During Design, there are only 2 entities: things and lists-of-things.  Things are Leaf nodes.  Lists are recursive - list can contain other lists and/or Leaves. (b) Lots of people hate Lisp "syntax" and, therefore, have ignored the bit that Lisp got right.

Another example of epicycle-icity: robotics.  Current languages (C++, Python, etc.) insist that the WHOLE robot work in a clockwork manner, instead of like a bunch of loosely-coupled rPIs.  In essence, the WHOLE robot is single-threaded (it only looks like it's multi-threaded ; back-filling using pub/sub is asking for unexpected gotchas and more Mars Pathfinder disasters).  The development of "behavior trees" is an attempt to graft async on top of sync.

---

> What are the list operations for dealing with tagged structures. i.e records and unions. I see how lisp matches to lambda reductions but I've been adding unions/records/effects all based of row types and am unsure what there native manipulations would be


short answer: functions
x.y is really y(x) and is written in Lisp as (y x)
method call self.y(z) is really y(self,z) and is written in Lisp as (y self z)

longer answer: all you get is ASTs (things and lists of things)
Yes, that is very low-level.
McCarthy decided to drape meaning over ASTs, i.e the root node of an AST is a always considered to be a function.
In the past, if you wanted to create more syntactic sugar draped over your ASTs, you would lock yourself away in a room for years and invent a “new language”.
Or, if you were a Lisper, you would create functions called “macros”, but, the resulting syntax always looked like more ASTs (lists).
Character-based syntax was reserved for compiler gurus who knew how to use parser tools.
Today, though: Ohm-JS provides a way to drape character-based syntax over ASTs in an afternoon (it even comes with a REPL for helping you design/debug a syntax - “Ohm-Editor”).  All you need is a toolbag of functionality plus Ohm-JS. (i.e. Common Lisp + Ohm-JS, or, JavaScript + Ohm-JS, or …).  PEG-based parsers (like Ohm) can do things that CFG parsers can't.  As a result, quickie grammars can be incredibly short (i.e a couple of lines, slightly longer than a REGEX, but way shorter than most YACC-based parsers).
Back to your question: If you want to see other people’s ideas on how to structure data, or if you don’t want to roll your own, see “CLOS”  and “DEFCLASS” and “DEFSTRUCT”.  CLOS method dispatch is different and better and more flexible than the usual OO stuff.

[The learning curve is probably steep.  Lispers are usually glad to help.  There are >1 Lispers here].

---

> Your reference to "Common Lisp + Ohm-JS" suggests that parsers written in Ohm-JS can be used with languages outside of the JS ecosystem. That's not my impression from looking at the Ohm-JS Web site, which only mentions TypeScript as an alternative target to JavaScript. Is there something I overlooked?  
> 
Background: Ohm-JS looks very interesting for some ideas I'd like to play with, but I have investment into JS or Web programming in general.


Correct, the parser technology is built in JavaScript and runs in a browser and in node.js.

Let's see if I can clarify what I meant...  I use Ohm-JS to write parsers to transpile code from one language to another language.  In analogy, YACC + C is used to write compilers from some high-level language like "FORTRAN" to another text language like "Assembler".  The fact that the FORTRAN compiler is written in "C" doesn't matter. Aside: the fact that the compiler is written using the language C, means that you can't bolt the compiler directly into a browser, and, you need to use the command line to run the compiler.  The fact that the compiler uses YACC means that grammars are huge, super-detailed CFG-things and your inventiveness is unduly restricted - you simply don't bother to build tiny 1-liners, like REGEXs, using that combination of technologies.  So, I build grammars and parsers using Ohm-JS and I have them emit code in other languages (like Common Lisp and Python).  The last time that I used JavaScript directly was to build myself a nano-DSL that parsed a syntax that I invented, and, emitted "semantics" code in JavaScript - enough JS to write a program that wrote programs for me.  I bolt the generated program onto Ohm-JS to produce a transpiler (compiler) without writing any JS at all, even though the compiler needs to live in the JS ecosystem. The generated parser+compiler compiles any syntax I invent to other languages - thus far, I've created Common Lisp, Python and JS code. I believe that I could generate more languages, but there's only one of me and my focus is elsewhere.

---

[hmm long answer, I wish it were shorter...]

Correct, the parser technology is built in JavaScript and runs in a browser and in node.js.

I was getting at something else. It's my fault that the idea wasn't made clear.  Let's try again:
1) I generate compilers using Ohm-JS that transpile from syntax I invent to other languages like Common Lisp, Python and JS (I believe that I could do more languages, but I haven't needed to do so (FYI, I have a P.O.C. WASM generator, but more work is needed (this was my first encounter with WASM and more learning curve is needed))).  
2) Then, I run those generated compilers to compile code written in the new languages.  
3) Then, I run the generated code on the command line, and, sometimes, in the browser.

Ohm-JS, based on PEG, is the game changer in the way I now look at problems.  CFGs (LR(k), YACC, etc.), REGEX, and, hand-written recursive descent parsers are just too cumbersome to use in the same way that I use Ohm-JS.

As an aside, one of the first things I wrote was a compiler that produced code that could be bolted into an Ohm-JS project, with the result that, in many use-cases, I don't have to write any JavaScript code at all.  I can write the grammar in Ohm's grammar syntax and I can write the transform in my own FABrication syntax, which is more succinct than JS.

Further aside: the first thing I did with Ohm-JS was to write a Scheme-subset-to-JS transpiler and used it to convert Nils Holm's PROLOG in Scheme to JavaScript. 

Example: I am deeply interested in true concurrency.  My code uses messages that look like:
⟨a b c d⟩
and I use Ohm-JS to transpile this nano-syntax into something like:
⟨Message a b c d⟩
using 2 specifications:
1. ‛⟪«p» «d» «s» «m»⟫’
2. ‛⟨Message «p» «d» «s» «m»⟩’
N.B. the whole spec for the pattern matching is 1 line long, and, the whole spec for transforming is 1 line long.
This specific example could be done with a Python script (or sed with Unicode support), but there are other details that I'm trying to skip over for this example, e.g. messages might contain other messages recursively, for which it helps to have a parser that can express matching brackets.

The input to Ohm-JS is a JS String.  The output of my FABricator compiler is a JS String.  All of the above steps can be done in one fell-swoop in a JavaScript program that feeds strings to Ohm-JS and calls Ohm-JS twice.  At one point, I need to compile a generated String to executable code.  JavaScript's "eval()" does this. (A "compiler" is "eval()")

Example: here's a contrived example of something that I would never do with YACC, but would do with Ohm-JS:
Contrived Problem: scan this big JavaScript program and list every name of every top-level function.  Using YACC, you need to write a full spec ("grammar") for JavaScript, with PEG (Ohm-JS), you can say something more obvious and succint: a function is `function id (...) { ... }` where the '...' stuff is anything including recursively bracketed bits.  The point here is not whether I wrote a correct pattern match, but, the difference between "omg, I have to write a grammar for every nook and cranny in JavaScript" vs. writing a grammar with "I don't care about this part".  This contrived example can probably be done with a REGEX, but if the problem is expanded to be something like "list every function with the name of each parameter" then REGEX works less-well than a parser.

---

Question:

How did REGEX jaibreak from Compiler Technology and become popular with non-compilerists?

First guess: (1) grep, sed, awk, etc. broke the ice, and, (2) perl brought REGEX into the mainstream.

I guess that perl solved a latent problem, which made it very popular.  What was that problem?

---

There is "lightweight" pattern matching and "heavyweight" pattern matching.

REGEX falls into the lightweight category, while CFG-based parser generators fall into the heavyweight category.

Ohm-JS (and PEG) falls into the lightweight category.  Ohm-JS can do things that REGEX can't do, like recursive matching and matching of balanced constructs.  And, Ohm-JS has a nicer syntax than REGEX.

Ohm-JS CAN build heavyweight parsers, but, lightweight recursive parsing opens up new doors. 

Silly example #1: syntax coloring / elision being based on nesting instead of being based on lines of text. 

Example #2: Verbatim text annotations.  The ability to skip uninteresting bits of text leads to incremental compilation. 

---

Addendum: There is "lightweight" pattern matching and "heavyweight" pattern matching.

REGEX falls into the lightweight category, while CFG-based parser generators fall into the heavyweight category.

The terms "lightweight" and "heavyweight" refer to Economy of Expression.

Ohm-JS's big win is that it fills the gap between REGEX and CFG technologies, enabling a new niche for thought.

Ohm-JS falls into the lightweight category.  Ohm-JS can do things that REGEX can't do, like recursive matching and matching of balanced constructs.

---

> I want to update the notes for the previous Torlisp meeting, but I've already forgotten what we discussed.  Do you happen to remember?
- what did I discuss?
- what did you discuss?
- at one point we talked about pacman as a Behavior Tree
- the only note I've got is about Korg's "Patch and Tweak"

---
> [!success]
>  Obsidian does WYSIWYG'ing of markdown.  Maybe you can get ideas from it.  Typora, too.  I now use Obsidian for documentation and emacs for writing code.

---
> [!success]
> The secret here is what I currently call 0D (Zero Dependency - AKA Parallelism: The Good Part).
>
>A command line uses FIFOs, not LIFOs, to string commands together.  Nested function calls are not the same as pipelines. Functions use The Stack (LIFO), pipelines use Queues (FIFO).

---

> [!success]
> See, also, PROLOG, miniKanren, constraints, unification.
>
> My quickie tutorial https://www.youtube.com/watch?v=QOYAHoLiyg0 includes converting a query result to JSON.

---

Progress report: I hope to organize these essays and videos into some books probably entitled "Programming Simplicity ...".
[Obsidian Publish](https://publish.obsidian.md/programmingsimplicity)
[Computing Simplicity](https://guitarvydas.github.io/)
[Paul Tarvydas](https://leanpub.com/u/paul-tarvydas)
https://www.youtube.com/channel/UC2bdO9l84VWGlRdeNy50fIg
https://www.youtube.com/@programmingsimplicity2980

---

I want to export my vault as a single markdown file.  This needs to be recursive and to drag in every linked file from every sub-directory

Suggestions?   I would love to find (a) a solution or (b) some existing open source plugin that I can steal from. I don't mind writing code.

Background: I would like to use Obsidian to write a leanpub book.  The biggest obstacle seems to be the fact that I fragment my writing into many small, hierarchical pieces when using Obsidian and I don't (yet) know how drag all of that work over to leanpub. It appears that "export to PDF" does mostly what I want, except that it produces PDF instead of markdown.  Changing format of links to leanpub format seems to be easy (a REGEX script).  Traversing the hierarchy of notes looks like work that might already exist but I don't know what search phrase(s) to use (hence, I ask before doing it myself).

---
> [!success]
> aside: If you need to steal/get-ideas-from code: the yawningly easiest-to-understand implementation of PROLOG is Nils Holm's http://www.t3x.org/bits/prolog6.html (it's so easy, that I ported it to 2 other languages - JavaScript and CL). If you want to dig in and make an optimized PROLOG, look at WAM (Warren Abstract Machine).  Ait Kaci's tutorial is helpful https://en.wikipedia.org/wiki/Warren_Abstract_Machine (I had found a $0 download, but can't find it at this moment). Gprolog is implemented with WAM and can be forced to show what WAM it generates. MiniKanren is relational programming done without backtracking http://minikanren.org.

---

> [!success]
> aside: writing this down lest I forget: PROLOG is a strange beast.  Backtracking is becoming relevant again (e.g. PEG, (AGDA smells like backtracking)).   The yawningly easiest-to-understand implementation of PROLOG is Nils Holm's http://www.t3x.org/bits/prolog6.html (it's so easy, that I ported it to 2 other languages - JavaScript and CL). If you want to dig in and make an optimized PROLOG, look at WAM (Warren Abstract Machine).  Ait Kaci's tutorial is helpful https://en.wikipedia.org/wiki/Warren_Abstract_Machine (I had found a $0 download, but can't find it at this moment). Gprolog is implemented with WAM and can be forced to show what WAM it generates. MiniKanren is relational programming done without backtracking http://minikanren.org.

---
  
> ... I may just buy it to collect notes...

  

It is my impression that Obsidian is free.  You can buy sub-products like "Publish" and "Sync", but, the backbone is free.

  

"Soon" (weeks?) Obsidian Canvas will become available.  Currently, I use Kinopio to make outline maps and to do brainstorming.  I wonder if Canvas will compete with Kinopio?  The recent release of Apple's Freeform looks like it might compete, too, but, I haven't checked it out.

  

Kinopio works in a browser, hence, it works on my iPhone, so I use it for shopping lists (which sync automagically with my laughtop).

  

> ... What if instead of a notebook being code in a document, it is an editable REPL? ...

  

How familiar are you with Emacs and the Mac dev environment (I last used the Mac dev env a decade ago and don't remember its name at that time)?

  

Emacs allows you to open a shell (e.g. /bin/bash) in a window, then apply all emacs editing operations on the output/input to the shell (scroll, search, replace, etc.).  Emacs, also, has "org-mode" which allows you to paste snippets of code into files (e.g. README.md) and then execute them.  IIRC, code snippets in org-mode are bracketed by single-line headers (much like markdown, but not the same syntax).  And, emacs has a markdown-mode that elides lower-level bits of markdown

  

Emacs, also, has a way to spawn a REPL-based language and to interact with it, which, I think, is how SBCL works ("SLIME").

  

REPLIT is some kind of multi-language REPL in a browser. 

  

I grew up on command-line REPLs. Being able to start up a shell in a window, then starting up a REPL in the shell is satisfying-enough that I haven't needed to explore notebooks.

  

[FYI - I think that MacOS is a wonderful O/S for non-programming productivity use.  I use Parallels to give me Linux for hard-core programming.]