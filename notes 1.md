need:
- REASons for using Ohm
	- https://guitarvydas.github.io/2021/08/30/Ohm-JS.html
	- [ohm in small steps](https://computingsimplicity.neocities.org/blogs/OhmInSmallSteps.pdf) and https://guitarvydas.github.io/2020/12/09/OhmInSmallSteps.html
	- arithmetic github https://github.com/guitarvydas/arithmetic
	- [PEG cheat sheet](https://computingsimplicity.neocities.org/2021/PEG%20Cheat%20Sheet.pdf)
	- PEG/Ohm https://guitarvydas.github.io/2021/08/30/Ohm-JS.html
	- 

- FP pattern matching
- code formatting suggestions
- appendix using PEG for Ohm-like grammars
	- left recursion?
	- splitting grammar from semantics

- exercise: S/SL ohm
- exercise: TXL ohm
- continuations - across and down
- heal thyself (AKA "eat your own dogfood")- add @ (continuation) operator to ohm syntax
- def vs. ref
- peepholer
- - pattern matching operations vs. capture
- exercise - make prep that returns js objects instead of strings
- exercise add path testing to s/sl
- parsing indentation-based languages, e.g. Python
- parsing markdown
- markdown as a programming language
- glue syntax layer for generation of semantics code
- do all examples as .html using pure Ohm-JS, no prep
- backtracking
- syntax directed
- tree transformation (nested lists are trees)

[*We split mathematics into two broad categories:*
1. notation
2. thinking.
*Note that mathematical notation reduces to simple text editing, i.e. string manipulation.  If it's good enough for mathematicians, it's good enough for us.*]

Other stuff, maybe of interest:

[PEG Cheat Sheet](https://guitarvydas.github.io/2021/04/02/PEG-Cheat-Sheet.html)
[REGEX vs PEG](https://guitarvydas.github.io/2021/03/24/REGEX-vs-PEG.html)
[Racket PEG](https://guitarvydas.github.io/2021/03/19/Racket-PEG.html)
[PEG vs Other Pattern Matchers](https://guitarvydas.github.io/2021/03/17/PEG-vs.-Other-Pattern-Matchers.html)
[PEG](https://guitarvydas.github.io/2020/12/27/PEG.html)
[What If Making A Compiler Was Easy?](https://guitarvydas.github.io/2021/04/26/What-If-Making-A-Compiler-Was-Easy.html)
[Glue tool](https://guitarvydas.github.io/2021/04/11/Glue-Tool.html)

- idiom for balanced parens
- idiom for macros (applySyntactic)
- idiom for right recursion (a(b(c d)))
- idiom for left recursion (((a b) c) d)))
- idiom for matching idents vs. keywords
- idiom for re-using rules (RY instead of DRY), declaration vs. definition
- embedded code
- idiom for identity matching
- mangling
- idiom for math

- balancedParens.ohm + balancedParens.txt
- macros.ohm + macros.txt
- rightRecursion.ohm + rightRecursion.txt
- leftRecursion.ohm + leftRecursion.txt
- ident.ohm + ident1.txt + ident2.txt
- ry.ohm + ry.txt
- nested.ohm + nested1.txt + nested2.txt + nested3.txt

references
- ohm github
- ohm-editor
- ohm math
- abc
- abc glue
- abc wasm
- blog (free version)
- code github
- blog for RY
- 

## leftovers
like regex101
	- ohm-editor is like regex101, but for Ohm (PEG)
regex
separation of concerns
why Ohm is better than PEG
	- separation of concerns
	- left recursion
	- Ohm is a DSL based on PEG idea
why PEG is better than REGEX
	- backtracking
	- call rules
diff -w for automatic regression testing
embedded code can be matched by tokenizer, then passed down the pipeline for further matching
unspoken: this code and `prep` are experimental, hope that someone will volunteer to maintain them

## free version

## leanpub settings
- cover
- classification
- dedication

---

Nov 18, 2011

> Would you want to package py0d as a python library to be installed in pip `pip install py0d` or is this a prototype/throwaway project?

I don't know how to make pip installable code. I don't know what the implications are.

Py0d is probably useful in its own right, but, I see it as a gateway drug to more-general ė concepts, such as drawware.

If py0d is not too broken, it should be made available.

---

1. Hmm. If you find the name of the electrician, do let me know - no hurry.  The charger works with the extension cord but ONLY if I plug it into the top receptacle of the same plug.  Hmm.  I think that I read that the ground fault detector in this box sends a trickle current into GND (3mA?) for ground fault testing.  I need to think about what might be going on...
2. We probably haven't changed the furnace filter since spring?  I should call for a furnace inspection.  Probably depends on your schedule, since he's going to need to go downstairs...
---

CPS is GOTO - ad-hoc and unstructured.
insignificant: "Haskell is implemented using GOTO", "Haskell is implemented in Assembler"
significant: "This new notation supports the return of GOTO, hence, allowing programmers to break the tenets of Structured Programming"
GOTO is required for compiler-writing.  CPS is a variant of GOTO that allows writing compilers in a purely functional manner (AKA "denotational semantics").  IMO, compiler-writing will be replaced by SCN-development. Otherwise, the use of GOTO/CPS should be strictly forbidden. [SCN - little DSL, Solution Centric Notation]
experiment: try to understand/debug a program written by someone else (or by yourself, after a sufficient amount of time) that uses CPS
Some people naturally write structured GOTO (er, CPS) programs.  Most don't.
Significant: Functions use the callstack (LIFO), whereas Components use queues (FIFOs)

sync: all parameters arrive at the same time in a block (can be desctructured by the receiver into separate datums)
async: parameter blocks arrive at different times
sync: all return values are sent at the same time in a block
async: the concept of "return value" is obsolete, a Component can Send() outputs at different times

---

FYI FBP: 
- Discord: https://discord.gg/YBQj6UsD5H
- Google group: https://groups.google.com/g/flow-based-programming/
---

CPS is GOTO

Déjà vu all over again.

Continuation Passing Style - CPS - promotes ad-hoc and unstructured code.

CPS is GOTO.

insignificant: "Haskell is implemented using GOTO"
insignificant:"Haskell is implemented in Assembler"
significant: "This [new] notation supports the return of GOTO, hence, allowing programmers to break the tenets of Structured Programming"

GOTO is required for compiler-writing.  CPS is a variant of GOTO that allows writing compilers in a purely functional manner (AKA "denotational semantics").  The use of GOTO/CPS should be strictly forbidden for anything but "systems programming" (compilers, interpreters, SCNs, transpilers, gradual transpilation, etc., etc.)

---


if-then-else is ad-hoc

We are taught to dislike State.

State is not bad.  

Ad-hoc use of state is bad.

One of the main culprits in the misuse of State is "if-then-else".

Usually, the syntax is something like `if <expression> ...`

In the ad-hoc case, `<expression>` can be anything (including State).

The programming community has, painfully, found ways to de-ad-hoc-ize certain use-cases of `if-then-else`:
- OO is `if-then-else` on Type (method invocation uses `if-then-else` and `case` on Type, under-the-hood)
- PROLOG, miniKanren, etc., etc. is exhaustive search.  All too often, exhaustive search is written in ad-hoc manners using `if-then-else`.

In 1950, it was unimaginable to waste CPU resources on concepts like OO and backtracking (PROLOG, Early's method for parsing).  In 2022, there is no good reason to avoid using these techniques.


---

Deprecating Operating Systems

Operating Systems have two (2) functions:
1. Scheduling apps
2. Libraries of functionality and portability

Scheduling, (1), has become over-complicated due to the use of functions.  Functions perform ad-hoc blocking (e.g. waiting for callees to return) and fight with the scheduler over who gets to decide when blocking is to be used.  Our dislike for "concurrency" is based on the tangled mess that scheduling has become.

Creating portable libraries for hardware devices, (2), is just hard work.  It is made even harder by the insistence on using synchronous programming languages (i.e. any language that promotes the use of functions and the call-stack).

---

Lisp is Assembler

Assembler is line-oriented assembler.

Lisp is tree-oriented assembler.

---

> 1.  One of the things about the AI generation stuff is, now it's doing things that people actually like and enjoy doing -- I get a lot of pleasure out of artistry, for instance. 

Profit: there is less profit in making you very happy than in making many people only slightly happier.  Profit can be divided and conquered: (1) good side: profit drives technological progress, technlogical progress removes impediments to creativity (you can now invent artefacts without having to spend decades practicing how to use a pencil) (2) dark side: profit drives the concept of "trade secret" which leads to lying and to refining the art of lying (i.e. Hollywood).  Hmm this line of argumentation seems to say that humans are driven by profit leading creativity to be only a secondary issue... 

> Why would I want to outsource the fun bit? The good stuff. It's what makes the annoying parts bearable. But if we don't have that, then are we all doomed to become insurance salesmen?

That's just some old guy talking...

The fun bit is creativity, not the mechanics of using specific tools to express creativity.

---

Mundane question: On Safari and Chrome, these lines update 3 boxes.  On Firefox, only the 3rd box is updated.  I don't see what's wrong.  It must be me, or else a billion websites wouldn't work...
```
      document.getElementById(srctextarea).innerHTML = src;
      document.getElementById(grammartextarea).innerHTML = grammar;
      document.getElementById(fabricatetextarea).innerHTML = fabricate;

```
---
> ... the medium provides vital feedback to the expression of the artwork ...

Not just Artwork.  I see this happening in Programming.  I think that most popular programming languages are stunted.  It boils my blood to see such wastage...

---

FYI Aside: This kinda shows why I didn't dig into this deeper.  I go for a breadth-first "anything that will work with the least amount of thinking on my part" approach and avoid reading walls of text (legalese) that try to explain /everything/ to me at once.

... After 40+ years, I still learn new things about emacs.  I refuse to read about all of the nuances in Common Lisp, ...

---

Ah, yes.  Thank you!  The right-arrow button "dives" down into another space.  The "links" buttton on the ">" right-side menu lists all of the "come-froms" for a space.  This indicates a big hole in what I think I wanted.  Spaces are not always arranged in a hierarchical tree. More thought / discussion / use needed...

---

Yep.  A huge disconnect I see in Programming Languages is that libraries of code are not fully independent.  Humans grok independence and struggle with clock-work synchrony.  Almost all of our languages uses function calls which quietly embed dependencies into the code.  The answer turns out to be disgustingly simple - don't use the call stack, a LIFO, use FIFOs (queues) instead.  NPCs and Robotics would be immensely simpler if we didn't insist on using function calls exclusively.  Sigh.

---

In storyboard, is there a shortcut to punch in 2 words using my overdub voice?

"D" and "@" seem to do nothing.

I want to change "We need leaf code and we need contain" to "We need leaf code and we need container code" where the last 2 words are spoken by my overdub voice.

---

> visual programming fits very well here because of the graph nature of FBP

FBP is about escaping the von Neumann paradigm.

0D (LIFOs instead of FIFOs) enables concurrency.

Concurrency enables programs as diagrams.  The big win in Concurrency is what I call 0D.

0D enables diagrams as programs.

von Neumann paradigm === clockwork, everything is synchronous, tells: Call/Return, uses: LIFOs, call-stack, etc.

Needed to breakg away from the von Neumann paradigm: Components that are asynchronous by default, Call/Return is the exception, not the rule ... 

There was a time when the call-stack was not directly supported by hardware.  Clockwork-lovers caused the invention of the call-stack.  Concepts such as internet, robotics, blockchain, etc., etc., make low-level-clockwork-as-the-default less desirable.

[Aside: Can you write diagrams as programs using clockwork code? Yes. Is it more difficult than necessary? Yes.]

[Aside: Concurrency is mostly anti-clockwork.  To express concurrency in clockwork code, you need to invent epicycles, like Operating Systems that support Preemption, e.g. Linux, Windows, MacOS, ROS, etc.]

[Aside: Concurrency breaks down into 2 aspects: (1) 0D, (2) Simultaneity.]

Optimization of code can be done in many ways. 

One way is to insist that all code be written in a clockwork manner.  This makes optimization easier, at the expense of making design harder.  IMO, most popular languages choose this option (an idea which has not been revamped since the 1950s) (e.g. Python, Rust, etc.)

GCC, though, optimizes after-the-fact.  GCC basically uses RTL, which comes from Fraser/Davidson peepholing, which is generalized by Cordy's OCG (Orthogonal Code Generator).  Further, GCC pulls some Dragon-book magic out of the hat and applies it to the basic RTL-generated code.

---

So, I think you're saying: 
- most people would already have seen this stuff
- what I like is your filtering of the firehose,
	- your "knack" is actually a "knack" for highlighting things that also interest me (without forcing me to view and filter the firehose)
---
> As long as we're running our software on VNP hardware, demanding concurrency for everything is going to limit the efficiency of software.

I think there are many hidden assumptions in this statement, for example, the wish that there must be a one-size-fits-all solution to all of our programming problems.

Define "software": programs written for post-call-return hardware or programs written for pre-call-return hardware (e.g. IBM 360, iirc)?  Or, programs written for single-threaded CPUs or programs written for distributed computing, e.g. internet, IoT, blockchain, robotics, etc.?

Call-return is already inefficient on current-day hardware.  Call-return is used in 2 ways - (1) to help developers build software in a DRY (Don't Repeat Yourself) manner and (2) to reduce code size by sharing code chunks.  Insisting that ALL code be slanted towards (1) creates runtime inefficiency in the end-user product.  DRY could be handled by better editors, and does not need runtime Call/Return.  We see languages backing out of this corner by supplying "inline code" "optimizations".

If raw efficiency is wanted, there is nothing better than assembler.  Forget OOP, forget FP, etc. - all of that High Level Language (HLL) stuff just wastes CPU cycles.  Don't even bother with Call/Return and the call-stack, just unroll everything.  We don't do that. Why?  Because OOP and FP slant the emphasis (ever so slightly) towards developer efficiency.  Can you compile-out all OOP-ness and FP-ness to deliver lean end-user apps?  Yes.  Is there only one way to do that?  Nope.  GCC's use of RTL peepholing technology shows at least one other approach.

Another example of indoctrinated thinking: do you NEED declaration-before-use?  It ONLY helps developers (e.g. to find typos).  End-users don't care about declaration-before-use, but they pay for it in increased development time (I would prefer to write code so that the-most-important stuff comes first, so that it's cheaper to explain to developers that are newly hired).  And, declaration-before-use is based on 1950s hardware.  Today, we don't need to insist on declaration-before-use.  Even VNP hardware is fast enough - today - to run multi-pass compilers.  Compilers could easily say "hey, this variable appears only once here and there is no declaration for it anywhere".  (Compilers could do even better, but, let's stop there for now).

Anonymous functions were invented in 1956 (Lisp 1.5), but, systems people insist on applying Greenspun's 10th Rule and roll-their-own closures (calling them "processes").

If you insist on writing code using ONLY Call/Return and you allow Loops (based on 1950s thinking), you WILL be forced to use epicycles to maintain your fiction. Preemption is an epicycle created by 1950s thinking which saves CPU cycles by sharing CPUs and saves memory by enabling mutation.  The 2022 solution to concurrency is: just buy another Raspberry PI and don't waste time trying to share memory and CPU cycles

---
I think there are many hidden assumptions in this statement, for example
- the wish for a one-size-fits-all solution to all of our programming problems
- the definition of the term "software"
- the definition of the term "efficiency"
- the assumption that "correctness" can only be solved by adding code bloat and state explosion


- stop using Call/Return as a catch-all for programming, especially when a better editor would do
	- Call/Return is used in 2 ways
		1. to help developers build software in a DRY (Don't Repeat Yourself) manner and 
		2. to reduce code size by sharing code chunks.  

Programming languages abuse Call/Return and cause runtime inefficiency by solving (1) at runtime.  This problem could be fixed by the creation of better editors. In fact, much of OOP could be done by creating better editors instead of punting code reuse to the runtime use of Call/Return.  Any language that uses function calls at its core is probably using Call/Return inefficiently.

Here's a very simple example.  A developer might write:
```
function firstapp () { return 5 + 1; }
function secondapp () { return 8 + 1; }
```
This code can be DRY-ified as:
``` 
function add1 (x) { return x + 1; }
function firstapp () { return add1 (5); }
function secondapp () { return add1 (8); }
```
The helper function `add1` has been added to help the developer *only*.  The machine doesn't care if it sees:
```
firstapp:
  LOAD R0,5
  ADD R0,1
  RET
secondapp:
  LOAD R0,8
  ADD R0,1
  RET
```

or, if it sees:

```
add1:
  ADD R0,1
  RET
firstapp:
  LOAD R0,5
  CALL add1
  RET
secondapp:
  LOAD R0,8
  CALL add1
  RET
```
The inserted CALL in the second code sequence adds CPU cycles and is inefficient.

The machine doesn't care if code is duplicated, only developers care. DRY is a way of avoiding bugs due to Copy/Paste during development.

If our editors tracked which blocks of code were "the same", we wouldn't need to use runtime Call/Return for DRY.  Diff and git demonstrate that we know the algorithms for tracking code similarity.

In fact, we see programming languages attempting to back out of this corner by detecting "inline" functions.

[Aside: Note that the second code snippet uses a global variable to store return bookmarks.  We call this global variable "the call stack".  Note that Call/Return, both, mutate this global variable and its associated pointer (SP).]


Programming Languages are simply 1950s IDEs for programming.  It was easier to use fixed-size, non-overlapping bitmaps instead of vector graphics, so we invented the HCI called "characters" and based new-fangled programming IDEs, called "programming languages" on those principles.  HCI for end-users has progressed since the 1950s, but HCI for developers has stagnated and still uses old-fashioned concepts.  At a minimum, we might try using SVG Elements instead of ASCII in new programming languages.

Note that "functional notation" was invented for use on clay tablets and paper, but, does not address the newer medium that we call "computers" (3D, vector graphics, easy replacement/erasability, tracking change history, etc., etc.)

---

1. HN - I've written some of a reply to the Little Languages article https://publish.obsidian.md/programmingsimplicity/2022-11-22-Little+Languages+are+SCNs+-+The+Future+of+Programming.  What happens if I were to reply to that thread?  Are the participants notified, or, does someone need to know to search for the thread?
2. You do know that I continue to blog, but I'm now doing it with Obsidian Publish...
3. Checking / seeking opinions: comments - I like Obsidian for writing, but, I think that the main failing of Obsidian Publish is that the blogs don't have comments sections.  OK commenting: Github issues, uterrances-commenting attached to my github Pages essays.  The BEST commenting is: google doc style, where comments are attached to the paragraphs themselves.  Do you agree?  Or, am I missing some even-bigger issue?  What I want is something that doesn't need manual intervention - I want to write and hit a Publish button, then I want to be notified of discussion.  Other ideas: Discord Forums would work, but, ATM, would require manual intervention from me. Jenna says that utterances does not work with Obsidian Publish due to security concerns.  Kinopio would be great, but has the manual-intervention-from-me problem.

---

My experience is weird.  I see something in the show and say “oh yeah, I know that”.  Then, I realize that I know it because it was in one of his books.

> What's your interest in this topic? Are you trying to answer a particular question for yourself? Is this software engineering related :)

It’s not so much an active interest but an ever-increasing alarm in the realization that I've been lied to.

My most general goal is to "know everything".  (Obviously unattainable, so I have to settle on knowing just a little bit about everything - even that goal is unattainable :-).  As I look into things, I discover details that were hidden from me.

An example is my EE training.  I spent 7 years elapsed time in University (a year off for Mononucleosis, 3 years heading in the wrong direction (Physics, instead of EE)).  During that time I learned almost nothing about Nikola Tesla.  Instead of being exalted as having lifted humanity out of darkness, his accomplishments were hidden from me (the info is beginning to leak out now, they've even named a car with his name).  I still remember driving to the US via Niagara and seeing a statue of him not far from the power-generating station.  Before Tesla, we didn't have control of electricity nor nighttime darkness.  After Tesla, we have power outlets in every room, we have streetlights, dishwashers, radio, etc., etc.

I am puzzled as to why Tesla is "new" to me and I'm trying to figure out why.  Then, there's Steinmetz.  Sigh.

I - now - see something similar happening in software.  60+ years of "progress" has brought us - bloatware.  Why?

pt

---

The way I see it, Code is a UI.  It's the 1950s solution to the problem of "how to replace this bank of toggle switches by something more flexible".  IMO, we need a new UI for programming, devised for computers and problems of 2022 (which, unlike computers of the 1950s, are distributed and no longer memory-constrained, etc.).  I favour the idea of using SVG Elements, instead of Characters, in the design of 2022+ programming UXs.

---

My idea of a programming language is:
![[hello world eh-helloworldworld 1.png]]
which I dumb down to:
![[hello world eh-helloworld 1.png]]

I slapped together a Makefile that demonstrates a draw.io to .JSON transpiler.  Draw.io is a lot like SVG - it's a better technical diagram editor than anything I know of (suggestions welcome).  Clone https://github.com/guitarvydas/eh and type 'make'.  This stuff is WIP and contains a bunch of other issues that interest me (0D, transpiling the generated .JSON to Python and to CL, incremental transpilation, synonyms, etc., etc.).  ATM, only the build of helloworld.json works, and the rest of the build process breaks.  Maybe I'll fix the build script in the morning...

ATM, the code drops into PROLOG to infer semantic information about the diagram.  I think that this can be done more simply, e.g. using Ohm-JS, but I haven't done it (yet).

I wrote a bunch of point-form notes regarding AHAs w.r.t. DaS (Diagrams as Syntax) using SVG.  If you find this interesting, the notes are at: https://publish.obsidian.md/programmingsimplicity/2022-11-24-Parsing+SVG+Languages

---

Elsewhere, I mention the idea of using stripped-down SVG as the basis for new Programming Languages.  Ohm-JS makes it possible to think about this.

Trimming most of the detail, here is a trivial example of an SVG file:
```
<svg version="1.1" width="300" height="300" xmlns="http://www.w3.org/2000/svg">
  <rect fill="gray" stroke="black"/>
</svg>
```

I've written a trivial parser in Ohm-JS:
```
SVG {
  Blueprint =  "<svg" stuff ">" GraphicObject+ "</svg>"
  GraphicObject =
    | Rect
  Rect = "<rect" stuff "/>"
  stuff = (~">" ~"/>" any)+
}
```

A screenshot of the parse, in Ohm-Editor, is:
https://github.com/guitarvydas/svg/blob/main/parser.png

The code is in my github [svg](https://github.com/guitarvydas/svg)

In my mind, SVG Elements are Atoms, and characters are but Quarks.

Ohm-JS insists on having me deal with Quarks.  I use Ohm-JS to describe Atoms and to build Molecules out of Atoms. Molecules can then be used to define new programming languages.
![trivial SVG parser](parser.png)
---
FYI - I've switched from writing Lisp macros using Trees (AKA Lists) to writing macros using Characters using Ohm-JS.

---

> On Nov 26, 2022, at 6:29 AM, Rajiv Abraham <rajiv.abraham@gmail.com> wrote:
> 
>   
> 
> My comments inline for your general comments  
> 
>   
> 
>   
> 
> On Fri, Nov 25, 2022 at 5:19 PM paul tarvydas <[paultarvydas@gmail.com](mailto:paultarvydas@gmail.com)> wrote:  
> 
>   
> 
> RA: I'm a bit embarrassed. I envisioned each 'box' as a Lively Kernel Object/FBP Object but I never made the leap that it could now be a 'eh' object though I've read about `eh` for a few hours. This is exciting indeed.

  

Observation: 

- function calls make the code synchronous (yes, you CAN create asynch code using function calls, but you have to jump through hoops (“epicycles”))

- synchronous code is always brittle

- There are 2 aspects to program design:

— 1. what the computer needs (very clear instructions) (computer scientist PhDs deal with this sort of thing)

— 2. what the end-users wants (end-users want to elide “complexity” - they don’t plan on getting PhDs in Computer Science (analogy: Physicists vs. non-physicists - Physicists talk about Atoms and Quarks and Leptons, non-physicists just use the materials and build things with them))

—— the Trick is to get a +smooth+ transition from 2 to 1

——— at the moment, we mostly ignore (2) and deal only with (1) (for example, declaration-before-use is a (1) issue and is just annoying to end-users)

——— (2) is “Art” and “Design”

——— (1) is “Science”

——— we let (1) guide us to what a Programming Language needs to be, then we foist these concepts off onto (2)

——— in my mind Ohm-JS + 0D make it possible to wrap skins around (1) and to make software that satisfies (2) more

——— Ohm-JS lets us wrap “syntax” skins around hoary principles (“paradigms”)

——— 0D lets us wrap objects in write-and-forget LEGO blocks (sync code - functions - doesn’t give us LEGO).

——— This combo - 0D + “syntax” - makes it possible to do Science AND to wrap apps in end-user-friendly stand-alone “objects” (LEGO blocks) (the Science is inside LEGO blocks, end-users can avoid knowing about the insides of LEGO blocks)

  

> ...

  

> re: the power of visual languages. I'm so happy that your diagrams are blurry ...

  

The ONLY reason we use text and not diagrams for programs is that in the 1950s, computer hardware could handle text, but couldn’t handle vector graphics.  We develop modern technologies for non-programmers, but, programmers themselves are still stuck in the 1950s.

Well, the other reason is that we are used to using writing technologies based on clay tablets.  After 2,000 years, we've progressed to using graphite and rubber on paper.  We didn't imagine that computers were something other than "better clay tablets".  Our continued use of 2D writing technologies has severely limited the way that we think about things.  We write equations in 2D to express simple physical concepts, like sound, that are 4D phenomena (x/y/z/t).  Mathematics seems complicated to many people, because it is not natural and is a round-about way of describing multi-dimensional phenomena that we experience daily.  Complexity comes from the fact that we try to describe 4D effects by collapsing them down to 2D.  For example, Mechanical Engineers are taught to draw multiple 2D views of simple 4D objects (top, front, side, and simply ignoring time)

  

Further: it is just plain hard to write a diagram using a synchronous (function-based) language.  It begins laughingly simple to draw diagrams if you use 0D components (rhetorical question: why can we draw diagrams of computer networks?  Because each node on the network is - essentially - a 0D component.  Why don’t we do everything this way?  Uh, because of our built-in fear bias regarding “efficiency”.  We are preconditioned to worry about saving bytes instead of saving development time (and thereby, enabling the trickle-down effect to end-users)).

  
Further further: computers in 2022++ are different from computers in the 1950s.  In the 1950s, each computer had only 1 CPU and limited memory.  In 2022++ we want to build distributed systems (blockchain, IoT, robotics, internet, etc.).  Ideas from 1950s don’t map very well to 2022++.  But, we continue to force ourselves to use ideas from the 1950s.  Sigh.

> >   
> > ...

  

> RA: I wonder how hard it would be to write a ClojureScript library wrapping ohm js. Worst case, one can directly call JS from ClojureScript(CLJS) so one could work in clojurescript and call Ohm when

> required, if you don't have an aversion to clojurescript.

  

I don’t know Clojurescript, but, my guess is that it boils down to Javascript.

  

Ohm-JS is written in Javascript, so, it should be easily possible to bolt Closurescript to Ohm-JS.

  

In fact, if one were to write an Ohm-JS 0D component, one wouldn’t CARE what Ohm-JS was written in.  Bolting Closurescript to a Component becomes a simple queue-based API thing.

  

(I’d bet that I’ve already done this or know how to do it.  Food for thought, maybe I have my priorities wrong.)

---

I think that I want to experiment with recording myself using my iPhone, reading from a script then Descripting.

I write text on my Mac (Obsidian, to be exact). 

I think that I want to turn my iPhone into a teleprompter.

Any recommendations?  (I'm new to this and find that there are too many choices).

---
Short reply: 

0D (aka Concurrency) gives you Referential Transparency.


Longer reply: 

This raises a bunch of issues, like "what is efficiency?" and "what is programming?" and ...

I think that efficiency breaks down into 2 diametrically opposed categories:
1. efficiency of the end product (cost, speed, size, etc.), and,
2. efficiency of development (ability to imagine bigger and better solutions ; ability to deliver an MVP sooner).

I think that most "programming languages" conflate the two issues, with overwhelming emphasis on end product efficiency, at the cost of development brain-power.

If (1) is the most important, then code should be written in Assembler.  Forget all of that type-checking stuff.  Functions calls are currently over-used and cause inefficiencies (we can witness "programming languages" trying to back out of this corner through the invention of epicycles like "inline functions" and JIT).

Type-checking, like syntax-checking, is a helper ONLY for developers, not end-users.  Machines don't care.

Some developers like to use type-checking to develop their designs.  All developers use "compilers" to transpile their designs into type-1-efficient code.  "Compilers" want to know details, like types, so that they can emit tighter code.  (N.B. "Compilers" are apps for developers.)

If a language emphasizes (most of which don't) type-2 efficiency, then, the ONLY thing that matters is whether the developers' souped-up hardware turns ideas/tests around "fast enough". If we waste resources inserting developer-only help, like type checking, then why not insert concurrency and 0D, too?  Then, it only remains to prove that concurrency and 0D help development efficiency.  In fact, most modern languages already have the bits and pieces needed to write 0D code - closures and FIFO classes.  

BTW, thread-libraries are a mish-mosh of conflated ideas and have given concurrency a bad smell for a loooong time.  Thread-libraries are ad-hoc, assembly-like, low-level stand-ins for closures (Greenspun's 10th Rule) that cause unexpected bugs (e.g. Mars Pathfinder disaster) and development pain.  Thread libraries are ad-hoc attempts at accomodating mutation and time-sharing in code - all unnecessary in 2022++.

[BTW, Jack Rusher makes a good case for using Lisp Restarts in https://www.youtube.com/watch?v=8Ab3ArE8W3s. 
I wouldn't be surprised if partitioning code into 0D Components were to simplify Restart support (Restarts can be likened to hot-loading, but different).]

0D (aka Concurrency) gives you Referential Transparency. (Without all of the handcuffs that come with FP).

---

Lisp, S/SL, PROLOG, UNIX shell all come down to the same idea: separate technical needs from user needs, build an engine, give the user "Declarative" syntax / access to the engine.  Write code that writes code.  Write code that optimizes the Declarative syntax and accesses the engine in various ways.

This used to difficult to do.  You were either stuck with Lisp syntax (non-syntax) or S/SL pre-processing or spending years to write the new Python 4 using stock compiler tools like YACC/Bison/ANTLR/etc.

Now, with PEG, it is possible to knock off syntaxes quickly.

So, the approach might be: 
1. write fake code for both use-cases
2.  write an engine that satisfies both use-cases
3. write syntax skins that look like they were specifically designed for each use-case.

In doing (1), don't restrict yourself to using only text, use a white-board.  Imagine that a CEO has white-boarded his vision, or, better yet, get a real CEO to white-board his vision for you.  Then, write code that transpiles the white-boarded image (probably some sketches of boxes and lines and text) in layers until you get a "script" that invokes the Engine.

I was going to say that, with experience, you go from actually writing fake code in (1) and being able to "do it in your head", but, I just realized that I still do (1) explicitly (using draw.io or small snippets of stuff in Emacs).

As I write this, I realize that this is what I've always done.  In consulting, I've assumed that my Customer knows the Domain better than I do, so I don't even bother to try to understand their Domain, I just create a stack of scripts that transform the Customer's chicken-scratches to executable Code.  In stages.  I guess that I've build up some kind of experience that says "to write code that transpiles B->C, I need to transpile from A->B first".  Turtles all the way down, transpilers that transpile to meta-syntax for the next transpiler.  My first SateChart compiler was 8 passes (but I understood each pass well enough to implement each pass ; each pass was simple-enough for even me to write a transpiler for using stone-age tools).

That attitude is what Functional Programming is all about.  "No Mutation" isn't just a rule pulled out of thin air.  It's a way of life if you want to transpile text.  But, "Mutation" is a must in computers.  How do you get both?  Start with a syntax that has no mutation, then transpile.  Repeat until you get to the Engine (which has Mutation).

Until PEG, we only had Microsoft-Word (Find and Replace) and REGEX level transpilation at our fingertips - only a line at a time, which ain't good enough in general.  With PEG, you can transpile "structured / nested text".

For example
```
if (A) {
  B
} else {
  C
} 
```
Can you write a transpiler that changes this to:
```
if (D) {
  E
} else {
  F
} 
```
?

Not with REGEX nor Microsoft Word Find and Replace.

You want a "meta-REGEX" that lets you match
```
if (P1) {
  P2
} else {
  P3
}
```
then replace P1, P2 and P3 with whatever you want.

Ohm-JS lets you do that.  (Actually, I learned how to do that using recursive-descent parsing, but that required a lot of attention to detail, which is elided by Ohm-JS).

Hmm, maybe that's all that I'm saying?  Syntax is cheap now.  Re-learn how to approach problems using tiny-transpilers.

0D gives you Referential Transparency.

Maybe I need to consider writing a bunch of tutorials - a course - in transpiling A->B->...->Z?

For now, just out write/draw the fake code.  It will become apparent how to transliterate the fake code to real code (say, in Python).  You don't even need a transpiler, you can do it manually and still save heaps of time.

I'm doing that at this very moment.

---

> 2.  I don't believe this is actually true. Code should be written in any language that allows machine resources to be intelligently managed. That does not necessarily imply assembly. (edited)

Current languages use CALL/RETURN which leads to inefficiency (type-1).  CALL/RETURN can be used for:
1. reducing code footprint ("good")
2. DRY (Don't Repeat Yourself) ("bad" - could be done with an editor instead of runtime use of CALL/RETURN ; DRY matters only to Developers - the machine doesn't care if you repeat yourself).

In other words, current languages do not intelligently manage machine resources.  The languages are biased and ignore the fact that CALL/RETURN is wasteful.

The Most Efficient programming language would use sub-atomic particles to program the "machine".  Instead, we invent many layers of successively higher-level notations ("atoms", "molecules", "electronics", "VLSI", "assembler", "C", "Haskell").  We do this only to retain the sanity of Programmers (Physicists, materials experts, etc.) and to allow Programmers to chunk their thinking and free them to solve bigger and bigger problems.  An analogy: mathematics is "good enough" to describe Physics, yet, Feynman needed to switch to a different notation ("Feynman Diagrams") to solve a specific problem.  Why?  Nobel Laureate Ilya Prigogene "discovered" chaos by ignoring mathematical functions, even though mathematics was "good enough" to describe what he ultimately "discovered" (it wasn't "good enough" to allow him to "discover" the principles).

> 1.  Also, the dichotomy between type 1 and type 2 efficiency as you call it, is false. 

I STRONGLY disagree.

> 3. Typically each of these has some level of importance relative to the other, rather than complete priority to the point where the other can be disregarded.

Yes, I agree that this might a laudable goal.  I believe that no language comes even close to achieving that goal (and, I believe that it can never be achieved ; you gotta use multiple notations / views / perspectives).

"Typically?"  I think that modern languages OBLITERATE the relative importance of Design, to the point of not being able to see the forest for the trees.

Here's a simplistic thought experiment.  I am writing a program and I think that it is very important to put the most-important stuff at the top of my file so that my new hires can understand more easily what I intended to program (not to simply believe that I got it correct, but simply to understand what I wanted to accomplish even if flawed).  If I use a compiler-appeasement language, like Haskell, I have to put a bunch of not-so-important things at the top ("declarations") and the most important stuff at the bottom.  The 1950s indoctrination of declaration-before-use has obliterated my design layout, while being completely unneccessary (we can build languages in 2022++ that do not insist on declaration-before-use).  We witness compiler-appeasement languages attempting to back out of this corner by inventing epicycles such as "hoisting" (and then stomping on the epicycles with things like "let").

This kind of obliteration runs far, far, far deeper than the above simplistic example. (I.E. fixing declaration-before-use is only the tip of the iceberg and doesn't solve the deeper overall problem).

- bloatware: current languages, incl. Erlang, Haskell, etc., create severely bloated executables. 
	- The "State Explosion Problem" does not only apply to State Machines, but to all kinds of synchronous, clockwork designs (and is especially visible in explictly type-checking ompiler-appeasement languages)

---

I paid for Parallels, instead of using Virtual Box, with the expectation that Parallels - and its Support Team - would save me time.  I have contacted support something like 4 times and, each time, I got a "not my problem" answer along with more reading - MORE work, not less.  I would have been much happier with responses like "yeah, 1,000 of our customers are experiencing this problem, too, but it seems to be a bug in Apple's code.  We'll ask them in our monthly check-up and get back to you if we learn how to fix this problem.  Some of our customers have figured out workarounds - like ... / none of our customers have figured out how to work around this problem, so don't waste your time, but, if you find answer, please let us know so that we can help our other customers / yeah, this is newbie problem and here's how to do what you want from a different perspective".

As it stands, Support has not helped me solve any of my problems and, Parallels has not saved me any time.

---

N.B "Lambda" is a wrapper that contains things.  People draw diagrams on whiteboards using boxes and circles to wrap things.  In ASCII, one has to use `{...}` to mean wrapper.  The ASCII representation of wrappers led us astray and allowed us to run into problems such as "global variables".  We would not have created global variables on diagrams, but we created them when we used ASCII.  Flattening all problems to 2D is only one approach.  Layering is another approach (think Russian Dolls).  

Some people "see" text and lambdas as layers, but, many people don't "see" the layers unless they are represented as diagrams.  

What do you need for drawing sensible diagrams?  I contend that you need 0D - the nucleus of concurrency and you need to use FIFOs instead of LIFOs. I contend that synchronous programming languages fail to provide the primitives for sensible diagrams - they tend to couch all program expression in terms of the call-stack (LIFO).  

CAN you draw sensible diagrams using only call-stack-based languages? Yes. Is this easy? No. 

CAN you create sensible concurrency using only call-stack-based languages? Yes. Is this easy? No. IMO, concurrency needs about 10 bytes of assembler code.  Most of the current bloat comes from solving 1950s problems like time-sharing and mutation and heaps.

---

Real Engineering disciplines, such as Structural Engineers, define different roles for Engineers.

One kind of Engineer figures out the details of what to do to produce the product.  

Another kind of Engineer (the "Production Engineer") figures out how to optimize the product.

Another kind of Engineer (the "Test Engineer") figures out how to test the product before it is released to customers.

Etc., etc.

None of the above kinds Engineers actually build the products.  Construction Workers build the product.  Q/A executes the tests.

Etc., etc.

Software reduces the work of Construction down to almost nothing, but doesn't affect the need for inventing the product, optimizing the product, testing the product, etc., etc.

Cottage industry: one person (one group) does ALL of the above roles.  Scalable business: creates cubby-holes for each kind of activity and grows them as needed (i.e. scales them up).

---

Eliding (not getting rid of, just eliding) "unwanted stuff" results in "progress".  Assembler programmers managed to keep a lot of details ("unwanted stuff") in their heads.  Then FORTRAN coralled this "unwanted stuff" and allowed more people to write programs.  Then, came better syntax checking, e.g. "C", which allowed even more people to write programs.  One person even wrote a whole operating system by himself while his wife was on vacation.  Now, we are working on better type checking.

---
"Concurrency is not Parallelism": https://www.youtube.com/watch?v=oV9rvDllKEg
"Event-Based Programming": https://www.amazon.ca/Event-Based-Programming-Taking-Events-Limit/dp/1590596439
"Parallelism"L https://youtu.be/JD8QpV-t5eM
Kinopio notes: https://kinopio.club/0d-q-a-SivbkkUtzbnxU6tUnqb7x

---
Let’s do that, then.

  

The first question(s) is:

- how do I learn enough about what what you want to do without having to steep myself deeply into your problem? - you will always know more than I about Tabby

- how do you learn enough about the implementation choices for Tabby without needing to steep yourself in all sorts of programming/Ohm-JS/0D details?  Goal: I should be able to hand you an IDE with which you can just slap Tabby together in a few hours.  That won’t happen (for now), but that is “my goal”…  My writing has been “too academic” up until now - I’ve been expecting my readers to be able to infer how to perform this magic from the meta-information I’ve been writing.

  

So, what do we need to exchange?  ATM, I think that some kind of scribbled storyboards for the various use-cases.  At the top-most level, would you just draw this out and annotate it on a whiteboard?  Imagine that money is no object - you need to transfer your vision to a virtual Team of Engineers who will implement your vision.  What would you tell them / scribble for them to make them understand?  You can give them a 50,000-meter overview, but, in some cases you will want to describe details and will find it hard to verbalize/scribble them.  How would you explain such details?  Python?  Pseudo-code?

  

As I write this, I see that the “process” I champion is quite simple: (1) sketch out a vision, (2) iterate on the vision adding bits of detail here and there, (3) stop iterating when the whole thing works “good enough” and can be executed by a machine (computer).  “Thinking” and iterating a Design might take weeks, but Coding should take mere minutes.  You should be able to “go back to the drawing board” multiple times and throw away all of the Code and start again without fear of losing “valuable work” (the Work is the Design, not the Code).

  

LEGO blocks.  As you add technical detail, you build LEGO blocks.

  

You snap LEGO blocks together and try out the solution.

  

Oops, you don’t like THAT solution…

  

You simply un-snap the components and re-snap them in some other way.  Maybe create some more snapable blocks if you’ve discovered new technical details needed to solve the problem.

  

pt

---

> "Instead of JS to Flowchart, we should want Flowchart to JS (or Python, or Rust, or …)."

  

What specifically do you like about Flowcharts/Dakon? I see a few things like 2D code – yes/no branches are more visual to follow a path. I also see grouping of code and different shapes. Thanks for the links – I liked playing around with it.  

  

[https://app.drakon.tech/ide/doc/examples.js/9897bf3c](https://app.drakon.tech/ide/doc/examples.js/9897bf3c)

[https://app.drakon.tech/ide/doc/examples.js/993120bd](https://app.drakon.tech/ide/doc/examples.js/993120bd)

  

I like the choiceExample, how it can be represented in 2D. But there can only be a few choices before it gets too wide.  

  

On the flip side, I think I'd rather see a more tree like structure for "if (x && y)" in [https://app.drakon.tech/ide/doc/examples.js/ba33ca3f](https://app.drakon.tech/ide/doc/examples.js/ba33ca3f)

  

The inverted version looks a bit easier to read for me: [https://app.drakon.tech/ide/doc/examples.js/81626559](https://app.drakon.tech/ide/doc/examples.js/81626559)

  

The "or" example is another that is more difficult to visualize that think of (x || y).


> What specifically do you like about Flowcharts/Dakon? I see a few things like 2D code – yes/no branches are more visual to follow a path. I also see grouping of code and different shapes. Thanks for the links – I liked playing around with it.  

The Drakon PDFs specify design rules that are more strict than flowcharts (everything is left-to-right, top-to-bottom).  I find that appealing.  I believe that it is a bad idea to make "control flow" disappear.  Real programming of machines needs time-dependence and "control flow".  Drakon concentrates on drawing diagrams of "control flow" while leaving the rest alone.

Drakon's "skewers" seem novel and a more-structured way of dealing with "control flow".

FP's answer to "control flow" seems to be CPS, which is just a politically correct way of saying GOTO.  I find CPS to be unappealing, esp. after trying to debug/understand someone else's CPS-based code.  My belief: GOTO and State are +required+ for Real Programming.  GOTO and State are not "bad".  Ad-hoc use of GOTO and State, though, is "bad".  If you carry that thought through, you end up discovering that "if-then-else" is ad-hoc and a bad way to use State.  "Structured Programming" did not suggest the disappearance of GOTO, but only suggested a way to corral its use in a more-structured manner.

Lambdas and OO (Classes, nee Prototypes) corral data. 

Drakon, and StateCharts and ... corral control flow.

"Methods" restrict one use-case of "if-then-else" and make it more-structured (OO == Case on Type).

"Conditional" breaks down into 2 categories - (1) conditional values of functions and (2) sequencing.

Diagrams of very-controlled-use-cases of conditional sequencing are a good idea.  Drakon and StateCharts suggest possibilities.

I like Drakon's pre-hub editor. I haven't tried the DrakonHub app, so I simply don't know if I like it.  The "smart edit" feature, which simply moves skewers over if any of the boxes on the skewers touch boxes on other skewers.  To me, this is better than any "auto layout" algorithm I've used.  Current offerings of FP-based auto-layout are horrendous from a UX perspective, e.g. Obsidian's "graph view".  Raskin must be twirling in his grave. Layout carries meaning that can only be imparted by a human designer.  Randomly rearranging layout using machine-based algorithms scrambles and obfuscates any design-oriented meaning that was there.  Most modern editors, including the Emacs 26.6 that I use, get this aspect very wrong.  I conclude that you can't automate layout, but, you could help make layout less cumbersome to manipulate.

Again, Drakon suggests some interesting editing capabilities.

---

The model for True Concurrency is the use of 1 CPU per Thread.

Any implementation that uses fewer CPUs than Threads has to fake-out concurrency.  Faking-out concurrency on synchronous (Call-Return-based) architectures leads to epicycles and to danger.  Trying to force-fit mutation and heaps onto such models results in even more epicycles and more danger (see "Mars Pathfinder" disaster ; refer to the epicycles called "Thread Safety", "Priority Inheritance", etc.)

Faking-out concurrency using FIFO-based components is, at least, closer to the True Model of Concurrency.

Using FIFO-based components to write IoT, Robotics, blockchain, internet, etc., etc. apps, at least models the reality of those kinds of apps.

Thinking this way was considered insane in the 1950s, but, is quite possible in 2022++ (cheap rPIs and Arduinos, cheap memory).

---
> What’s the relationship between domain-specific programing (i.e DSLs) and end-user programming? (edited) 

Programming = providing details in a way that even a machine can perform the steps

End-user programming = UX.

Programming and End-user programming are orthogonal, but many languages try to conflate the orthogonal concepts in the false belief that the concepts can be expressed in a single notation.

--

FYI Observations:
- Programming = providing details to a solution in a way that even a machine can perform the steps
- End-user programming = UX
- Rhetorical questions: Are Spreadsheets DSLs?  Are Spreadsheets UXs?  What about Hypercard?
- DSL == programmers' solution to the "languages are hard to build" problem
	- if languages were easy to build, we wouldn't need to bother with DSLs
		- we could just build micro-languages for each problem
	- [recursive descent parsing in the past ; now, PEG, Ohm-JS]
- when doing consulting, I would always assume that my clients knew their domain better than I did
	- my job was to provide them with ways to automate their knowledge and give them a 10x boost in productivity
	- I would try to "invent" a language that mimicked the way that the clients thought about their domain, yet I tried to make every part of that "language" compilable
- instructions in the form of "text" is only one kind of programming language (very 1950s) 
	- many non-programmers use whiteboards and dry-erase markers
- programmers think in details and want to use all 10 fingers, users want to skip over details ("elision") and use swipes and voice and game controllers and "easy-to-use" HCI devices
	- notations (aka "programming languages") for programmers are vastly different from notations for users 
- example: FEDEX bar-code-reader hand-held-device marries high tech (bar codes and lasers) in an HCI that makes it easy-to-use in the field ; how was this programmed into being?  Did someone have a vision then hire a bank of engineers (software and hardware architects and engineers and implementors), or, was there an easy-to-use intermediate micro-language that let the envisioner implement / mock-up the MVP without engineers?  Could we have designed this more easily today?
---
Question: What do you see this syntax being compiled-to for a digital computer?
Orthogonal brainstorming: Then, there's the forgotten form of computing called Analogue Computing.  I wonder if this syntax has application to analogue computing?  If so, what operations does this syntax represent?

---

2.  > What I'm talking about is not app level dependencies, but programming dependencies that are kind of hidden under the hood.
    
    It's not clear what that mean. Could you please provide examples of what are "app dependencies" and "programming dependencies"?

Maybe I should have used the words "explicit dependencies" and "implicit dependencies".

Programmers are aware of explicit dependencies, i.e. libraries/code needed by an app.

Programmers tend to be blind to implicit dependencies, such as those caused by normal function calls.  It's not impossible to write code without implicit dependencies, but this is not encouraged by modern programming languages that use functions.

    
    > It's mostly got to do with scalability. Anything that's tightly coupled isn't very scalable.  
    
    That is also true for non-concurrent environment isn't it?
Yes.

But, something about the question - the words "non-concurrent" - is bothering me.  It seems that I'm not making myself clear.

You don't need ALL of "concurrency" to decouple code.  You only need the part that I call 0D.  IMO, ALL code that is based on function calls is tightly coupled by default.

You CAN decouple function-call-based code, but, it's hard work. 0D is easier.

    
    > If you do scale it, you scale it in big chunks. Optimized code has to be scaled upwards in big pieces.
    
    The more dependencies app has the bigger executable will be. Did I got that right? If yes, that's, again, also true for non-concurrent apps.

What you say is true, but, my point is different.

Let's see if I can re-state my point using different words: If you carefully decouple all code in an app, the pieces are independent from each other and it is easy to scale the app.  If you apply "optimizations" to the code, you tend to break decoupling and you get faster-running blobs of tightly-coupled code.  Optimizations to speed up code insert tentacles of coupling throughout the code.  

You can't have both - decoupled code and optimized code.

In the 1950s, it was "obvious" that inserting coupling was OK, since there was only 1 very-expensive CPU per application (per computer). In 2022++, we want distributed computing, so insertion of coupling is an issue.  Backing off the optimizations might bring better distributed performance, in 2022++

Most of our "programming languages" are based on 1950s thinking - optimization is King.  In 2022++, this 1950s thinking is beginning to hurt, especially when we try to write programs for robotics, IoT, internet, blockchain, etc.

    > Referential transparency is known in hardware as a chip being pin compatible with another chip. The main aspect of referential transparency is the ability to replace one component with another component.
    
    Okay. I was thinking about this in a wrong/different way. To me "Referential transparency" is the ability in a language to replace an expression with it's value or replace a function call with it's body. 

If you believe that "expressions" are Components, then there is no disconnect here.  "Expressions" take one set of inputs and produce one set of outputs.  This is just a subset of more-general kinds of Components.  Generally, Components allow multiple sets of inputs and multiple set of outputs.  "Time" enters the equation.  One set of inputs might arrive at time A, and another set of inputs might arrive at time B.  Likewise, outputs can be generated at different times, time C and time D.  

Most modern programming languages try to completely ignore the issue of time.  It looks like all inputs arrive at a function at the same time, and, all outputs are sent at the same time.

Computers, especially computers for robotics, IoT, internet, blockchain, DAWs, etc. don't work that way.  Time is a factor in these kinds of computers.  Languages that expressly ignore "time" make it hard (but not impossible) to program these kinds of computer applications.

	
    What you are talking about is something I would call just interfaces or interface/component-oriented programming. That's, by the way, also more than possible for non-concurrent environments.

Interfaces are only 1/2 of the solution.  Components have input APIs AND output APIs.  You have to snip and parameterize both ends of a Component.  Current function-based languages, like Python, Rust, etc., parameterize only the input end of Components.  DLLs are band-aid epicycles that try to fix the missing output API issue.



Components cannot explicitly refer to other Components.
3.  _[_12:24 AM_]_
    
    > There's a prerequisite for referential transparency. We have to snip all dependencies.
    
    It feels like this is the point and I don't understand something important. Code can't run without "shipped" dependencies in my picture. So how this statement is special? (I hope my English is not rude)

We know that "dependencies are bad" and that we have to bundle up all of the LEGO blocks that make up an app before shipping it.  

Overlooked-dependencies are: dependencies. Overlooked dependencies affect software in the same way that non-overlooked-dependencies affect software.

I'm splitting hairs and pointing out that there are a few kinds of dependencies that we just take for granted and tend to overlook.  Overlooked dependencies show up as symptoms and unexpected bugs.  We build software in the same way we take Aspirin.  We deal with the symptoms instead of the real cause (I call this approach "epicycles".  Words like "workaround" and "accidental complexity" have been used.).

Preemptable processes are a blunderbuss approach to solving the overlooked-dependency problem.  We just take the whole rats-nest app and drop it into a plastic baggie called a "process".  The rats-nest isn't very scalable.  Our main way of scaling software is to scale at the level of plastic baggie, since we can't scale what's inside of the baggies.

FBP essentially says: "if you're stuck with plastic-baggie scalability, here's a suggestion on how to structure software at that level". UNIX shell pipelines do that, also, but on a more restricted basis.  UNIX pipelines expect Components to have exactly 1 input and 2 outputs.  FBP allows more inputs and more outputs.

Functions can't compete directly.  Pure functions have exactly 1 input and 1 output.  We've created workarounds by bolting a 2nd output onto "functions" (called "exceptions").  You CAN create workarounds that allow ad-hoc plastic-baggie scalability, but the slogging gets tougher the further you go down that path (that's the problem with epicycles and treating only the symptoms).  FBP says "hey, if you structure it this way, then the slog becomes a lot easier". ("A lot" means something like "an order of magnitude".  I would be surprised if someone had actually measured and quantified the numeric meaning of "a lot")

0D is a revelation that comes from focussing an electron microscope on preemptable processes.  If you've written concurrent/parallel code, then you've already written 0D code.  It's like Material Science - if you know what the Quarks are, you can skip over the Atoms and - maybe - build better Molecules and Materials.
    
    > Functional programming: when they talk about referential transparency, they actually do snip all of the dependencies and they pass them in as parameters.
    
    Yes, but not only functional languages do that this way (or maybe this is a FP feature that OOP/multi-paradigm languages also use)
    
    > here's nothing new here. It is possible to express and use concurrency in many different programming languages.
    
    Ok, so my picture is the same as yours - concurrency is a property of an app/executable/environment and FP is a programming paradigm that allowes (like many other) concurrency.
    
    > functional programming causes more state explosion by insisting on explicit types
    
    1) There's dynamically typed FP languages (e.g. Lisp) 2) There's languages with type-inference (e.g. Typescript) that allow you avoid explicit type annotations. How good such solutions are is a different topic. (edited)
    
4.  _[_12:29 AM_]_
    
    > How do current text languages tend to force us to insert unwanted dependencies?
    
    Thank you that's clear. Well, you are allowed to use interfaces in many languages. But that may be true that in common languages you have to do some work to do so. Interfaces aren't free at least from developer's productivity view. Anyway to me it looks like a right thing - I don't think interfaces (as a "real" programming (compiler-aware) entities) must be automatic/forced (btw that was my opinion in a past)
---

    > 1.  ### jjido_—_ 11/29/2022 7:57 AM
    
    “” The third kind of unwanted dependency is "return from a function". Most languages define functions that return values to the callers. This is a hardwired routing decision and conflicts with the type of thing we want to do with IoT and internet and et cetera, where we have clients and servers. A single server might have multiple clients requesting information and that server sends information back to each of the clients. So it has multiple outputs. “” That is something I am struggling with. I know that in a service oriented, capability enabled architecture there should be a way to establish a flow between services that doesn’t have to loop back to the requester. But how to express it and the actual way it works eludes me.
    
2.  _[_7:59 AM_]_
    
    Maybe I should just reread the FBP concepts
    ---
---
> 1.  As far as I understand we have to send response back to client's inport (client should have special inport for responses). Question is - how should we associate response with the request. Then more questions arise - how to handle timeouts, etc

---
1.  >   
    > The model for True Concurrency is the use of 1 CPU per Thread.
    
    Sounds more like a model for true parallelism to me (as I understand Rob Pike's video about it). It's called concurrency because there is a "competition" for resources - that's what I thought. And there's a "manager" of those resources (scheduler). That's my view of these terms. Am I wrong?
    
2.  _[_12:18 AM_]_
    
    > I am delayed in answering your questions (important babysitting)
    
    That's ok, don't worry ![🙂](https://discord.com/assets/da3651e59d6006dfa5fa07ec3102d1f3.svg) Thank you for answering at all
    
3.  _[_12:21 AM_]_
    
    > Any implementation that uses fewer CPUs than Threads has to fake-out concurrency.
    
    Let's take Go for example (or any other environment with green threads) - we can have as many OS threads as we have CPU cores but those threads will be mapped onto "virtual threads" (goroutines). Is it "fake"? We have competition for resources and scheduling. Even more than that - Rob Pike says that concurrent program is a program that _able_ to use several CPUs. Concurrent program that runs on a single CPU is still concurrent program as he says (as far as I remember).

---

aside: The Nyquist Sampling Theorem says that you have to sample at least 2x the speed at which the thing is changing state.  Practically, if the thing changes state much, much faster than you are sampling, the thing looks like it is continuous.  Analogy: a Retina display has many more digital pixels than your wetware can distinguish ; vinyl is better than MP3 because vinyl packs more data into a unit of sound-space (I guess that FLAC is a digital attempt to compete with vinyl). 
aside: Ironically, transistors were first used for analog circuitry (e.g. audio amplifiers).  Transistors have a "linear region" which is used in analog circuitry.  If you slam transistors to be ON or OFF, they are said to be operating in their "non-linear" region and you get 1's and 0's

---

datapoint (Kinopio) - I listed my directory of my blogs into a file, pasted the file into a card, then pushed the “split card” button.  It created 800 new cards.  It took many minutes (less than 10) to do this and survived.  I have yet to pick through the result…  I have some 500+ blogs on that site (github pages, I have since switched to using Obsidian Publish).  The blogs are written in markdown and use markdown headers.  I guess that some of the blogs were split into multiple cards, based on the headers.  At this moment, I'm not sure that I grabbed the most recent version of the blog directory, and may want to revisit what I did, but, whatever I did pushed Kinopio and created 100's of cards.

---

I don't know why I didn't think of this earlier - do both.

Find a regex lib that you want to clone and write a transpiler to some other language (e.g. C->Odin, only "enough of C" required, not "all of C").  Use Ohm-Editor and Ohm-JS for the transpiler.

My first project in Ohm-JS was to "port" PROLOG from Scheme into JavaScript.  (If I can do it, anyone can do it).

Once you have it working, you can poop out any other language you'd like, e.g. WASM.

https://github.com/kokke/tiny-regex-c
https://github.com/edicl/cl-ppcre
...


https://www.youtube.com/watch?v=qYo0lVVH2wU

---

Maybe source to source conversion?

e.g. something like:

result =[] 1..5 | map (n) => n * n | filter (n) => 'odd n
doSomething result

converts to -->

result = 1..5 | map (n) => n * n | filter (n) => 'odd n | toArray  
doSomething result

REGEX ain't general enough to do this, but Ohm-JS (PEG) is good enough.

You might have operators '=[]', '={}' and '=?', or, single-character operators, or, something even smarter

I've written an Ohm-JS grammar and a Fab fabrication spec (Fab is a tool I made and am playing with) to prove to myself that it can be done.  I would be glad to give further details, if interested ...

---

Yes!

Any problem can be viewed from multiple perspectives.

Some views are more fruitful than others.

How do you know which views to use?

You don't.  Experts, Senior Architects, Senior Engineers know which views to use.

How do Experts know this?

1. Trial-and-error over the years.
2. Apprenticing with Experts who preceeded them.

Can a machine figure out which views are the best?

No. 

A machine cannot figure out which views are the best.  Only an Expert can tell you which views to use.  A machine is but a tool.  An expert can specify which knobs to put on a machine and how much to turn each knob to achieve the most fruitful perspectives, but, the machine can't figure out how to do this by itself. 

The 2022++ computer medium is like a piece of paper and a pencil.  In the right hands it can convey a great deal of meaning.  

In fact, 2022++ computers allow humans - for the first time?- to explore and visualize issues in 4 dimensions - x/y/z/t.  Paper and pencil and clay tablets forced humans to collapse 4D concepts down to 2D for the sake of the written notation.

How does all of this manifest itself in Software and Programming?  

For starters, we might use *multiple* languages for any problem.  Nano-languages - I call them SCNs (Solution Centric Notations).

Examples:
- one view of computers is "everything is a byte" - the notation is C
- one view of computers is "everything is a string" - the notation is Perl, Icon, SNOBOL, Tcl/Tk, etc.
- one view of computers is "everything is a browsable web page" - the notation is HTML
- one view of software is "everything is a hierarchical wrapper" - the notation is Smalltalk (OO)
- one view of software is "everything is a function" - the notation is FP, Lambda Calculus, etc.
- one view of software is "everything has state"  - the notation is StateCharts, Actors
- one view is that "history matters, sequencing matters" - the notation is state machines - the *anti*-notation for this is functional notation, which outright discards history
- one view of programming is "everything is a sequential set of functions" - the notation is FP and written mathematics
- one view of programming is "everything is an asynchronous Component" - the notation is FBP, Actors, UNIX shell pipelines, ė[^eh], etc.

[^eh]: I happen to be interested in exploring the rathole of asynchronous, pluggable Components.  I am exploring a notation/functionality/IDE/... that I call ė.  I think that I have isolated some sub-atomic particles of concurrency and call the main one "0D".

Conclusion:

Don't try to guess, let the Experts *tell* you which Views to use.

How?

Find a way to allow Experts to create views - SCNs - quickly (in minutes instead of in years).

Recursive Q: what is a fruitful view of the problem of how to let Experts create SCNs easily and quickly? A: Create multiple grammars to drape multiple syntaxes over various paradigms, let Experts reach into a toolbox to let them pull out and use bits and pieces of useful functionality. 

Suggestion: 
1. use Ohm-JS for creating syntaxes 
2. use Lisp as the toolbox[^js]
3. use debuggers, honed by Experts over the years[^debuggers]
4. build software as pluggable Components[^0d]

[^js]: Aside: if you have an allergy to using Lisp, I have found that JavaScript and Python work acceptably, too, as toolbox languages (except for their pesky syntaxes)
[^debuggers]: After all, the Experts in debugging have determined - by trial-and-error, and, by listening to customer demands, and, by learning from others - what works best when debugging and what doesn't work when debugging.
[^0d]: 0D, IMO, is the secret sauce of Componentizing software

LispWorks is a better debugger than SBCL.  SBCL is a better debugger than VSCODE. Iterative design is better than waterfall design.  Debugging is a better way to design something than just inventing all of it in one fell swoop without a debugger and without iteration. Optimization should be applied only after-the-fact to a working design (i.e. eschew "premature optimization").  Type checking mainly helps when optimizing (it attempts to guarantee that the optimized code faithfully represents the original design, but, it gets in the way of free-thinking during Design).

Ohm-JS is better than PEG. PEG is better than Language Theoretical compiler generators (e.g. YACC, LR(1), etc., etc.).

Lisp and Assembler share common traits:
- expression language 
	- easy to bolt pieces together to make bigger pieces
	- Assembler pieces are arranged as *lines of text*
	- Lisp pieces are arranged as recursive *trees of Atoms and trees* (*tree* is also known as *list*)
- lack of pesky syntax (you don't want your toolbox language to have an opinion about which syntax/view you need to be using).
Maybe there are other languages that have these traits?  I don't know.  OTOH Lisp (and Assembler) has been around for looong time and Experts have tuned it to be a good toolbox. And, I am comfortable with Lisp.

FP has been around a loooong time, too, in the form of written mathematics. In fact, Lisp was based on mathematical notation.  Computer hardware goes beyond what can *easily* be described using written mathematics, e.g. history (sequencing, DAWs, iMovie, robotics, blockchain protocols, IoT, etc.), mutation (RAM), asynchonocity (non-von-Neumann architectures), etc.

It should be noted that FP is simply *one notation* that can be fruitfully used to describe computer programming.  There are other notations that fruitfully describe non-FP aspects of computers better than FP can describe them.

Claiming that one notation is *The Best* notation is a common human behaviour.  It is so common, that it has been given a name - "fad".

IMO, it is fruitless to continue inventing new languages and amazing features as one-shot deals.  We need to invent new ways to invent new languages quickly (i.e. in minutes).  We need to solve problems by inventing multiple SCNs (nano-languages) for the various views of problems.  We need to use multiple SCNs to solve little sub-problems, then bolt the solutions together into larger solutions.  

Recursively.


---

Hmm.  My initial reaction is: "Don't bother taking a compiler course, all of that mumbo jumbo has been superceded by advances in PEG technology (the best currently being Ohm-JS)."  Yet, I know of nothing to fill the void (is that a Opportunity speaking to me?).  Compiler-making breaks down as (1) learn how to design a language, (2) learn how to build an interpreter for the language (3) learn how to optimize the interpreter and make it into a compiler (4) learn how to stop using only text-characters for programming languages and leave the 1950s behind.

---

Yes, I am happy to expand.  Questions can help to guide my answers, otherwise, I might skip over things that I think are "obvious"...

In the 1950s, computer hardware was a brand-new concept.  It was a push-up just to imagine splatting small bitmaps onto a screen (or paper) driven by a bank of switches arranged in a QWERTY layout.

Our concept of "programming languages" is based on those very-limited 1950s hardware realities.

Today, we have better hardware that can easily draw scalable, overlapping images.

Yet, we continue to use "programming language" concepts that were invented in the 1950s.

We base all programming languages on the concept of grids of small, fixed-size, non-overlapping bitmaps.  Yet, our hardware can do better than this now.  (In fact, it does, but is used only to improve the life of non-programmers).

What if we created programming languages that used SVG-minus-minus Elements and allowed them to overlap?
1. rectangles (scalable)
2. ellipses (scalable)
3. lines
4. text (scalable)
5. groups

Since Elements are not guaranteed to be displayed Sequentially, we would need to add smarts to our parsing technologies.  Borrowing from grade-school math, we might add high-falutin' concepts like "intersection", "bigger-than", "smaller-than", "contained".  Further, we might be interested in stuff like "source", "target", "grouped together".

We can do all of this now.  I've compiled .drawio diagrams to Python using inferencing (I used PROLOG, but I'm guessing that Ohm-JS would be enough (inferencing can be done in any existing language, but, is really, really boring to code up (Note that AGDA uses inferencing, too))).  All of our tools tend to boil down to text (Draw.io generates XML and compressed XML, which can be easily decompressed).  And, we have tools for parsing text (I favour Ohm-JS - surprise!).

I'm playing with Programming Languages that use rounded rectangles and circles and colours.  (Aside: ASCII "{ ... }" is just a Rectangle wannabe).  I allow my Rectangles to contain Text.  Text is better for some things than diagrams are.  I want +hybrid+ tech diagrams that include diagrams and text.  

I'm not talking Rocket Science.  None of this stuff is actually new.  Racket allows images as code elements.

Maybe The Big Leap is just inverting our ingrained concepts about programming languages as text that use only text editors.  I think about "compiling" instead of "modeling".  So, I don't entertain the idea of "what does this cloud or this stick-person mean?".  I concentrate on "what does this rectangle with text inside of it compile to in, say, Python?".

Then, there's the "problem" of 'what does it mean to use a call-stack to connect boxes on a diagram?'.  How about not-using a call-stack for this? But, I digress.

[Do you need to build a compiler for this?  Actually, No.  I find that it helps to simply draw my design in draw.io (ech) and that this is enough to make it "obvious" how to hand-compile the design to code.]

I could go on, but I wonder if I'm wandering into the weeds and souding too airy-fairy...

---

> super cool. I'm trying to understand what your goals/needs are, and how you are hoping to use Kinopio to meet them

My original interest was in using Kinopio as a programming language.  I haven't gone there (yet), and am stuck with draw.io as a programming language.  I /think/ that I would need two ports ("in" and "out") instead of only a single connection.  A software component is an URL and it has a list of allowable input connections and a list of allowable output connections.  Hmmm, maybe connection names/types are enough for this?  But, this would not allow an input to have the same name as an output.  Hmm, I haven't gone there yet, so I don't know yet.  My default model is a hardware IC (e.g. 7400) which has numerous named inputs and numerous named outputs and wires that don't need to have names...

---

The original screenshot is here:
https://github.com/guitarvydas/play/blob/dev/kopi/kopi%20ToArray%20Screenshot%202022-12-04%20at%2011.49.05%20PM.png

the data I used is:
https://github.com/guitarvydas/play/blob/dev/kopi/test.kopi
https://github.com/guitarvydas/play/blob/dev/kopi/kopipipe.ohm
https://github.com/guitarvydas/play/blob/dev/kopi/kopipipeToArray.fab

and, the live parsingexplorer is "as is" here:
https://github.com/guitarvydas/parsingexplorer
If you do try to use pe.html, remember to "make install" first (or "multigit -r").  As it stands, I'm the only one using Fab, so there might be other things missing or broken in github. "It works on my machine" :-).  I would be happy to correct/explain if there is interest.

"Fab" is a nano-language (an "SCN") that transpiles a simple syntax to JavaScript that is compatible with Ohm-JS requirements.  You guessed it, "Fab" is written in Ohm-JS.  Have I documented it anywhere?  I will check later tonight.  If you know Ohm-JS syntax (PEG syntax with a couple of tweaks, most notably using Capitalization of rule names to enable whitespace-skipping, and, the fact that grammar and "what to do" are split off from each other), then it should be possible to infer the syntax of Fab. ...
pt

... looking at peggy.js.  Thanks ...

---
Konrad Hinsen:

> I tend to agree with most of this, except that I am not sure I understand your ideas about SVG. In mainstream programming, the ground-truth representation of code is text (a linear stream of characters), and the UI is a slightly rendered version of that text (syntax coloring etc.). I see how SVG could yield better UIs, but it sounds as if you want SVG to become the ground-truth representation of code. If that's the case, I don't see why.

- the ground truth is "controlling a computer"
- we happen to use text due to concerns in the 1950s
- hardware has changed from 1950 to 2022++
- the point I'm making is not of SVG to "render" a UI, SVG is the programming language (i.e. allow programmers to control a machine)
- to me, the choice of small bitmaps associated with QWERTY switches is arbitrary, I was able to control machines using breadboards and wires, most IoT devices do not have keyboards not displays
- 
> On a different topic, your essay contains the eternal "we are so stuck in the past, we need to move on" thread 

Our hardware is NOT stuck in the past, but our ideas about how to control the hardware IS based on past prejudices that no long hold true.

> 
> that comes up frequently here (and elsewhere). What I have yet to see is a realistic proposition for "moving on". If it's "start from scratch", it just won't happen. We are not stuck with 1950s hardware, we have built up an enormous IT edifice _starting_ with 1950s hardware. We are still adding to it, and it has become infrastructure for other human endeavours. It won't go away (except maybe in a major civilization crash).A realistic scenario for moving on must either start from the present edifice and evolve it into something better, remaining functional along the way, or build a second, disconnected edifice to which the world can slowly migrate as it matures.

- automobile, gas->electric in 2022 (it was ethanol->gas originally), change due to First Principles Thinking
- I believe that I can answer this question, but need to explain myself better
- 1950s hardware - yes for end-user, no for programmers
- how old is the field of automobiles?  How old is software?
- argument -> AI cannot possibly change how computers are used

- PEG blurs the line between scanning and parsing

- not emphasized: this essay is a comment attached to github issues context for 0D in Python (py0d - 0D, and HSMs (Hierarchical State Machines))

- hardware has advanced since 1950s
- end-user apps (software) have advance since 1950s
- developer apps (software, "Programming Languages") has not advanced beyond 1950s ; still stuck with notion that controlling a machine (computer) must be done with character strings in a certain arrangement (e.g. not spreadsheets, not diagrams, etc.) which favours synchronous control instead of asynchronous control
	- sync OK for 1-CPU apps
	- distributed (aka async) needed for Robotics, IoT, internet, blockchain, etc.
	- multi-core = async wannabe, not truly distributed, but, rPIs can be truly distributed
	- how to program distributes rPIs? 1 at a time, then use "assembler-like opcodes" to join them together?, or raise the bar on what "Programming Language" means?

- change is happening right now in an industry slightly older than computing
- automobiles - gas->electric
- driven by person who engages in "First Principles Thinking"
- 
kartik:
> Your point regarding declarations reminds me of my [https://archive.org/details/akkartik-2min-2020-06-07](https://archive.org/details/akkartik-2min-2020-06-07)

---

I would be happy to help, but the next 2 days are bad timing for me (babysittting).  Caveats: (1) I'm most interested in the "sub-atomic particles" that make up something like FBP, so I might not be the best person to ask if the question is about FBP-out-of-the-box usage.  OTOH I have experience working with hardware and designing languages and compilers and interpreters and operating systems, and, I would be happy to discuss and answer questions.  (2) I am more effective when I have time to ponder a question and write about it, I'm not sure that I think quickly on my feet (3) I'm in Toronto, EST timezone (4) we have a "Lisp" meeting online once a month for about 2 hours with very, very wide-ranging topics for discussion (usually not very Lisp-ish) and you would be welcome to attend if the time and timezone works out (6pm-8pm Toronto time, next Tuesday).  It might be best to get me thinking about your problem and then talk.  Or, maybe a couple of short meetings - one to set up the problem and to ask questions about it, then, later meetings to discuss in more detail.  If you want to record something, audio is fine, Loom, Descript ...  Currently I'm playing with Descript (that's how I did that video) and "JustPressRecord" (Mac) and for writing Obsidian and for organizing Kinopio.  Use whatever works and I will try to help...

---

Relocatable: comes from earlier attempts at trying to get opcodes right.  Originally, addresses, and branch addresses were specified as absolute positions.  So, Loaders (the front end of Operationg systems) loaded binary code and that code had to go into absolute places, because of the hardwired addresses.  Approaches were modified to allow Loaders to load code into various parts of memory.  At first compilers were modified to not-use absolute address, but to make all addresses offsets from some register(s).  Operating systems would ned to only stuff the right value into the base registers

JUMP 0x12345 ;; absolute
JUMP 0x12345(R7) ;; relocatable - relative to R7
"Relocatble" is needed by Loader (Operating System) to allow binary code to be loaded anywhere in memory, instead of to hardwired places



---


The mad rush to plunk a "type" on EVERYTHING hurts flexibility.

We need layers of types.

UNIX shell: the "type" of a datum in a pipe is "line of text".  UNIX does not further define the type of pipeline data.  The components might add extra layers of types, e.g. I expect this line of text to contain .csv, or, I expect a U followed by a space, followed by a V, etc., etc, etc.

The key trick is to back off using types when defining IPC (inter-process communication).  The ideal type for an IPC is "blob of bits".  UNIX is much too specific (one of the bytes MUST be a newline - argh.)

FBP: use processes to decouple functional units.

0D: A more efficient way to decouple functional units, than using big fat processes.  0D is the essence - "the good part" - of processes.

So, to define an "interface" for inter-component-communications, the interface must be as generic as possible.  Something like: input=anything, output=anything.  If users want more detail, they can insert filter components in the chain, e.g. input=anything, output={OK: valid UV, NOTOK: error invalid UV}

(Note that, in general, components cannot be restricted to 1-in:2-out format, like stdin/{stdout,stderr}, but many-in:many-out format (or 0-in or 0-out))

---
Ring any bells?  Don't waste time on this.
 
I've probably asked this before, but here's another wording:  I want to draw simple box-and-arrow diagrams and I want to see simple SVG output.  Like:
```
<html>
  <body>
    
    <h1>My first SVG</h1>
    
    <svg>
      <g id='myfunc'>
	<rect x="20" y="0" width="240" height="130" rx="19.5" ry="19.5" fill="none" stroke="black"/>
	<text x="120" y="19">myfunc</text>

	<g>
	  <rect x="60" y="40" width="170" height="60" fill="#f8cecc" stroke="#b85450"/>
	  <text x="70" y="64">print ('Hello ')</text>
	  <text x="70" y="84">print ('World')</text>
	</g>
	
      </g>
    </svg>
    
  </body>
</html>
```

Draw.io creates a very non-simple version of the above.

(Future: I will also want to know the source and target objects for a line.  Draw.io does this, but makes everything else messy and hard.  Maybe I should lower my sights to just getting simple SVG, first, then worry about connections?).

---
Thank you all, for your comments!  I find the insightful criticism to be quite helpful.

Hoping to clarify some points:

- IMO The Ground Truth is Programming, not Code.
- IMO, change, even big change, is possible, especially in a young discipline like this.  We are witnessing big change right now - the conversion of gasoline-powered automobiles to electric-powered automobiles.  The huge infrastructure for supplying gasoline is being replaced.  The figurehead for this huge change believes in "First Principles Thinking" [https://fs.blog/first-principles/].   Counter-argguments include, though: 
	- The fact that electric cars still have 4 wheels and still have offset steering wheels (instead of centered steering sticks as in the first automobile) 
	- The change-over from gas to electric is being facilitated by the existence of hybrid cars.  
	- Computer keyboards are still QWERTY.  
	IMO, the driver for change is orders-of-magnitude process improvement.  It remains incumbent on me to explain why I think that it is possible to improve on programming, noting that hardware has improved, and, noting that end-user apps have improved, while maintaining the assertion that programming languages have not improved proportionally.
- PEG blurs the line between characters in a Scanner vs. tokens in a Parser.  IMO this is important and may lead to change.
- SVG.  The following contains SVG for a very simplistic, stripped-down, non-useful lump of DaS (Diagrams as Syntax) in SVG form.  SVG syntax could do much more than this - this is but a hint.  Note that 
	- this example shows that diagrams as syntax need not be full-blown pieces of Art, and, 
	- this example hints at a hybrid notation that uses, both, diagrams and text (Python in this case). 
	The power of Programming using diagrams comes from applying 0D ("concurrency - the good parts") and Hierarchical State Machines (Harel StateCharts with Concurrency stripped out) - neither of these appears in this example...  This example simply shows that a dumb SVG diagram can be transpiled to dumb Python code using existing technology.
	
	![hello](https://github.com/guitarvydas/play/blob/dev/drawware/hello.png)
	
```
<html>
  <body>
    
    <h1>My first SVG</h1>
    
    <svg>
      <g id='myfunc'>
        <rect x="20" y="0" width="280" height="130" rx="19.5" ry="19.5" fill="none" stroke="black"/>
        <text x="120" y="19">myfunc</text>

        <g>
          <rect x="60" y="40" width="200" height="60" fill="#f8cecc" stroke="#b85450"/>
          <text x="70" y="64">print ('Hello ', end='')</text>
          <text x="70" y="84">print ('World')</text>
        </g>
        
      </g>
    </svg>
    
  </body>
</html>
```

the Ohm-JS grammar that I used is:
```
CodeDrawing {
  Main = "<html>" "<body>" H1 Drawing "</body>" "</html>"
  H1 = "<h1>" stuff "</h1>"

  Drawing = "<svg" stuff ">" CodeContainer "</svg>"
  
  CodeContainer = "<g" FunctionName ">" Boundary Title CodeBlock "</g>"
  
  Boundary = "<rect" stuff "/>"
  Title = "<text" stuff ">" name "</text>"
  CodeBlock = "<g>" RedRect Text+ "</g>"
  RedRect = "<rect" (~AttrRed any)* AttrRed stuff "/>"

  FunctionName = "id=" sq name sq
  Text = "<text" stuff ">" stuff "</text>"
  AttrRed = "fill=" dq "#f8cecc" dq

  stuff = notElementChar+
  notElementChar = ~"<" ~">" ~"/>" any
  name = letter alnum*
  sq = "'"
  dq = "\""
}
```

And my personal notation ("Fab") that completes the transpiler is:
```
CodeDrawing {
  Main [khtml kbody H1 Drawing kbodyend khtmlend] = ‛«Drawing»’
  H1 [kh1 stuff kh1end] = ‛«kh1»«stuff»«kh1end»’

  Drawing [ksvg CodeContainer ksvgend] = ‛«CodeContainer»’
  
  CodeContainer [kgroup FunctionName k Boundary Title CodeBlock kgroupend] = ‛def «FunctionName» ():«CodeBlock»
«FunctionName» ()’
  
  Boundary [krect stuff kend] = ‛«krect»«stuff»«kend»’
  Title [ktext stuff k name ktextend] = ‛«ktext»«stuff»«k»«name»«ktextend»’
  CodeBlock [kgroup RedRect Texts+ kgroupend] = ‛\n(-«Texts»-)’
  RedRect [krect cs* AttrRed stuff kend] = ‛«krect»«cs»«AttrRed»«stuff»«kend»’

  FunctionName [kid sq1 name sq2] = ‛«name»’
  Text [ktext stuff kend stuff2 ktextend] = ‛\n«stuff2»’
  AttrRed [kfill dq kred dq2] = ‛«kfill»«dq»«kred»«dq2»’

  stuff [cs+] = ‛«cs»’
  notElementChar [c] = ‛«c»’
  name [c1 cs*] = ‛«c1»«cs»’
  sq  [c] = ‛«c»’
  dq  [c] = ‛«c»’
}

```

The generated Python code is:
```

def myfunc ():

  print ('Hello ', end='')
  print ('World')
myfunc ()
```


FYI - Fab transpiles to JavaScript that can be used in conjunction with Ohm-JS.  I got tired of writing JavaScript, so I built an SCN (nano-DSL) for myself.

I've chosen not to include the generated JavaScript in this thread, but have pushed a working transpiler to github at [drawware]() 

[pardon the cave-man HTML, but I don't know enough about HTML and could use help]

31:50~ "In a 'real' Computer Science, the best languages of an era should serve as 'assembly code" for the next generation of expression.
[https://www.youtube.com/watch?v=fhOHn9TClXY&t=859s](https://www.youtube.com/watch?v=fhOHn9TClXY&t=859s)"Alan Kay - programming languages

---

@kartik

Yes.

The machine does the work instead of asking programmers to rearrange their code.

Your reminder reminds me of Holt's Data Descriptors, which reminds me of Cordy's Orthogonal Code Generator which reminds me of RTL (which is used in gcc).

---
Seeking opinion: is there a better way, is this a dead end, or if is this the way to go? ...
I think that I want to add several fields to every SVG element - data-boundingbox, data-parent  - and I want to generate unique 'id="..."' for each element (based on position on the diagram)
As yet, just pondering, not decided.

---

I'm looking for a path of least resistance using backup-and-try-again mentality.  I need (1) easy-to-understand SVG, and, (2) connection and containment info.  I was using draw.io until now because it also gives connection information (edge.source=idX, edge.target=idY).  In trying to answer another question, I discovered that draw.io produces messy/complicated SVG.  SVG defines containment (<g>) but doesn't define connections, and, draw.io defines connections but makes containment harder to infer than just using pure SVG.  The question arises: maybe I can't have both, maybe I have to write code to infer one or the other (connection / containment). So, my question to myself is : should I start with a simple SVG editor or should I start with draw.io?  I just today discovered data-* attributes in SVG (and HTML) - this might change my mind about what the path of least resistance might be...  I have code that infers containment, but, a simple SVG editor could obviate the need for such code.  I dunno what I think, but, I do adhere to the idea of throwing everything away and starting afresh when I find out new info.  Very Lisp-y, anti-C-y - code is cheap, thinking is hard, cheap code should not affect expensive thinking, but in C/JS/Python/Rust/etc., it does.

---
Observation: I believe that there is a huge chasm between programming and what non-programmers expect.

Most normal humans are accustomed to the idea that objects are independent.  If you hold an apple and an orange, then cut the apple in half, nothing happens to the orange.

Programmers and computing theorists force Objects to be heavily coupled.  Everything is treated as complicated, tightly coupled units, like Swiss clockwork.

Clockwork software produces bloatware, brittle software, and, curtails thinking about higher-level design.  Break one tooth on a gear - anywhere - and the whole system fails.  Computing theorists think that this is required behaviour.  If you hold an apple and an orange, then cut the apple in half, the orange is no longer an orange.  Most of our programming languages are geared for this perspective, but, this perspective violates normal human expectations.

Can you write diagrams and programs from this tightly-coupled perspective? Yes, but, you probably need several years of University training first.  You need to invent preemptive operating systems just to keep the orange intact.

The answer to this problem is quite simple - you need to provide buffers between software units.  Programmers need to be aware of when they are using the call-stack (and recursion and looping, etc.) that creates tightly-coupled pieces, and, they need to use "something else" (e.g. queues) when creating non-coupled units ("build and forget", "0D").  UNIX pipelines employ loose coupling between commands. Nested functions produce tight-coupling, not loosely-coupled pipelines.  Functions perform ad-hoc blocking (caller blocks until callee returns).  Long running loops and deep recursion are bugs, not features.  Developers need to kill buggy software, end-users shouldn't be expected to pay for and use developer-level operating systems.

"Programming languages" for developers are vastly different from "programming languages" for end-users.  The basic concerns are different.  End-users want fast and cheap, developers can afford to buy souped-up hardware and don't need fast and cheap. Turn-around time and ability to express concepts at higher levels is what developers need.  Only a certain class of developers - Production Engineers - need to convert high level software into fast-and-cheap software for end-users.  All other developers don't need to have their hands tied behind their backs with concerns for Optimization.

Forcing all developers to use Production Engineering tools slows down product development - at best.  Most of the time, software products don't meet end-users' needs, because developers are using the wrong tools.

Worse, the wrong tools are foisted into the hands of end-users.  Some software products overcome these deficiencies and become successes, but, most don't.  The biggest success in end-user software design is the spreadsheet, yet, most end-user apps (e.g. websites) are not set up as spreadsheets.

The chasm is exacerbated by the fact that software techies are schooled in the use of compiler-appeasment languages and Production Engineering.

The few techies who do have sensibilities and schooling in Design, are forced to use Production Engineering compiler-appeasement languages to build software.  Designers' skills are thwarted by the fact that they are required to build clockwork apps that are highly-coupled internally - stuff that software technies and theorists know how to do, but, is unnatural to just about everyone else.

The answer, IMO, is not to build more synchronous functionality into languages, 

Is it possible to 

Efficiency of notation leads is taught to 

---
0) guess: maybe the answer lies in expanding the definition of delim?, e.g. something like delim = ("/" "88")? "," You've specified the Account rule capitalized, so it skips spaces and newlines.  The "?" stuff makes delim optionally match the continuation code (skipping newline in between), and, maybe make eor = "/" ~"88" so that eor never matches the continuation code
1) don't think "... convert it to a single line ...", instead, think which sequence of fields you want, separated by delim with the "/" "88" stuff optionally thrown in
2) just in case you're not already using ohm-editor: (a) fire up https://ohmjs.org/editor/ (b) paste the grammar into the upper left-hand Grammar window (c) push "+ Add" in the Examples window and paste the account example into the example (d) select Start Rule "Account" (e) play with the grammar in ohm-editor until it works 
---

Thank you all, for your comments!  I find the insightful criticism to be quite helpful.

Hoping to clarify some points:

- IMO The Ground Truth is Programming, not Code.
- IMO, change, even big change, is possible, especially in a young discipline like this.  We are witnessing big change right now - the conversion of gasoline-powered automobiles to electric-powered automobiles.  The enormous infrastructure for supplying gasoline is being replaced.  The figurehead for this huge change believes in "First Principles Thinking" [https://fs.blog/first-principles/].   Counter-arguments against big change might include: 
	- The fact that electric cars still have 4 wheels and still have offset steering wheels (instead of centered steering sticks as in the first automobile) 
	- The fact that the change-over from gas to electric is being facilitated by the existence of hybrid cars.  
	- Computer keyboards are still QWERTY.  
	IMO, change is driven by perceived orders-of-magnitude improvement (in process? ... in what?).  It remains incumbent on me to explain why I think that it is possible to improve on programming, noting that hardware has improved, and, noting that end-user apps have improved, while maintaining the assertion that programming languages have not improved proportionally.
- PEG blurs the line between characters in a Scanner vs. tokens in a Parser.  IMO this is important and may lead to change.
- IMO, snipping ALL dependencies is important and may lead to change.  Hence, this long response to an issue in an experimental code repo. To my eyes even simple`f(x)` causes several kinds of dependencies that are ripe for snipping.
- SVG.  This is the simplest (albeit useless) example of SVG as a "programming language" that I could imagine.  There's more, and this is but a hint.  This useless example transpiles a diagram to running Python code. The live code is at [drawware](https://github.com/guitarvydas/drawware).

https://github.com/guitarvydas/drawware/blob/dev/sourcecodehelloworld.png?raw=true

![hello](https://github.com/guitarvydas/drawware/sourcecodehelloworld.png)
	
```
<html>
  <body>
    
    <h1>My first SVG</h1>
    
    <svg>
      <g id='myfunc'>
        <rect x="20" y="0" width="280" height="130" rx="19.5" ry="19.5" fill="none" stroke="black"/>
        <text x="120" y="19">myfunc</text>

        <g>
          <rect x="60" y="40" width="200" height="60" fill="#f8cecc" stroke="#b85450"/>
          <text x="70" y="64">print ('Hello ', end='')</text>
          <text x="70" y="84">print ('World')</text>
        </g>
        
      </g>
    </svg>
    
  </body>
</html>
```

the Ohm-JS grammar that I used is:
```
CodeDrawing {
  Main = "<html>" "<body>" H1 Drawing "</body>" "</html>"
  H1 = "<h1>" stuff "</h1>"

  Drawing = "<svg" stuff ">" CodeContainer "</svg>"
  
  CodeContainer = "<g" FunctionName ">" Boundary Title CodeBlock "</g>"
  
  Boundary = "<rect" stuff "/>"
  Title = "<text" stuff ">" name "</text>"
  CodeBlock = "<g>" RedRect Text+ "</g>"
  RedRect = "<rect" (~AttrRed any)* AttrRed stuff "/>"

  FunctionName = "id=" sq name sq
  Text = "<text" stuff ">" stuff "</text>"
  AttrRed = "fill=" dq "#f8cecc" dq

  stuff = notElementChar+
  notElementChar = ~"<" ~">" ~"/>" any
  name = letter alnum*
  sq = "'"
  dq = "\""
}
```

And my personal notation ("Fab") that completes the transpiler is:
```
CodeDrawing {
  Main [khtml kbody H1 Drawing kbodyend khtmlend] = ‛«Drawing»’
  H1 [kh1 stuff kh1end] = ‛«kh1»«stuff»«kh1end»’

  Drawing [ksvg CodeContainer ksvgend] = ‛«CodeContainer»’
  
  CodeContainer [kgroup FunctionName k Boundary Title CodeBlock kgroupend] = ‛def «FunctionName» ():«CodeBlock»
«FunctionName» ()’
  
  Boundary [krect stuff kend] = ‛«krect»«stuff»«kend»’
  Title [ktext stuff k name ktextend] = ‛«ktext»«stuff»«k»«name»«ktextend»’
  CodeBlock [kgroup RedRect Texts+ kgroupend] = ‛\n(-«Texts»-)’
  RedRect [krect cs* AttrRed stuff kend] = ‛«krect»«cs»«AttrRed»«stuff»«kend»’

  FunctionName [kid sq1 name sq2] = ‛«name»’
  Text [ktext stuff kend stuff2 ktextend] = ‛\n«stuff2»’
  AttrRed [kfill dq kred dq2] = ‛«kfill»«dq»«kred»«dq2»’

  stuff [cs+] = ‛«cs»’
  notElementChar [c] = ‛«c»’
  name [c1 cs*] = ‛«c1»«cs»’
  sq  [c] = ‛«c»’
  dq  [c] = ‛«c»’
}

```

The generated Python code (from the diagram) is:
```

def myfunc ():

  print ('Hello ', end='')
  print ('World')
myfunc ()
```


FYI - Fab transpiles to JavaScript code that can be used in conjunction with Ohm-JS.  I got tired of writing JavaScript, so I built an SCN (nano-DSL) for myself.

I've chosen not to include the generated JavaScript code in this thread, but have pushed a working transpiler to the github listed above.

[pardon the cave-man HTML, but I don't know enough about building web pages, and, clearly, need help]

31:50~ "In a 'real' Computer Science, the best languages of an era should serve as 'assembly code" for the next generation of expression.
[https://www.youtube.com/watch?v=fhOHn9TClXY&t=859s](https://www.youtube.com/watch?v=fhOHn9TClXY&t=859s) 
Alan Kay


---

FYI - what the inventor of the Amiga OS is thinking about these days https://altscript.com
