Yes, Raskin might call this in-humane.  Today's UI is built for ease-of-programming, but, the result is a clunky UI.

Maybe what is needed is a way to map from the ease-of-programming domain to the UI domain, i.e. 
1. recalculate the whole screen using FP, 
2. then make the UI suck less from a user's point of view.  E.G. a mapping that doesn't move the contents of the screen (like the physical position of the cursor, or auto-expansion of details) unless instructed by the human user.

IIRC, the UNIX 'curses' library does something like this.  It caches the screen bitmap then uses newly-generated technical details to create the next screen bitmap, modifying as little as possible.  

Curses was invented to solve efficiency problems, but, maybe a similar strategy can be used to solve UX problems.

---

What's going on here?  @... can you explain in about 1 sentence how I would build one of these characters?  (Or, do I need to build 2 characters plus one space in the ecosystem?)

What's going on in RainWorld?  Technically?  I would like someone to explain to me, in about 1 sentence, how to write a program for the minimal pieces of this.

---

@Ivan

Thank you!

Hmm, so I think that I get some of it, yet am left wondering about other parts.  What I think I see is:
1) characters are animated with active nodes ; active nodes are like Actors
2) there are 2 Forces at work (a) the Force of Gravity, and, (b) the Force of Intention (funny, they didn't teach me about that one in Physics class)
3) like with any graphic-y thing, the more nodes you have, the more realistic it looks (probably related in some way to the Nyquist Theorem)

I am left wondering about (1) how/what determines the "ideal" grab point? and, (2) what is this AI thing that they keep waving around like a magic wand?  (as soon as you understand how it works, it stops being AI).

Is this stuff being used in robotics?  Childrens' toys? (A swarm of hungry drones playing tag with a 5yo).

---

Think out loud: I'm trying to summarize what I think I saw you do at the Dec. torlisp meeting:
1. I argue, elsewhere, that computers are a new medium for thought, like clay tablets, paper-and-pencil, functional notation are to mathematicians.
2. I saw you use Blender as a tool for thought.  You calculated the distortion required for presenting a certain view.
3. In essence, you used Blender like mathematicians crank equations and mathematical Laws.
Comments?
You could have done all this in 2D using math, instead you used Blender to think about it in 3D.

---

> The hard part of procedural animation is making it look like it flows from one frame to the other. It's easy for a computer to evaluate a position and statelessly decide what the next best position is. However without some sense of history (state, goals, whatever), the animation will appear disjoint because a computer doesn't care what it looks like, only that it's generated a reasonable next state. We ran into this when we did the animation for DreamWorks' _Joseph: King of Dreams_. We developed an oil painted effect (similar to the one in _What Dreams may Come_), but while the computer could place the initial oil "paint" blobs, it was lousy at developing them to follow motion. We had to have human animators move them around. Of course, we were using 66Mhz Pentiums at that time. We might have been able to do better with more compute...

State is part of reality.  A notation that excludes State might be useful, but is not so good at expressing statefulness.  Nobel Laureate Ilya Prigogen rants for about 100 pages in "Order Out of Chaos" about how functional thinking set Physics back by 100 years.

> ...  it was lousy at developing them ...

That's not the computer's fault, it's the programmers' fault.  A computer is just a machine.  Programmers who use functional-only languages are only building fancy calculators and under-utilizing computers.

---

https://github.com/guitarvydas/drawware/blob/dev/sourcecodehelloworld.png?raw=true

https://github.com/guitarvydas/eh


---

1st principles thinking

---

FWIW: 

1. do you want to read old papers, or,
2. do you want to learn about what is new and up-coming?
ChatGPT, MFM and artificial life, Ohm-JS, drawware example, py0d (can this be disentangled even more?), Component Based Programming (20 page graphic textbook), code: math to WASM POC, Descript (speech to text, then use text to edit timeline)

disclaimer: I believe in (a) breadth-first surveys (b) the more outre (alien) the better ; my agenda: write code that writes code

2 keys from 2022

miniKanren, PROLOG In scheme, PROLOG scm to JS

TOC diagram from blog

file:///Users/tarvydas/quicklisp/local-projects/drawware/hello.html

how to compile excalidraw to JS / Python / whatever?  what is the language subset?  goal: every figure must compile to something, if you can't compile it, don't use it (exception: comments) [NB this is what we did with English prose in creating textual  programming languages]

call return spaghetti, ohm-js in small steps, ALGOL bottleneck

Kinopio Obsidian, Obsidian Canvas, Obsidian dataview, MFM

bash - pipeline commands to construct new commands

1st principles: takeaways

how to write "hello World" in excalidraw, how to compile it to python
- hybrid: not just diagrams, not just text, both, diagrams+text (SVG supports this concept, excalidraw supports this concept)
- issues: define a new text language or use existing one(s)?
- issue: how to detect connection
- issue: how to detect containment

