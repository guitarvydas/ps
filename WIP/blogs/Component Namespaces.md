#hardwirednames

Components have their own name-space.

In the name-space, are:
- names of input ports
- names of output ports.

Notably, the name-space does *not* contain the names of other components (including the parent Containers).

A child cannot decide where a message is `Send()`t to.

Only the parent Container can decide how to route messages.

The parent-child relationship is defined at runtime (dynamically).  This allows components to be used in different situations (plugability).
