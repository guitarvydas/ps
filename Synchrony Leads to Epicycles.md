Distributed machines are inherently asynchronous.

Using *only* a synchronous notation to express the design of distributed sytems leads to *epicycles* (AKA *accidental complexity*).

The minimum expression (that I can think of) for multitasking is only a few bytes long, yet, because we try to express this simple concept in a synchronous notation, we have created behemoth programs, called *operating systems*, rife will finely nuanced *gotchas* (e.g. priority inversion, preemption).  This is similar to the conundrum faced by humanity when using Ptolemaic Cosmology[^epi] in lieue of a better model The Copernican Cosmology. 

[^epi]: I think that the term *epicycle* originated due to the Ptolemaic approach to cosmology.

Synchrony is suitable for data description.

Synchrony is *not* suitable for control flow description.

We need a different DSL (aka notation) for expressing sequencing.  Some of the options that spring to my mind are:
- diagrams
- Statecharts
- network diagrams
- Drakon
- FBP

[*FYI, by "diagram" I mean using diagrams as syntax for programming languages (DaS), not the idea of creating diagrams from text.  We have a cultural fear of parsing diagrams, based on biases developed in the mid-1900s. 
 Things have changed.  Yet, we continue to use crufty ideas from the past.  [FYI - it is possible to parse diagrams using current-day technology, see my d2f and d2py experiments].*] [[Diagram Notation]]