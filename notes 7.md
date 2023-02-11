I need help with this.

Maybe someone can show how this would be written in rho calculus (or any formalism)?

There are two queue-based components:
- A, when fired, outputs 2 events X, followed by Y
- B, when fired, outputs 2 events: Z to the "feedback" output and a copy of the input to the "out" output

The ouput is XYZZ, not, for example XZYZ or anything else.

![[Excalidraw/2023-01-20-Concurrency Question 2023-01-20 09.01.49.excalidraw.png]]

---

I drew 17 diagrams and wrote Python code to simulate this example.

Argh, then it took the rest of the day to discover how to upload the diagrams...

The diagrams appear to be in this PDF file:

https://github.com/guitarvydas/py0d/blob/dev/doc/2023-01-21-Example%20-%20Manual%20Trace%20With%20Feedback.pdf

The code is in 

https://github.com/guitarvydas/py0d/tree/dev

(git branch: dev)

---

revelations:

1. I needed to use two (2) kinds of Components.  I probably thought that this was "too obvious to mention".  The 1st kind is Leaf component - what we know as "code".  The 2nd kind is Container component - it composes components and keeps a routing table of connections between their pins (also "code", but very specific in function)

2. I conclude that Concurrency can be sub-divided into two (2) camps: (1) synchronous concurrency and (2) asynchonous concurrency.  Formal methodology leans on synchronous concurrency, whereas networking leans on asynchronous concurrency.  The difference appears to be "where" the synchronization occurs.  In synchronous concurrency, the synchronization is built-in under-the-hood.  In asynchronous concurrency, the synchronization is explicitly specified, e.g. by creating explicit protocols.  Yet, synchronous concurrency must devolve into asynchronous concurrency, since it doesn't specify the details below a certain level (e.g. opcodes implemented in VLSI/transistors/electronics/molecules/atoms/quarks).  Synchronous concurrency is like the Borg in Star Trek - the individuals *appear* to be stand-alone units, but are coordinated by a central intelligence.  Asynchronus concurrency is like "free will".

---

# Summary 2022
For me 2022 was:
1. 0D
2. transpiler pipelines

Explanations below.

There is nothing "new" here.   I believe that our crop of programming languages subtly discourages certain kinds of thoughts. You *can* do these things with our programming languages, but, you *don't bother*.

[I wrote this on Jan 1/2023.  Then I promptly got sick and found new ways to procrastinate.  I will gladly remove this if it is inappropriate or too long...]

# TL;DR
## 0D
- 0D is part of traditional parallelism (zero-dependency, total decoupling)
- breaking 0D away from parallelism enables other uses
- 0D uses FIFOs, whereas functions use LIFOs (LIFOs are used by most modern programming languages, Python, Rust, etc. and stifle possible solutions)
## Transpiler Pipelines
- "skip over" uninteresting bits of syntax, whereas CFG requires full language specification
- leads to a different class of tools -> parser used for "quickie" matches instead of for building compilers ; different way of using parser DSLs ; like mathematical manipulation of notation
- "skipping over" bits of syntax allows syntactic composition ; syntactic composition enables pipelines ; 

# 0D

0D is a short-hand for the phrase *zero dependency*.  Total decoupling.

Programmers already know how to write 0D code, but, they tangle this simple concept up with other concepts and call the result "parallelism".

At a very, very basic level, you can achieve 0D by using FIFOs instead of LIFOs (queues vs stacks).  LIFOs - callstacks - are good for expressing synchronous code.  LIFOs are less-good for expressing asynchronous code.  

Programmers often conflate nested, recursive functions with the notion of pipelines.  If a component sends itself a message, the message is queued up in FIFO order and there is a "delay" before the message is processed, whereas if a component recursively calls itself, the function parameters are pushed onto a stack and the processing happens immediately, in LIFO order.  This subtle difference in processing sequence manifests itself in design differences.  For example, in electronics - where all components are asynchronous by default - you often see the use of "negative feedback", say in Op-Amp designs. You rarely see this technique used in software design.  In electronics, negative feedback is used by components to self-regulate, whereas in software, recursion is used as a form of divide and conquer.  Feedback loops make it possible to be explicit about software design, whereas recursion hides the key element - the callstack - of the design.

EEs had this issue sussed out, before the advent of the "everything must be synchronized" mentality.  

All components in an electronic circuit are asynchronous by default.  Synchrony is judiciously, explicitly designed-in through the use of *protocols*.  Synchrony is not designed-in everywhere *by default* and is explicitly designed in on an *as needed* basis.  There is a reason - a subtle reason - why it is easy to draw diagrams of computer networks and not-so-easy to draw diagrams of synchronous code.  

In EE designs, concurrency is so cheap that you can't help but use it.  In software, concurrency implies difficulty and designers end up avoiding concurrency in their designs.

This subtle difference has a trickle-down effect to end-user code.  When it is difficult to draw diagrams of programs and to snap components together, programmers tend not to provide such features to end-users.  Or, when they provide such features, they implement such features under duress.  If DaS and snappable components were abundantly available, such features would naturally leak through to end-user apps.

0D can be implemented a lot more efficiently than by using operating system processes and IPCs.  Most modern programming languages support closures (anonymous functions) and make it easy to build queue data structures.  Stick one queue at the front of a closure - the "input queue" - and one queue at the tail of a closure - the "output queue" - and, you get 0D.  Then, you need to write a wrapper component that routes "messages" from the output queue of one closure to the input queue of another closure.  Can this concept be generalized?  This ain't rocket science.  

