I think of programming in terms of *divide and conquer*.  Very roughly, programming breaks down into two (2) steps:

1. grok
2. re-format

Step (1) is *parsing*.

What you do *after* you parse and capture matched snippets, is (2).  This is sometimes called *semantics*.

Step (1) consists of slurping a target in and checking to see that it has the right shape and parameters.

We are used to thinking of parsing as applied to text files, e.g. what we call *programs*.  Yet, if we step back and think of parsing as *pattern matching*, we see that parsing applies to any kind of input format, text, *.csv*, diagrams, etc.

The common thread in generalized parsing is that we use a machine to do the recognition work for us.

Currently, most of our parsing tools assume that the input must be in "structured text" form, containing balanced brackets.

Changing one's view of *parsing* to include other forms of input allows us to consider
- line-oriented formats like .csv
- indentation-oriented formats like Python programs
- section-oriented formats like markdown
- more outré formats, like diagrams.

Our goal is to convert all of these formats into "structured text", then use existing tools to process the information.  We don't care if the converted formats are "readable" by humans, just as long as they are readable by machines.
