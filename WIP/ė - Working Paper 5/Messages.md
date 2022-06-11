A *message* is a blob of data.

The data can be deconstructed into various other sub-kinds of data.

Messages can be wrapped in a hierarchically nested manner.  Message data can be contained in messages.

This is much like layered network protocols, except that network protocols tend to contain error-correcting information, which is, conceptually, semantically different from the final datum. 

![[functionsassm-messages.png]]


When flattened to streams, messages might appear as:

![[functionsassm-wrappersflattened.png]]

[Note that in traditional hardware-based message packets, wrappers tend to have bytes at the head and at the tail of data.  This kind of wrapping is unneccessary for software components, but, might be required if the messages are transported to other computers.]