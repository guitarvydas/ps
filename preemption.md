Preemption is not necessary in a truly asynchronous system, since processes run at their own speed and handshake when synchronization is necessary.  

Imagine 2 rPIs connected by a wire.  

The rPIs are asynchronous and can run at their own speed.  Maybe one rPI is a cost-reduced version and the other is souped-up for speed, and, they truly run at different internal speeds.

The rPIs send blips (messages) to each other across the wire, when they want to communicate or synchronize.

[Aside re. optimization: In fact, the general model would use multiple one-way wires in each direction.  Reducing the system to a single wire is an optimization which costs CPU time for packing and unpacking the messages. In the ultra-general case, one would expect one one-way wire for each *type* of information, e.g. control message, int, float, compound object, etc.]