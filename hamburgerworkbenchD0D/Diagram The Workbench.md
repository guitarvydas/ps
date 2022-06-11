![[testbench.png]]
The rounded boxes represent *concurrent* software components.

The green circles represent *input ports*.

The yellow circles represent *output ports*.

The red rectangles represent synchronous code snippets.  In this example diagram, code snippets are written in JavaScript.

The gray rectangle, labelled "Order Taker" represents a Container component.

Arrows and lines represent one-way message-sending paths.  The components are concurrent and the only way they can communicate is by sending messages. [[Message Sending]]

The blue rectangle, labelled "Phrase Parser" does not display any red boxes.  This component is a wrapper for a large piece of JavaScript software that is not worth showing on the diagram.  It is assumed that rectangles with no innards are "implemented elsewhere" and will be brought into the mix by whatever means necessary (e.g. by the loader or linker).  In the case of this example, the "Phrase Parser" code is included as a "<script src=... ></script>" tag in the .html.

The transpiler creates Javascript code for all of the concurent components and the drawn-out synchronous components, but leaves a hole for the non-drawn synchronous code of non-drawn-out components.

In fact, every component is compiled into two code snippets
1. the Signature
2. the Implementation .

A signature snippet is generated for each blue box and each Container box.

Red boxes generate Leaf code Implementation snippets that are attached to the surrounding blue boxes.

The tool also generates Implementation code (child list + routing table) for each Container component.

The box labelled "Phrase Parser" is blue but contains no red box.  In this case, the tool generates only a Signature for the blue box and "assumes" that the Leaf code for the box will be linked in by other means.

Note the use of fan-out, where two output ports are coalesced into a single output.  For example, the "order no choices" and "order with choices" outputs both feed the "food order" output of the Container.  Fan-in and fan-out are required for a reasonable component-based UXs, although fan-out implies semantic questions for the transpilation (Q: how messages are copied to multiple sinks, are they shared, copied or copied-on-write, or ...?).