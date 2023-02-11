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

The answer, IMO, is not to build more synchronous functionality into languages, but to find ways to build software in disparate layers (loosely-coupled down to tightly-coupled) and to bolt such layers together.

Is it possible to 

Efficiency of notation leads is taught to 