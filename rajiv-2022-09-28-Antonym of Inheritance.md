Not in “programming languages” per se, but it can be seen in windowing systems and StateCharts and diagrams of nested boxes.

 I tried searching parent-child-relationship literature.  Maybe the closest I got was “parental authority”.

Inheritance allows a Child to override methods of a Parent, but, in windowing systems (graphics) and StateCharts, the Parent gets first dibs on incoming events.  In graphics/windowing systems, mouse events are trickled in from the top down through layers.  If a layer doesn’t wish to deal with the event, it punts the event to a lower level.  If a layer wishes does deal with the event, it snags the event and doesn’t let lower layers see it.

With “parental authority”, if a Parent class says “this is so”, it is so and no child can override the behaviour.  If you look at the code for a particular layer, it stands alone and always means what it means.

Inheritance, though, allows a Child to override behaviour of a Parent.  This is implicit coupling and makes it impossible to understand the behaviour of a class just by looking at the class.  Debugging the bahviour of an OOP program is a chore (ask me how I know :-).

Analogy: if you have a set of nesting Russian dolls, you don’t expect the outer-most doll to change if a doll is added several layers down.

Windowing systems / graphics and Statecharts work that way (nesting with parental authority), whereas software written with inheritance does not work that way (by default).

The difference is subtle, because you CAN implement this control flow in most languages, e.g. Python.  But, you don’t.  You can implement any Rust program in assembler, but you don’t.

I strongly believe that words and language affect the way we think.

I don’t use the word “model”, I use “compile”.

I want to avoid using the word “inheritance”.

(“Function” is, also, a loaded concept, since it guarantees (1) blocking and (2) synchrony and (3) ???)