When you build 0D software components, does the order-of-operation of components matter?  Nope.  Can a 0D component create more than one result during its operation?  Yep.  Can a 0D component directly refer to another 0D component?  Nope.  The best you can do is to compose networks of 0D components inside of routing wrappers.

# Transpiler Pipelines
It would be nice to build up solutions using pipelines of many little solutions and syntaxes made expressly for those solutions.

What do you need to be able to do this?

1) You need to be able to write grammars that are very, very small and that allow you to"ignore" bits of syntax that don't pertain to a problem, e.g. kind-of like REGEX, but, better.
2) Total isolation of building blocks.

## Very Small Grammars That Ignore Uninteresting Items
Ohm-JS - a derivative of PEG (Parsing Expression Grammars) - makes it possible to write grammars that skip over uninteresting bits of text.

For example, if you want to write a quikie parser for C code, you might want to say:
`... function-name (...) {...}`

In Ohm-JS, you can say this, whereas in a CFG-based parser generator you need to over-specify all of the niggly bits of C syntax.  In Ohm-JS, this results in a few minutes of work and only a few lines of code.  The Ohm-Editor assists in developing the micro-grammar.  

In YACC and CFG-based approaches, though, you're looking at a gargantuan job (days, weeks, months, ...) and you simply *don't bother* to write such a quickie parser.  You either *don't bother* with the whole idea, or you use something like REGEX which fails on a number of edge-cases for this kind of thing.  REGEX can't search recursively for matching brackets, Ohm-JS can.  Using REGEX, you might get away with a partial solution, or, the project might grow larger as you hit unexpected speed bumps.  You either persevere or you just give up.

For the record, the grammar plus the accompanying code fabricator specification  for the above simple example are shown in the appendix.

### DaS Comes For Free

When you can build totally isolated building blocks, you can draw sensible diagrams of how the building blocks should be snapped together to solve a problem.

Later, you can steal (cut/copy/paste) chunks of previous solutions and use them as building blocks for new problems.

DaS: Diagrams as Syntax.

DaS is not diagrams as an Art Form.  DaS is diagrams as programming languages.  For example, instead of writing `{...}`, you draw a rectangle.

Programming languages were created by culling the English language and by choosing only the words and phrases that could be compiled to executable code.

Can we cull diagrams in the same way to invent new programming languages?

EE's have done this and they call the resulting diagrams "schematics".

Building construction engineers have done this and call the resulting diagrams "blueprints".

## Don't We Already Use Building Blocks?

"Code Libraries" *look* like building blocks, but, contain subtle bits of coupling that discourage building-block-iness.

For example, the very common idiom of a function call `f(x)` introduces at least 3 kinds of coupling:
1. The name `f` is hard-wired into the caller's code.  The calling code cannot be cut/copy/pasted into some other solution without also dragging in the called code, or, by futzing with the source code.
2. The function call `f(x)` waits for the callee to return a value.  This is also known as *blocking*.  Function call notation works fine on paper, where functions can be evaluated instantaneously.  It's different when you map function call syntax onto hardware that has propagation delays wherein functions take finite amounts of time to "run".  This subtle difference in behaviour leads to hidden gotchas.  A glaring example of the impact of such a difference can be seen in the Mars Pathfinder disaster[^pathfinder].  
3. The function return `v = f(x)` hard-wires a routing decision into the callee's code.  The callee *must* direct its response back to the caller.  This is called "returning a value".  Again, this doesn't look like a problem when you just want to build fancier calculators, but, this hard-wired routing decision discourages simple solutions to non-calculator problems, like machine control.
[^pathfinder]: https://www.rapitasystems.com/blog/what-really-happened-software-mars-pathfinder-spacecraft

When you don't have complete isolation, you don't have building blocks.  Imagine a LEGO® set where all the pieces are joined together with a single, long sewing thread glued to each LEGO® block.  Or, you have two real-world objects, e.g. one apple and one orange.  You cut the apple in half.  What happens to the orange?

As humans, we are used to the idea that objects are completely isolated.  Programs don't work that way.  We have to stop and think hard when writing programs.  

# Appendix
If you want to play along with this experiment, the code is in https://github.com/guitarvydas/cfunc.

## c.ohm
A quickie grammar that matches function declarations in a C file.

Note that this grammar is longer than a REGEX, but, is significantly shorter than a CFG specification (LR(k), YACC, etc.) for the C programming language.

