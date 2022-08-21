Parsers are DSLs that pattern-match text and produce *trees* (called *parse trees*).

The process of matching is sequence-based and records the "history" of what is in the text.

When we  read sentences in the English language,  we read from  left-to-right, top-to-bottom.  Most programming languages are structured  this way, also.  Parsers' main job is to read program text left-to-right and top-to-bottom and tp ensure that the progamming phrases make sense in  that  order.

How do you force a machine to read text  in the above order?  The problem boils down to fancy algorithms for searching, then searching again based on what was found earlier.

Parsing is like a fancy word-processor that repeatedly does *searches*.

It has taken decades to figure out how to do such searches and how to instruct machines to do this, but, there is nothing magical about the process.

Over time,  we developed a DSL to help the parsing process.  This DSL is called a *grammar*[^regex].  

[regex]: REGEX is another DSL for specifying matches.  Parsing is more powerful than REGEXing. [[regex]]

In the process of parsing, the parser actually performs a *tree walk* of the input text.  It walks through the text like the text was a tree data structure.

We can add *hooks* to parsers, so that as they walk through the input text, they call the *hook* routines.  Often these *hooks* are called *semantic routines*.

I call semantic routines *baubles* because I think of them like Christmas-tree ornaments, something that you hang off of the main skeleton tree.  Different sets of baubles can be hung off of the same bare tree.

During the parse tree-walk, the parser can call *hooks* and cause interesting bits of code to fire.

At one extreme, we call the parser *once* to create a parse tree from input text, then we hang *all* semantic and code-emitting baubles onto the tree.

At the other extreme, we recognize that text is "just" serialized trees that can be walked by parsers.  "Text" is just a mini-DSL waiting to be parsed. At this extreme, we create a different "tree" for each divide-and-conquer concept that we want to deal with.  We build many parsers, at least one for each intermediate mini-DSL.

The idea of building *many* parsers used to be considered repugnant because building parsers was difficult.

Today, with PEG (and especially Ohm), it is easy to create parsers.

A parser is just an *iterator* for specific data structures.  The data structures are defined by mini-DSLs (text for now, diagrams in the future).

So, we can create a mini-DSL for *each* divide-and-conquer task that we can imagine.

The job of a mini-DSL parser is 
- to tree-walk the input, 
- call *hooks* in the process, 
- then poop out new text in a new mini-DSL format to be fed to the next parsing pass in the pipeline.  The "new text" is actually a data structure that we can define to our own liking.  The data structure is flattened and streamed.  The (next) parser will de-flatten the data structure and call its *hooks*.  Is this process "less efficient" than building *one* tree and then doing *everything* based on that one tree?  Yes.  But, I think that it is better to allow programmers to focus on very specific tasks and get them right (bug-free) as quickly as possible, even if in the process, we waste machine-time.  Machines are supposed to help programmers, and not hinder their thinking processes.

[[SCN]]
