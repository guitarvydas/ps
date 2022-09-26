blog: https://www.flyde.dev/blog/introducing-flyde/

sp: cuncerrency (concurrency)
sp: **enviornment**
typo? `execute('my-cool-flow1)`

typo: ... much harder then today ... than

typo: ... by [staring the project](https://www.github.com/flydehq/flyde) ... starring?

You get 1 sentence (or less) to grab someone's attention and make them believe that Flyde is 10x better than anything else.  What is that sentence?


playground: https://www.flyde.dev/playground/fibonacci/

... the "Fibonacci" part calls itself recursively ... recursion, LIFO, is available in all modern programming languages, whereas FIFO is something else, and, more powerful, IMO - or - a language needs both LIFO and FIFO

I clicked on the "zoom" bar at bottom right (text was too small for me).  Result was a larger diagram moved to the right and no way to go back again.  (I was using Safari)

Clicking on "n" at the top made the wire disappear.

Show: more than 1 result.  Something Functions cannot do.

How do you delete a wire?  How do you make a wire? How do you connect an output to an input?

Took a while for me to figure out that input variables are blue, constants are green and outputs are red.  Took a while to "see" that hovering over a node popped up its inputs and outputs.  Not yet obvious why some inputs are always displayed while other ports (mainly "r"s) are not permanently displayed.

Not sure yet what the dotted line means.  

Not sure what "activated XXX times" means.

The blog talks about how the diagrams are related to the codebase.  I don't "see" this.

After moving nodes around, now "Calc Fib(3)" appears to do nothing.  RHS still says "nothing to show".

Personally, I think that functions are "toy examples" and that I could build Fib() in text faster/easier.  I want an example that is crazy hard in text.  Conundrum: programmers are conditioned to believe that text is THE answer to all programming, and, are oblivious to problems that are difficult when expresses as text (like concurrency).  Solution: (1) educate programmers that text makes some things harder than necessary, (2) show them that Flyde is better-than-text for those problems.  Argh, this is not easy.

Not at all obvious why anyone would want to bother with diagrams.  UML tainted the notion of diagrams.  Programmers implicitly believe that all diagrams are UML and that diagrams are more trouble than they're worth.  Programmers believe that VPL means "parsing arbitrary Art" while programming means parsing a very restricted form of prose that must be represented as non-overlapping character cells on a strict grid.  Major re-education required. Early adopters will not bother to use the technology unless there is some HUGE perceived benefit. Audience == early adopters, not the majority of programmers who are indoctrinated to believe that text is THE answer.

HelloWorld() and Fib() are for believers - basically documentation.  What will convert people from non-believers to believers?  (Note to self: why am I building HelloWorld() in 0D?  Who is this supposed to impress?).

Killer apps: spreadsheets, HyperCard, games (beginning with Adventure), word processors

Fib() ain't a killer app anymore.  Maybe Fib() was an interesting problem in 1950, when it was thought that the only use for computers was as fancy calculators for ballistics problems.

Killer app wannabes: AI to make marketing even better (worse :-), robotics, blockchain, unforseen developments in gaming, unforseen uses of computers, enabling domain experts to automate processes in their domains (which domains???)

Boring, already-solved problems: websites, calculators.

Note from my friend Rajiv, re. Alan Kay quote:
31:50~ "In a 'real' Computer Science, the best languages of an era should serve as 'assembly code" for the next generation of expression.
[https://www.youtube.com/watch?v=fhOHn9TClXY&t=859s](https://www.youtube.com/watch?v=fhOHn9TClXY&t=859s)"

---

continued...

---

14. Itch.io game jams.  Source code is unencumbered.  Game writers need NPCs (basically Actors and concurrency).  I am looking at: 

and https://oofoe.itch.io/ghost-stars

https://hg.sr.ht/~oofoe/qube-cat/browse/qc.rkt?rev=tip

because I know oofoe and can ask him questions.

Programmers think that Racket and Clojure are futuristic.

- iOS phone software, need "youtube easiness" for creating iOS apps, many complaints on PiLuD from Raoul re. developing games (who wants "faster horses" - more typing complexity piled onto existing programming paradigm)

- Descript, sequence editing - uses AI to match up spoken text with time sequences, allows Word-like editing of audio/video instead of the standard models based on mixing boards

- programming by example

- simplicity (simplicity == lack of nuance (no options, no parameters, etc.))

- strict, but easy-to-understand, rules - e.g. the way spreadsheets are rigid but flexible

OTOH: programmers are highly opinionated, and, highly indoctrinated and tend to think that diagrams cannot possibly help them.  Maybe we need to ignore existing programmers (wait for them to retire) and enable other domain experts, the way spreadsheets enabled doctors' office automation.  What do non-programmers want (but don't know to ask for)?

OTOH: you only need to involve pro programmers after an idea has been developed and beta-implemented

Programmers are anti-adept at making something visually pleasing.  Need to involve artists, e.g. collaborators.

I'm currently looking at:
- treesheets
- sector lisp, lambda lisp
- Ohm-JS (PEG) for parsing simple phrases and turning them into code (maybe I think that end-users want a box with two inputs - (1) the prototype phrase and (2) a live phrase, which produces (3) some output or triggers a useful action)

- maybe start out with specific solutions to specific problems (Flyde, FBP is "easy", right? so knocking off specific solutions)

- observation: "trees" are an invention of programmers, real people use nested boxes, not flattened trees (think "whiteboards")

- observation: oofoe created "ghost stars" game but labored creating a "scripting language" for scenes in the game, I knocked one off (after-the-fact) in minutes