```
Cfunctions {
  program = item+
  item =
    | comment
    | string
    | applySyntactic<FunctionDecl> -- decl
    | any -- other
  FunctionDecl = name "(" param+ ")" "{" block+ "}"

    param =
      | "(" param+ ")" -- nested
      | ~"(" ~")" any  -- flat

    block =
      | "{" block+ "}" -- nested
      | ~"{" ~"}" any  -- flat

      name = letter (alnum | "_")*
      comment =
        | "//" (~nl any)* nl
        | "/*" (~"*/" any)* "*/"
      string =
        | bqstring
        | dqstring
        | sqstring
      bqstring = "`" (qbq | (~"`" any))* "`"
      dqstring = "\"" (qdq | (~"\"" any))* "\""
      sqstring = "'" (qsq | (~"'" any))* "'"
      qbq = "\\" "`"
      qdq = "\\" "\""
      qsq = "\\" "'"
      nl = "\n"
      spaces += comment
}
```

Can this grammar be improved and optimized?  Probably.  But, why would you care?  

You would care only if you used this code in an end-user product.

If you use this code in something like a batch-editing environment, "efficiency" takes on a different meaning.  End-users don't care about the efficiency of your code editor and its Find-and-Replace function.  End-users don't care how efficient your command line tools, like *grep*, are.

When you treat Ohm-JS + Fab as batch editors for development, then, only *development efficiency* matters.

I strongly believe that one shouldn't write code.  One should write code that writes code.  From this perspective, "efficiency" breaks down into 2 camps:
1. developer efficiency
2. end-user efficiency.

Note that traditional *compilers* are simply apps that write code.  Developers use *compilers*.  End-users don't care if a developer created end-user app code by hand or by using a compiler.  The only things that end-users care about is if the app is cheap and runs on cheap hardware.  The final app is assembler, regardless of how it was created. Developers, on the other hand, do care about development time and effort.  Hand-writing apps requires much more effort than using high-level language compilers to generate the final app code.  Debugging apps is easier when using high-level languages with type-checkers.  On the other hand, developers usually buy fancier hardware than that which is used by end-users.  Developers can afford to burn CPU cycles on their fancy hardware to give themselves faster - and cheaper - development and debugging times.

The final step in development is that of Production Engineering an app to make it cheap-enough to sell.  Up until that point, the development workflow should consist of *anything* that speeds up and cheapens development time, for example, dynamic language environments and REPLs.  For example, *Rust* is a Production Engineering language and needn't be used until the last moment.

## c.fab

A `.fab` file is a specification that creates strings based on the above grammar.  *Fab* is an experimental transpiler tool that works with Ohm-JS.  It generates JavaScript code required by Ohm-JS.  This could all be done by off-the-shelf Ohm-JS.  *Fab* simply reduces the amount of keyboarding needed for creating JavaScript "semantics" code required by Ohm-JS.  *Fab* is written in Ohm-JS.
```
Cfunctions {
  program [item+] = ‛«item»’
  item_decl [x] =  ‛«x»’
  item_other [x] =  ‛’
  FunctionDecl [name lp param+ rp lb block+ rb] = ‛\n«name»’
    param_nested [lp param+ rp] = ‛’
    param_flat [c] = ‛’
    block_nested [lp block+ rp] = ‛’
    block_flat [c] = ‛’
      name [letter c*] = ‛«letter»«c»’
      comment [begin cs end] = ‛’
      nl [c] =  ‛«c»’
      spaces [cs] =  ‛«cs»’
      bqstring [begin cs* end] = ‛’
      dqstring [begin cs* end] = ‛’
      sqstring [begin cs* end] = ‛’
      qbq [bslash c] = ‛’
      qdq [bslash c] = ‛’
      qsq [bslash c] = ‛’
}
```
## grep.c
The above was tested against `grep.c` from the Gnu grep repo.

`git clone https://git.savannah.gnu.org/git/grep.git`
## Even Smaller
I'm playing with the design of a new tool that I call *bred* (bracket editor).  It's like a super-simple batch editor that walks through text that contains bracketed constructs.

The full specification consists of 2 strings
1. what to match
2. how to rewrite it.

The above specifications might be re-expressed as:
```
‛«name» («params») {«block»}’
‛«name»’
```
which reads as:
1. match, recursively, anything that looks like `«name» («params») {«block»}`
2. then, throw away everything except the name

Currently, my concepts have warts - what happens when a comment or a string or a character constant contains brackets, or, even worse, what happens if they contain unmatched brackets?

---

half-baked brainstorming...

observation: Network protocols are explicit synchrony.  "Formalism" is implicit synchrony.  Both are synchronization protocols, but, at different levels of granularity.

observation: The Scientific Method is just more-of-the-same ad-hoc-nicity, but at a finer level with better marketing that says that it is "new and improved" and "better" than the older ad-hoc methods.  Science is: (a) create theory (ad-hoc + use of text manipulation to interpolate (not extrapolate) other possible theories and sub-theories and epicyclic theories), (b) test theory (guided by principle of fail-fast and bald guesses (ad-hoc)), (c) repeat.

observation: Formal methods never bottom-out (lest they describe operations down to the quark level and smaller).  Current CompSci formal methods draw a line at "opcodes".  Above the line, formal methods are useful, below the line is a free-for-all.  AGDA "postulates" define what the drawn line is.  In high-school math, the word "given" is the same.

gedanken: If you optimize away all of the "free will imperfections" from humans, you get -- bacteria.  Does the Evolution arrow go exactly the other way?

observation: a CPU is an interpreter.

