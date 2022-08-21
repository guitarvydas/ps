One of the brain-saving tricks in compiling is the idea of creating more than one parse tree, in a pipeline.

Each parse tree is a mini-DSL for a specific task.

Each parse tree has a set of methods associated with it for accomplishing one very specific task.

Parse trees are just data stucture objects, like OO objects.

Semantic baubles are attached to parse trees, like *methods* can be attached to OO objects.

In many cases, programmers imagine that the parser creates but one parse tree, then, they hang *all* of the semantic baubles onto that one tree.

This approach is anti-divide-and-conquer.

Instead

[[%Parsing Idioms/Parsers, Tree Builders, Tree Walkers]]