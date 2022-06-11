In my opinion, Ohm-JS is a breakthrough technology.

Ohm-JS doesn't do anything that hasn't been done before, but it recombines existing features in ways that let one think more freely.

At its most basic, the goal of programming is
- to control a machine (computer).

Programming breaks down into roughly two (2) activities:
1. grok[^grok]
2. reformat.

[^grok]: Understand.  Pattern-match.

At the moment, we try to program both of the activities in GPLs[^gpl] and we are constrained by what the language designers thought was most important (usually, Production Engineering (AKA "efficiency") is emphasized).

[^gpl]: General Purpose programming Language

[[Software Engineering is More Than Production Engineering]]

What if you had a DSL for doing activity (1)?

What if you had another DSL for doing activity (2)?

You could grok and reformat much faster, and free your mind to think about higher-level concepts.

That's what humans do.  Think.  Machines do rote work for humans.  The more rote work that you can offload to a machine, the better.

Ohm-JS is a DSL for activity (1).

Ohm-JS punts to JavaScript for activity (2), but, that's a good start.  Actually, Ohm-JS punts to JS in a very-automatable way, so that's not a good start, it's a great start.

PEG is wonderful.  PEG is better than REGEX[^sr].

[^sr]: PEG allows programmers to define subroutines ("rules").  REGEX doesn't.

Ohm-JS fixes some of PEG's failings (like conflating semantics and grammars in the same specification).

Ohm-JS is a better PEG.  

In fact, I think that Ohm-JS is the tipping point.  Work suddenly becomes a whole lot easier, with only a few subtle changes in the way you think about approaching problems.

As an example of what might be possible: I'm just an "average Joe" (if I can do it, anyone can do it). I started to use Ohm-JS and immediately saw that I could automate my workflow and I made rapid progress in dimensions that I hadn't even imagined.  I ended up building - incrementally - a tool, with the working title *prep*, that allows one to pipe together [[syntax-directed programs]].  With only 4 or so stages of pipeline, I managed to parse diagrams which led me to creating diagrams of the innards of lambdas [[[ė](https://guitarvydas.github.io/2022/04/12/Eh-Example-and-Internals.html)]].  

Diagrams are one of those "subtle" problems.  If you try to think of diagrams in synchronous terms, you usually give up in disgust, but, if you make small, subtle changes in how you think, diagram-based thinking becomes easy and obvious.  Prep allowed me to push lower-level details aside and allowed me to see diagrams in a new light.

[*The tool "grasem" allowed me to imagine and build "prep".  The tool "glue" allowed me to imagine and build "grasem".  The tool "Ohm-JS" allowed me to imagine and build "grasem".  The tool "OMeta" allowed others to imagine and build Ohm-JS. The technology "PEG" allowed others to imagine and build "OMeta".  The tool "S/SL" (Syntax/Semantic Language, Holt et al) allowed me to understand TDPL parsing (as opposed to LR(k) YACC-like parser generators) and syntax-directed programming.  The tool "TXL" (Cordy) allowed me to think about parsing as something more than compiling. Lisp allowed me to understand the true power of programmable macros. The DDJ article about SmallC allowed me to understand the innards of compilers.*]