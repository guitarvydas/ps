I’ve been trying to get over my own biases, rooted in the mid-1900’s notion of “efficiency”.

My current thinking is to use divide-and-conquer to split programming up into 2 camps:
1. design
2. production engineering.

“Efficiency” means completely different things in each camp.

In camp (1), "efficiency" means "rapid prototyping".  Getting the bugs out of the design, getting the requirements, etc.

In camp (2), "efficiency" means squeezing blood out of the final product cost.

We have been trained to think that production engineering trumps everything else.  I currently believe that that is a bad idea. I currently believe that this idea is rooted in a fundamental misunderstanding of what Engineers do (Engineers don’t write code, Implementors write code).  

I feel that most of our programming languages are geared towards production engineering.

I feel that big-O analysis is silly in certain contexts, yet, useful in production engineering contexts.  In my experience, big-O doesn't really matter, but, what matters is only the question "is it fast enough?".  This question is, of course, answered by "it depends".  If you are a developer using a souped-up development machine costing lots of $'s, then "fast enough" means that you can waste CPU and memory resources in aid of getting-things-done.  If, on the other hand, you are a consumer who wants to use this app on a $5 rPI, the answer is different - the app shouldn't waste CPU and memory resources and should be aware of the limitations of the rPI.  Developers can use bloatware to speed up their task, like Linux (MacOS, Windows), but consumers shouldn't have to pay the costs of, also, using that same bloatware[^rpi].

[^rpi]: Yes, I feel that dropping Linux onto an rPI is blasphemous.  I feel that we do this only because we haven't figured out how to isolate software components, yet.  Isolation means (1) data isolation AND (2) control-flow isolation, not just (1) data isolation.  Operating systems gives programmers a sledge-hammer solution to (2) the control-flow isolation problem.

For years, I was obsessed with finding optimal ways to implement components.  Using *closures*, say, instead of bloatware operating systems.

Today, I am trying to force myself to overcome knee-jerk premature optimization.

You can prematurely-optimize code, but, worse, you can prematurely-optimize Design.

When you prematurely-optimize Design, you cut off consideration for other design possibilities, e.g. "thinking out of the box".

The "big wins" in optimization come, first, from Design.  Later, Production Engineering can create further wins, but, they must be tuned for specific purposes (like optimizing cost to the user).

So, currently I use this workflow:
1. Just Design It.  Using horribly inefficient code, e.g.  [[Operating System Based Isolation]]
2. Worry about "efficiency" when it is time for Production Engineering.

Using "one language to rule them all" seems like a good idea at first, but, it tangles considerations for "efficiency" with different considerations for "design".  The effect is to *reduce productivity*.

CEOs draw their ideas on a whiteboard and hand them over to software developers for a reason.  Whiteboard designs address only the *design* aspects of a product, unencumbered by the Production Engineering aspects.

Product ideas are often quite simple.  The minutae of making a product workable and saleable tend to be more complicated, but, these details don't affect the product idea much.  When the details do affect the original design, we create a "Change Order" and bubble the suggestions back up to the designers for re-thinking.
