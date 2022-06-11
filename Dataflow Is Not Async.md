#response

Dataflow is not async, as concurrency is not parallellism.

Async -> diagrams, but, diagrams not-> async.


You must have concurrency before you can have parallelism.

You must have 0D (zero-dependencies) before you can have async.

I would be very happy to discuss this at length, but, I worry about spamming you, hence, I hold back...

---
> We did talk about a "conveyor belt" model of dataflowesque programming, which is naturally aligned with fire-and-forget async calls, and also naturally aligned with diagrams.

> But we didn't dig into this idea that it is **because** it is fire-and-forget that it is aligned with diagrams

These statements push my buttons at numerous levels.  Opinions'R'us...

I would be very happy to discuss this at length, but, I worry about spamming you, hence, I hold back...

Async is not dataflow, as concurrency is not parallellism.  (See Rob Pike).
Async enables diagrams, but, diagrams do not necessarily enable async.
You must have concurrency before you can have parallelism.
You must have 0D (zero-dependencies) before you can have async.
Functions are state machines and cannot model computers faithfully.

---
I would be very happy to discuss this at length, but, I worry about spamming you, hence, I hold back...  Ask if you want more ...

Async is not dataflow, as concurrency is not parallellism.  (See Rob Pike).
Async enables diagrams, but, diagrams do not necessarily enable async.
You must have concurrency before you can have parallelism.
You must have 0D (zero-dependencies) before you can have async.

---

Concurrency is not parallelism (Rob Pike).
Async is not dataflow, likewise.
You must have concurrency before you can have parallelism.
You must have 0D (zero-dependencies) before you can have async.
Async enables diagrams, but, not necessarily, the other way around.
Async and concurrency can be faked on a single CPU using epicycles, but, epicycles cause gotchas (see Mars Pathfinder disaster).
2 separate rPIs connected by a wire are parallel and are async.  Neither one needs faked concurrency nor faked async, but we program them that way anyway.
You need 0D for fire-and-forget.

---

Concurrency is not parallelism (Rob Pike).
Likewise, async is not dataflow.
Async and concurrency can be faked on a single CPU using epicycles, but, epicycles cause gotchas (see Mars Pathfinder disaster).
2 separate rPIs connected by a wire are parallel and are async.  Neither one needs faked concurrency nor faked async, but we program them that way anyway.
I would love to discuss this at length, but I worry about spamming this group.  Let me know if I should give more opinions...

---
Concurrency is not parallelism (Rob Pike).
I would further add that async is not dataflow.
Async and concurrency can be faked on a single CPU by epicycles, but, epicycles lead to gotchas (see Mars Pathfinder disaster, thread safety, etc.).
2 separate rPIs connected by a wire are parallel and are async.  Neither one needs faked concurrency nor faked async, but we program them that way anyway (Why?  "Because we've always done it that way").
"Fire and forget" - I call this 0D (zero dependencies).  If you have 0D, then the conveyor-belt paradigm, the dataflow paradigm, the event-driven paradigm, diagrams as syntax, lack of Docker, packaging, etc. become easier.
I would love to discuss this at length, but I worry about spamming this group.  Let me know if all y'all would tolerate more of my opinions here...

---
Concurrency is not parallelism (Rob Pike).
I would further add that async is not dataflow.
Async and concurrency can be faked on a single CPU by epicycles, but, epicycles lead to gotchas (see Mars Pathfinder disaster, thread safety, etc.).
2 separate rPIs connected by a wire are parallel and are async.  Neither one needs faked concurrency nor faked async, but we program them that way anyway (Why?  "Because we've always done it that way").
"0D" - zero dependencies.  I think I used to call this "concurrency" and before that, I used to call it "parallelism".  If you have 0D, then the conveyor-belt paradigm, the dataflow paradigm, the event-driven paradigm, diagrams as syntax, lack of Docker, packaging, etc. become easier.
"Async" - Something isolated in the dimension of *time*.  Very much like 0D, but uses a different word to emphasize the time-ness of the thing.
"Fire and forget" - needs, both, 0D and async.
I would love to discuss this at length, but I worry about spamming this group.  Let me know if you would like me to expand.

---

thoughts...

Concurrency is not parallelism (Rob Pike).
I would further add that async is not dataflow.
Async and concurrency can be faked on a single CPU by epicycles, but, epicycles lead to gotchas (see Mars Pathfinder disaster, thread safety, etc.).
2 separate rPIs connected by a wire are 0D and are async.  Neither one needs faked concurrency nor faked async, but we program them that way anyway (Why?  "Because we've always done it that way").
"0D" - zero dependencies.  I think I used to call this "concurrency" and before that, I used to call it "parallelism".  If you have 0D, then the conveyor-belt paradigm, the dataflow paradigm, the event-driven paradigm, diagrams as syntax, lack of Docker, packaging, etc. become easier.
"Async" - Software isolated in the dimension of *time*.  Very much like 0D, but using a different word to emphasize the time-ness of the software component.
"Parallel" - similar operations done at the same time.
"Async" - non-similar operations done at the same time, (results are joined by the uber-container)
"Fire and forget" - needs, both, 0D and async.
I would love to discuss, but I worry about spamming this group.  Let me know if you would like me to expand.