observation: multitasking is an ad-hoc blob of code that does all of the nasty stuff (State and History) required to support little islands of purely functional code (actually, wrapping the islands in 0D wrappers means that you can't care if the code is purely functional or not)

observation: Ohm-JS (PEG) is better than CFG for certain use-cases (e.g. PEG can express matching brackets, CFG can't)

observation: consensus is an explicit protocol

observation: low-level Ethernet uses no synchronization whatsoever

observation: math work because it assumes no latency / propagation delay ; math applied to real hardware with physical constraints like propagation delay gets weird and ad-hoc (see Mars Pathfinder disaster and ad-hoc, above)

maybe what I want is a stack of Sector Lisps (layers) that work above lines at different levels ; define formalisms at each level, then step up (or down) when the formalism begins to struggle ; practicality: Sector Lisp is so small that you can afford to embed multiple copies of it in your app, and, if you hate prefix-syntax, use Ohm-JS for sugar-coating

---

For me 2022 was (1) 0D and (2) transpiler pipelines. https://publish.obsidian.md/programmingsimplicity/2023-01-01-Summary+2022

---

> Re 0D, my next question is: how to decide at what granularity to stop using function calls? Or are you suggesting eliminating them entirely?
> 
> Re transpiler pipelines: I tried this for a while a few years ago. The conclusion I reached was that they were great for adding capabilities but they can't add restrictions. In first class languages often a lot of value comes from guarantees that certain events won't occur. An int won't be assigned to a string. There you need a single coherent grammar. Does this seem right?

x.f(x) is syntax with the meaning "mutate the global callstack and mutate the IP to point at the method function x.f" (and "return" means "put the return value in a special place, then mutate the global callstack, then mutate the IP to point at the caller's continuation code")

but, there is no builtin syntax for Send()ing to an output queue and passing the finalized output queue back up to the parent Container

creating a FIFO output queue is possible - using bolted-together functions and attributes - but, is not a 1st-class operation like function-calling ; this syntactic imbalance favours using callstack-based functions instead of FIFOs

there is a body of math that deals with instantaneous function syntax, but no similar body of math for dealing with Send() [you can "model" Send(), but that ain't the same as hard-wiring it into the notation - subtle encouragement to think only one way]


... re: 0D ...

ideal: use both, without letting language influence your thinking
ideal: use both, but, remain aware of what each choice accomplishes
ideal: 0D to be so cheap that it could be used on every line of code

reality: 0D is entangled with Multiprocessing and the current grain size is "Process"
alternate reality: 0D can be couched in terms of closures and FIFOs, hence, grain size is "function" (where closure is roughly equivalent to function)

reality: CALL/RETURN and the callstack are hard-wired into CPUs (there used to be a time when CPUs didn't have hard-wired callstacks)

reality: 1950s IDEs for Programming were Programming Languages, but, in 2022++ IDEs include other stuff, like powerful programming editors

CALL is used for 2 reasons: (1) compacting code size, (2) DRY (Don't Repeat Yourself).  There is no good reason to allow CALL/RETURN to leak into end-user code except for case (1) compacting code size [corollary: case (2) should be entirely optimized away at "compile time" and "edit time"] 

x.f(x) is syntax with the meaning "mutate the global callstack and mutate the IP to point at the method function x.f" (and "return" means "put the return value in a special place, then mutate the global callstack, then mutate the IP to point at the caller's continuation code")

but, there is no popular builtin syntax for Send()ing to an output queue and passing the finalized output queue back up to the parent Container

... re: transpiler pipelines question ... thinking ...

---
... re: transpiler pipelines question, progress towards answering the question, WIP ...
... this doesn't necessarily answer your question, but might show where my thinking is going, while I try to figure out what you were really asking ...
... I think of a PL as 2 issues: (1) data (2) control flow, i.e. (1) operands and (2) syntax ... 
... I am playing with Orthogonal Programming Languages, where (1) is OO, (2) is syntax, based on Cordy's Orthogonal Code Generator ideas and based on RTL and based on dataless PLs (like Holt's S/SL (used in PT Pascal, Concurrent Euclid, Turing, etc.)) ...
... I think that dataless languages boils down to 2 entities: (1) Things, (2) Lists of Things.  Types are opaque and cannot be defined at the dataless language-level (Types are defined and manipulated in other layers, implemented in common PLs (e.g. Python, C, etc.))

# Src
String s
s <- 'abc'
s <- 7

# Gather
$defsynonym ('s', ⟨od, kind=var, type="String", key='s'⟩)
s <- 'abc'
s <- 7

# Normalize
$defsynonym ('s', ⟨od-var, "String", 's'⟩)
$Assign s, ⟨od-lit, "String", 'abc'⟩
$Assign s, ⟨od-lit, "int", 7⟩

... same as ...

$Assign ⟨od-var, "String", 's'⟩, ⟨od-lit, "String", 'abc'⟩
$Assign ⟨od-var, "String", 's'⟩, ⟨od-lit, "int", 7⟩

# Semantic Check
"String" == "String" --> OK
"String" != "int" --> Error

This looks like simple name equivalence.  Lower layers are free to use structural equivalence instead (using names as keys to a map containing more detail for each type).

[The goal here is to think of a compiler as a string of pearls on a pipeline instead of as a honking big tree].

[od - oh-D, not zero-D, means "object descriptor"]

---

Hmmm, is it valid to say that "0D is Combinators for impure languages"?  

Is that the appeal of /bin/sh pipelines?  Combinators for C?

---

riffing: a CPU is a man-made interpreter that uses ad-hoc combinations of electronic components (e.g. transistors)

The set of opcodes is an API.  That API keeps changing as we learn which ad-hoc combinations of electronics make our jobs easier.

In my mind, a compiler is interpreted.  It is a script of opcodes that is interpreted by the man-made machine at "compile-time".

All of the "programming languages" that we've built are just convenient ways of creating scripts of opcodes.  In the end, end-users get a bag of opcodes and a lump of hardware that interprets the opcodes.  End-users don't care how the scripts were created, as long as the result is inexpensive and does what it claims to do.

---

hmm fyi: I'm toying with Comby and thinking on how parser combinators relate to Ohm-JS.  I currently believe that parser combinators work only if you follow a set of Rules (the Rules are called "functional programming").  The stuff I'm calling 0D makes the set of Rules less restrictive.  I am wondering if that is the appeal of /bin/sh pipelines - combinators for C.  I heard Nada give a talk but didn't make the connection your comment stimulated.  I will look more carefully at this. I wonder if "FP" Rules can be applied in layers to make composing 0D components easier, then, to make composing compositions of 0D components easier and so on.

The Rules of FP are easier to use if you don't need to use those same Rules to manipulate (mutate) memory in a random access manner.  Rules of FP favour stack-iness.  Rules of FP become cumbersome if you try to express mutation.  Yet, Mutation, and, History does happen - the Rules of FP try to hide (elide) such concepts.

The CPU opcode-API draws a line.  Everything above the line must be expressed as scripts of opcodes.  Everything below the line is ad-hoc and involves Mutation (e.g. RAM) and History.  Each opcode represents a canned electrical behaviour.  I learned Electronics before I learned about Opcodes, but, you don't have to know Electronics to create scripts of canned electrical behaviours. 

---

FWIW: these are my first impressions on viewing this video (first impressions can be good, but, also can be really wrong), feel free to skip if TL;DR

"tower": (see below - singular form implies single stack)

"same language" at all levels: I disagree, one could use a different DSL at each level / branch

change on-the-fly: somewhere, Nada seems to imply that changing a design on-the-fly might be a good idea, this used to be called "self-modifying code" and is a very bad idea (maybe I misunderstood what she meant)

"the stack": singular, not plural (see below)

define interpreter at each level - good idea  for Architectural language, DI (Design Intent), etc. - might be overlooked due to "efficiency" of implementing an interpreter in an interpreter

I seem to be missing something - this looks easy, but Nada says it gets complicated. Why?

Oh, the irony - back to FEXPRs again...

Denotational Semantics: {env, cont} are explicit args to every function, but in FP, they are implicit args

This should be possible to implement in Python (the laziest approach might be to transpile the .scm code to .py using something like Ohm-JS (surprise!))

IMO: Lisp is not a language, it is an assembler.  There are 2 types of assembler (1) line-oriented, (2) tree-oriented.

Use syntax skins at every level to re-skin low-level Lisp to something more palatable.  

Create a tree of interpreters instead of only 1 stack of interpreters, each branch might have a different "syntax" (skin).

Debugging of message-passing needs a tree of tracebacks, instead of a single traceback stack, need "tracer bullets fired along every branch of a solution

tower === stack === mind-virus due to functional approach (1-in, 1-out), "when all you've got is a notation for functions, everything looks like a function"

"Turtles all the way down" image is very instructive.

Knuth's books use MIX - a line-oriented assembler - while SICP uses Scheme - a tree-oriented assembler.

A tree-oriented assembler allows recursive definitions of scripts.

My definition of an assembler:
- almost no syntax
- syntax is easy-to-generate by a machine
- syntax is normalized, few edge-cases 
	- e.g. Lisp uses prefix notation and doesn't bother with infix (either it begins with an LPAR or it's an Atom)
- Lisp 1.5 (and Sector Lisp) has only 2 kinds of Thing: List or Atom
- (1) operators, (2) operands
	- operands == OO
	- operators = "syntax" (Ohm-JS)
		- traditionally, "syntax" was hard to parse, so traditional Assembler uses very simplistic mnemonics
		- easier parsing -> more expressive operators, 
			- e.g. "I want a hamburger" -> kitchen.order ('hamburger', [])
			- e.g. "I want a hamburger with cheese and pickles" -> kitchen.order ('hamburger', ['cheese', 'pickles'])

- our current approach = Tower of depth 1.  One base level (line-oriented assembler) and a plethora of languages in the layer directly above, not stacked upon each other, but, placed beside each other.  Alan Kay said that new languages should use current languages as Assembler (i.e. stacking upon each other, not supplanting).

---

> Being able to "boil down" that soup of opcodes to something smaller, by cooking out the cruft of layers of interpretation, seems like a useful thing -- but also is exactly the kind of place that formalisms can help.

"Boiling down" is "optimization".  Optimization impedes scalability.  Optimization impedes free thinking about possible solutions.  Yes, formalisms are interesting ways to interpolate (not extrapolate) better optimizations.  IMO, formalism is all about Production Engineering while ignoring Design Engineering.  I see a huge imbalance in our Programming Languages - Production Engineering at the expense of Design Engineering.

aside: My favourite optimization technique was a paper on "just try every combination".  I don't remember the reference.  The guy was trying to figure out the optimal implementation of a language construct for a certain CPU.  He wrote a program that simply tried every combination of opcodes and let it run over the weekend.  The answer was quite surprising - the program found one instruction that did what he needed.  He, nor I, would never have thought of trying that instruction for that purpose.

This approach is clearly unusable for end-user code, but, it is imaginable for development, esp. with the faster/better machines that we have now.  The trade-off is the cost of human-developer-time vs. development-machine-time.

Big Blue trounced Kasparov.  Big Blue used brute force.  Humans get bored with this approach and make lots of mistakes and try to prune choices.

further aside: my favourite Physics free-thinker, Robert Distinti, uses exactly this approach.  He lets the machine do exhaustive search for possible equations to explain anomalous observations, while human Physicists are stuck using clay-tablet notation and prune their ideas to fit that notation, simply ignoring anomalous observations.

---

Advice Needed: I want the easiest way to punch-in audio over a screencast.  But, I don't know how to search for that info.

Background: I'm building quickie screencasts, but, I have to do each of these in more than one pass.  My current workflow is (1) to screen-record and verbalize the storyboard, then (2) copy/paste the transciption into an editor of my choice and pare it down to a readable script, then (3) to read the script and re-record the audio, then to (4) paste the new audio onto the video created in step (1) 

The audio that I record in the first step is stilted and I want to punch-in better, less-stilted audio over top of it.

At the moment, I re-record one sentence at a time using Descript's screen recorder.  The setup for each such re-recording is painful. There are something like 10 re-recordings, when done one sentence at a time.  I have to stop and edit each line right away, or else I forget which take I liked best, etc.  I would like to futz with splitting the re-recorded audio and lining it up to match what's on the screen, while suppressing all audio from step (1).

I'm open to reading up on how to do this and/or suggestions on how to do this kind of work more easily.  I used to use Logic for audio recording. I hated editing. I could use Logic, or Quicktime/iMovie, or Descript, but, I'm not sure which is going to be the most easy and require the fewest number of steps.  The central point of my screencasts is the technical content. I would like to remove at least 80% of the low-hanging warts from the video without doing a lot of "work" (editing).  The goal would be to knock off quickie technical youtubes in a few minutes each.  Right now, each one is taking me a full day or more. What I learned from using Logic is that (a) I need to push the (dynamic) mic into my face and (b) I need to compress my voice and to notch it at about 1.3kHz.  Studio Sound does (a) even with a mic that is 2 feet away from my face.  Descript's compressor and parametric equalizer are easy to set up.  Yet, it takes me a full day to produce a 2-minute youtube.

My goal is to have a zero learning curve for doing this, or, at least to come down the learning curve as fast as possible without knowing everything there is to know about Descript while making acceptable-quality technical youtubes.  Ideally, I should be able to knock these videos off with my iPhone, but, I don't understand what I mean by this.

---

I apologize if I've made this sound too complicated...

0D has been around for a long time.  

I didn't invent it, I just drew a sloppy red circle around it and gave it a name that I like.

Every "concurrent" program needs, first, to be 0D.  UNIX pipes were invented in 1973 https://en.wikipedia.org/wiki/Pipeline_(Unix).  Morrison invented Flow-Based Programming even earlier.  Processes and IPCs have been around for a long time. All are 0D at the core.

Anonymous functions (the precursors to closures) were invented around 1956 (Lisp 1.5).  If there hadn't been such a deep allergy to Lisp, it might have become obvious that "operating system processes" were just closures.  

One of the first CPUs that I programmed, didn't have a callstack.  You had to choose to implement CALL manually, or, choose to implement co-routines manually.  (BALR instruction, IIRC). Or, to do something more ad-hoc and less-structured.

Basic 0D consists of putting a queue at the front of a closure and another queue at the back of the same closure.  Then, writing a wrapper that shepherds messages between queues. Stating the obvious - lists and callstacks are not queues. Recursion is not 0D.

I will try to whip up an example in some example language ...

---

I'm constructing a simple summary of the salient points of FBP.  Please let me know what I've missed (post here, or edit this Kinopio page directly).

https://kinopio.club/elements-of-fbp-o50FJ1IKYiS_NX3t5z0HE

---

# Notes ...
- fiction of sync lib
- fiction of grafting mathematical notation onto electronics that has physical limitations that violate fundamental mathematical notation (not all of mathematics, just the notation) principles, like RAM, mutation, propagation delay, etc.
- early games: slip 8.5" floppy disk into a CPM box, and the software takes over the whole machine to perform exactly one task: to play a game (visuals X inputs X logic) 

- allow Programmers to create electronic devices without learning how to solder, but needing 4+ years of University education to learn how to lather epicycles onto every design problem

- CPU time was meted out in $'s - day 1 of a University course in computing consisted of getting an "account" and being made aware of how many $'s were in the account, with the implication that all homework had to be done within the $ budget 

- Apple Postscript printers - enabled Desktop Publishing - put a CPU into a printer (running Forth - er, Postscript), instead of using a single CPU to  control it from afar

- premature optimization - use of sync math notation made it easier to think of single machines instead of distributed machines - doesn't model electronic machines in their full glory
---
Brandon 
- vfi $15k
---

For The Record: I wonder if I let you down on Thursday Jan. 12?  If so, I apologize. I was sick for at least another week and am still coughing now.  I would have let you know ahead of time, but I was convinced that you didn't need me that night and that I would be scheduled on some subsequent night(s).  (What can I say?  I was horribly underslept :-)).  If it is of interest, I would be glad to be invited to talk again.  A primer on using Ohm-JS would be easy for me.  Or, maybe there is something that I'm not thinking of that might be of interest?  I avoid saying anything about PT Pascal and S/SL (syntax semantic language), because they appear to be "too obvious" to me.  I used to know a lot about Cordy's Orthogonal Code Generator, Data Descriptors and even RTL (Fraser/Davidson - the reason why gcc was so good).  The source for PT and S/SL is available online.  I haven't found Cordy's thesis online, but I have at least one copy. (OCG defined a declarative decision tree language to generate code for CPUs in two orthogonal steps).  Or my thoughts on what I call FDD - Failure Driven Design.  Or, what makes a language "good" for compiling-to instead of writing by hand.  ... Or Prolog For Programmers (how a simple program is written in 3GL, then rewritten in PROLOG ; using PROLOG to perform interesting queries, then pumping the results out as JSON.)

Or, just /bin/bash scripting, or M4 or AWK or ...  Or a walk-through of Sector Lisp (which must be very similar to SICP).  

We had Justine speak to us at a Torlisp meetup.    Hugh Redelmeier is still around as far as I know - he was an ultra-expert in C (probably sat on the standardization committee) and did a PhD thesis on bolting Functional Programming to Reality (I would love to re-read his thesis, but he hasn't supplied me with a machine-readable version).

I used to be very interested in Denotational Semantics and thought that Peter Lee's book on Realistic Compiler Generation (emitting Scheme) was amazing.  Uwe Pleban wrote follow-on papers about this stuff.

The father of one of the Scheme's (Chicken Scheme? I'll remember his name when you tell it to me) is in Montreal.  He seems to have done a lot of work on making small, real-time schemes, that I know very little about and would be interested in knowing more.

I learned compiling by reading (and implementing) Ron Cain's Small C.  It demonstrates that a compiler is fundamentally a simple program, but as it gets bigger, it needs to incorporate tricks to maintain one's sanity.  Rebuilding Small C in, say, Python, should be a breeze.  

I built a Sector Lisp in Python in a few hours, to try to understand Sector Lisp.

I've got exemplar Ohm-JS to WASM code lying around on my github somewhere...  And, using Ohm-JS' Arithmetic grammar it is easy to see the difference between an interpreter and a compiler.

At this moment, I'm thinking about building - for chuckles - FBP in some uber-language which would boil down to 0D in Python or CL or JS.  Then, of course, I want to take apart the info in an Excalidraw program and use it to generate code (e.g. Python or CL).  I've already done this with draw.io drawings (so, why don't I stop and just document that?)

Turning the tables: I am interested in SICM, but don't want to commit to a string of consecutive Thursday evenings.  I'm taking some adult ed courses which are using up my commit-able evenings and loading me up with homework.  (Wood Carving, Creative Writing, previously Tai-Chi and introductory Art creation (I didn't think that I would need to re-learn how to use a pencil when I retired :-))).

I would be really interested in hearing an update from Ackley.  Or just having Nada Amin expound about towers of interpreters.

I will be watching this space for talks about quantum computing.  I fail to "get it" and hope that hearing about it, yet again, might trigger some understanding.

---

Hints Needed: I am building quickie technical screencasts and am looking for ways to speed up my workflow.

Background: I "write" the story by winging a screencast - screen + speaking - and recording it to Descript.

I need to tighten-up the speaking/audio portion.  There are places where I drag words out as I think, and, the first take is very "stilted" sounding, but, the video of the screen is what I want.  It is easy for me to copy/paste the transciption into an editor and to pare it down to something that I can read out loud.  On the second take, I read the edited script with more inflection.  I want to replace the original audio with the new audio, and, I might need to edit the new audio to line up with action on the screen.

I'm doing this one sentence at a time and it's taking forever.  About one day for two minutes of finished product.  I am wondering if I can improve this workflow but I don't have enough experience to know what to do.

My goal is to have a zero learning curve for doing this, or, at least to come down the learning curve as fast as possible without knowing everything there is to know about Descript while making acceptable-quality technical youtubes.  

Ideally, I should be able to knock these videos off with my iPhone, but, I don't understand what I mean by this.

---

> Should a good tool/framework/language not only "make easy things easy, and hard things possible", but also (generally) make patterns effortless, and anti-patterns painful?

I agree and disagree.  A +tool+ should make anti-patterns painful - yes.  A +tool+ should not make hard things possible.  My ideal +environment+ is one which allows me to choose the most appropriate paradigm/tool for the sub-problem that I want to think about.  That ideal environment should make it easy to compose solutions to uber-problems by plumbing sub-solutions together, regardless of the paradigm used.  To make hard things possible, I should be able to use Assembler (line-oriented or tree-oriented (Assembler, C, etc. vs ASTs, CSTs, Lisp)) and bolt these bits into the overall solution.  The last time I touched such an environment, was the UNIX command-line (#!/bin/bash, #!/usr/bin/env node, #!/usr/bin/env python, etc., etc.).  The problems with UNIX are (1) it over-specifies (!) the format of IPCs by insisting that the special byte 0x0a terminate every blob of IPC bytes, and, (2) the Shell's insistence on using 1D notation (sequential characters, leading to the unrealistic restriction that commands have exactly one input and exactly two outputs (the UNIX kernel allows more of each, but the shell does not encourage this)). 

... e.g. FP : mutation not allowed, sorry, heap?  just another way to say "mutation" - not allowed.  GC?  Only if it is stack (LIFO) oriented (no mutation)

---
Checking to see if anyone knows what's going on here...

I get an alert in Obsidian
```
Failed to save file "notes 7.md" EBADF: bad file descriptor, open '/Users/tarvydas/Library/CloudStorage/Dropbox/ps/notes 7.md'. Make a backup the the contents of this file now to avoid losing data.
```

This looks like I've run out of space, but info says that Macintosh HD has GB's of space.

"df", though says:
```
Filesystem     512-blocks      Used Available Capacity iused      ifree %iused  Mounted on

/dev/disk1s5s1  976490568  17324072  22144616    44%  348574  110723080    0%   /

devfs                 405       405         0   100%     702          0  100%   /dev

/dev/disk1s2    976490568   3531096  22144616    14%    1622  110723080    0%   /System/Volumes/Preboot

/dev/disk1s4    976490568  20978768  22144616    49%      11  110723080    0%   /System/Volumes/VM

/dev/disk1s6    976490568     13312  22144616     1%      18  110723080    0%   /System/Volumes/Update

/dev/disk1s1    976490568 909995360  22144616    98% 3335506  110723080    3%   /System/Volumes/Data

map auto_home           0         0         0   100%       0          0  100%   /System/Volumes/Data/home

/dev/disk6s1       585904    438392    147512    75%       6 4294967273    0%   /private/var/folders/10/gst85pds4px9y2b9xs8mm1900000gn/T/CxJyfV
```

noting that /System/Volumes/Data/home is 100%.

Suggestions?

---

testing after cold-boot

---

various comments that came to mind ...

a) aside: are you aware of Paul Morrison's Flow-Based Programming? (If not, I can supply more info, including a discord link)

b) There is ONLY ONE thing that matters to end-users in the end: how inexpensive is the machine?  Do end-users care if you used Emacs, VIM, VSCode, etc.?  Nope.  Do end-users care if you used functional programming, OOP, C, or raw assembler?  Nope.  Can the end-user waltz into WalMart and buy your hand-held game machine in the home furnishings department off-the-shelf like a toaster or can they run your product on an rPI or do they need to buy a full-blown laptop paying tax to Microsoft or Apple?  Is the product guaranteed to work or does it need frequent updates?

c) CALL/RETURN uses the call-stack - a LIFO.  Queues use FIFOs.

d) To be able to Architect software, you need to get rid of the concept of Loops and Recursion (these concepts are valid only in call-stack based code).  I think in terms of messages being shepherded between Output and Input queues and explicit feedback.  I'm not sure how to think about this in terms of streams. ?  For example, "loop 2 times {print "hello"}" becomes "when input > 0 {print hello ; send self (input - 1)}"

e) The "trick" is to think in terms of 2 kinds of Components - recursive Container components and Leaf components.  I think that this corresponds to Packages and Wares, resp, in the paper. ?  (Containers compose Components by joining them up via streams and messages, Leaves are just "code" as we know it with the ability to call functions AND the additional ability to send messages).

f) Stepping stones ... Call/Return Spaghetti https://guitarvydas.github.io/2020/12/09/CALL-RETURN-Spaghetti.html, ALGOL bottleneck https://guitarvydas.github.io/2020/12/25/The-ALGOL-Bottleneck.html.

g) Programming Languages were invented in the 1950's, operating systems came soon after.  It is now 2023, (approx. 70 years later) and I just had to preventative-reboot my MacBook because I was beginning to get random, unexplained errors in apps that worked OK yesterday.  What is wrong with this picture? Functional Programming will surely make this all better, right?

