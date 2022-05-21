# Introduction

I have worked with - and implemented - State Machines and StateCharts for much of my career.

This booklet is an attempt to highlight the StateChart-related points that I think are important.

I presented the StateCharts paper at a Toronto Papers We Love meeting[^1] and include the slides from that presentation.  I have added an audio track to the slides.

[^1]: PWL Toronto, August 2019

The paper *looks* like it's long.  It is 44 pages long and has 9 sections.  The paper, though, consists mostly of pictures.

The paper introduces the StateChart notation then culminates in a detailed example.

I feel that the paper / technology has hidden gems in it and that it teaches several other concepts in a subliminal manner, such as:
- State is Not Bad
- Notation can help understanding
- Divide and Conquer
- Diagrams are a Superset of Text
- Containment.

The StateCharts paper presents two innovations
1. hierarchical state machines that provide *structure* to state-based programs
2. concurrency.

I ended up separating the two into distinct notations, and call them
1. HSM - Hierarchical State Machines
2. ASC - Asynchronous Software Components, similar to FBP[^fbp], but based on message-passing instead of streams.

I think that Harel's paper describes HSMs sufficiently.

At the moment, I am concentrating on describing ASCs.


[^fbp]: Flow-Based Programming, https://jpaulm.github.io/fbp/

#statecharts 