write a specific search in PROLOG syntax, transpile to Python
- issue: do we ned Unify()?  can we optimize it away, for specific use-cases?
- what does the input look like?  do we need to create a "reader()" routine?
- what does the output look like?
- do we need all of PROLOG's features, like Functors, or can we ignore some of these for expediancy? Cull?
- issue: if-then-else is ad-hoc, does PROLOG syntax provide a way to constrain

StateCharts - Lambda layer-wrapping for State

---

> We’re looking for new material for [#thursday-night-cs](https://cscabal.slack.com/archives/C010W33VAF7) — anyone have anything they're excited about showing us? Shorter is better, a paper or a blog post or a video or a program, something we can digest in maybe 30 minutes to 6 hours.

Not sure if my opinion counts, but...

I recently posted the stupidest "hello world"-as-a-diagram note to FoC and then explained it at the last TorLisp meetup (i.e. how to "compile" that diagram to Lisp and Python).  I thought that it was "so obvious" that, surely, it couldn't take more than 5 minutes to show, but I had to cut off questions after 1 hour...  I guess I've got some more learnin' to do about who is my audience...

If anyone is interested, I can post a link to the code and/or I can wing another talk about it.

other ideas: 
- I found it very helpful to try to summarize 2022 in 2 points about tech.  It might be quite interesting to have everyone talk what tech impressed them the most in 2022 and why.  I would happy to share my essay (and/or talk about it).  
- learn shell programming - functions calling functions are not the same as pipelines ; functions use the callstack (LIFOs), pipelines use queues (FIFOs) ; pipelines could easily be faked by closures with one input queue and one output queue plus a wrapper for routing messages between its children (I think that I've got some Python code for this up on my github "py0d")
- I can share lots of code and essays... (ask for details (I don't want to bore you)).
- I value alien/outre technology - the weirder the better.  I'm currently eyeing: Descript (speech to text, then edit the text to edit the timeline), Kinopio, Obsidian, Obsidian Canvas, Obsidian Dataview, MFM, Ohm-JS, RainWorld.  I wish that I knew more about ChatGPT, Dall-E2, Clerk (Jack Rusher), FAB/BRED (my experiments with something as quickie as REGEX, but recursive), etc., etc.
---
Kinopio as notebook 
- exec JS in cards
- use ports and connections to specify order
- use containment to specify order

---

I've been watching a lot of Rick Beato youtubes.

https://www.youtube.com/c/RickBeato

This most recent video seems to summarize a lot of what he teaches. https://www.youtube.com/watch?v=8PT9GdlLZdI

The video is about the song "Wichita Lineman" written by Jimmy Webb and sung by Glen Campbell.

I never really learned Ear Training, because it seemed too boring.  I wish that I had learned more about it.

The "secret" to interesting music or lyrics or books is "tension".  Beato calls this "dissonance".  Pattison shows how to create lyrics that contain dissonace.  Great songs have both, musical dissonance and lyrical dissonance.  Great recordings of great songs create a continuously-changing soundscape. Great singers use phrasing. On acoustic guitar, you can play a sus chord (my favourite band, Jethro Tull, did this a lot (Dsus4 resolved to D)).

The opposite of dissonance is boringness - in music this is often the use of I-IV-V progressions, in lyrics this is the use of couplets and overly-happy rhyme schemes.  In production, boringness is lack of change in soundscape, and over-use of cut/paste.

In Production, there is the Rule of 8 - change something in the soundscape (drop an instrument, add an instrument, change an effect, etc.) every 8 bars.  The continuous flow of changes causes "surprise" which is another form of tension.

The goal is to fight predictability.  Good songs fight predictability on every front - musical, lyrical, production.

Good choruses are different from their verses.  How?  On/Off the beat, cut time / double-time, chord density (change chords once every 1/2 bar instead of once on every bar (explore "like substitution")), number of word stresses (for example, lyric legato in the chorus - fewer words per line than in the verse)

---

Test 1 is negative. I feel like I'm getting better. We intend to come, unless I feel really lousy in the morning.  I will probably rest a lot when I'm there.  We can stay away if you guys have reservations... 

---

black: - one main issue, 2 back-burner questions
- cough, sniffles, going around
	- my son's family had it over Christmas, son, grandsons, babysitting, cold
	- I usually ride it out, but thought to check in
	- no sleep, sleep sitting up
	- abdominal muscles and throat and chest ache when coughing
	- since Saturday - today is day 6
	- vit C vit D
	- cough, pleurisy in 1986 - since then all sniffles result in chest coughs
	- probably in last stages now
	- did covid rapid test (one) - negative
- other- procrasting - back-burner
	- Prevagen? brain function
	- Tinnitus
- deferred
	- blood pressure

render

---

Physics: 
- nothing is complicated with the right notation
- invent notation and choose simplifying assumptions
	- must remember what the simplifying assumptions are which invalidate the use of the notation
	- 
2022 summary: https://publish.obsidian.md/programmingsimplicity/2023-01-01-Summary+2022

py0d: https://github.com/guitarvydas/py0d

obsidian, descript, kinopio,
svg diagram to code
share kinopio page