---

possible bug? 57.1.1-beta-20230201.8 (x64) - audio disappeared when I added scenes to a script.  Details: I wrote a script in Obsidian, copy/pasted the script into a new video project write mode and waited for it to be transcribed.  I assigned the canned speaker "Henry" to it and listened to the result.  I created 19 scenes and pasted stock video clips (from the media library) into the scene thumbnails (left column of screen).  I played the result and the audio was gone - the textual script is still there, the video clips are still there.  I am re-tracing my steps one scene at a time and no problems yet.  This is probably operator error, but resulted in an annoynig experience.  I still don't know what I did.  If it helps, the project is 

---

annoying UX issue: 57.1.1-beta-20230201.8 (x64) - Space bar toggles PLAY of the recording, EXCEPT when the recording has hit the end.  In that case, another space bar jumps to the beginning of recording and starts playing again.  I use spacebar to start/stop playback to review my video and have been bitten many times by hitting spacebar at the end of recording and having it begin playing again.  Example - I position the mouse on the 2nd-last sentence and hit spacebar to start PLAY.  The clip plays and I hit spacebar to stop playback. I position the mouse on the last sentence and hit spacebar to start PLAY.  The sentence runs to the end and playback stops (on its own), I instinctivly hit spacebar (to stop?) but playback begins from the top. I don't expect that to happen - when I press spacebar to start playback, I expect the next spacebar-hit to stop playback (even if its stopped).  [If you map this behaviour onto an OFF/ON toggle switch, you see that the behaviour is inconsistent - most of the time OFF means OFF, whereas sometimes it means ON]

