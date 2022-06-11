Looping - superceded by recursion - is a method for describing data, not to be confused with a method for describing control flow (sequencing).

Looping feels "natural" to non-programmers and should be considered a UX feature (implemented, hidden away, as recursion in the bowels of the UX).

Looping, hence, recursion, makes no sense in distributed programming, where the model is two machines connected by a thin wire (e.g. the internet).

You cannot, efficiently, send a complete *stack* back and forth across a thin wire.  Recursion is usually implemented using a hardware stack (i.e. CALL / RETURN instructions).  It doesn't make sense to use a *stack* as a primitive in defining notations for distributed programming.

[[Synchrony Leads to Epicycles]]
[[yy-@The Stack]]