annoying UX issue: 57.1.1-beta-20230201.8 (x64) - MacOS Ventura on MacBook.  My mouse doesn't always control the cursor.  Sometimes, I click the mouse on a word that I want to begin playback at, but the trancript is window is fully redisplayed, leaving my cursor in a location elsewhere on the screen.  This behaviour confuses me and breaks my flow. Thus far, I have not been able to reproduce the problem in-the-small (by copy/pasting sections into a temp composition), I only see this behaviour in larger pieces which scroll off the top and bottom of the text window.

---

Today's labours.  Being a Director instead of doing it all myself.  Letting an AI voice actor do the talking. If you have time (I know that you have copious spare time :-), criticism on several fronts would be appreciated:
Compiler Generators -> A.I. https://youtu.be/FmnYKlW8MEM

Also, of interest, videos made last week, with me talking.  Not published yet:
FAB GhostStars https://youtu.be/3XpoAaSmqRE
BREX P.O.C. https://youtu.be/gLlD_k9Rfs8


---

a) I consider IF-THEN-ELSE to be the root of many evils.  It is "too general" and allows one to construct ad-hoc control flows.  (McCarthy specified COND, which maps functions to values, but, was not meant to be a control flow concept).

b) There used to be a time when CPUs gave equal weight to function calling and to co-routining.  Function calling is an attempt to graft mathematics notations onto CPUs.  One difference is that mathematics notation requires instantaneous textual replacement of functions ("referential transparency").  CPUs have propagation delays which make it "impossible" to graft 0-time concepts onto electonics.  A lot of epicycles have been invented to get around this issue by completely ignoring it (e.g "operating systems").  [aside: "instantaneous textual replacement"?  Isn't that what Microsoft Word "find-and-replace" does?]

c) I enjoy your perspective.  Mathematical "algorithms" are not the same as "electronic machine algorithms".  Electronic machines have "mutation".  Period. "Mutation" is also known as "RAM" (and caches, and registers, and ...).  Models of mathematical-only algorithms using electronic machines is not the same thing as models of electronic machines in general.  Using only functional notation to express electronic-machine-algorithms snips off a bunch of possible avenues of thought.

d) Abstraction.  "Lambda" is a way to lasso and abstract code.  But, so is a rectangle drawn on a whiteboard.

---

- GEM - generalized electronic machine ("computer" / laptop / tablet / iPhone / rPI)
- calculators compute - send some equations + data in, get an answer out
- can GEMs compute? yes
- is that all that GEMs can do? nope
- rrPI = rasin-sized rPI (Raspberry PI / Arduino / etc.) == GEM

I agree.  Thanks for the link.

Computers don't just compute.
