In fact, messages are never sent directly from one component to another, but are sent "upwards" to the Container for routing.

Containers can only route messages of their direct children (and themselves).

This method ensures:
- message sending is structured and encapsulated 
- components are truly independent.  Components cannot know who receives their messages nor, *if* their messages are received at all.  The parent Container can choose to route inputs and outputs to N.C. - no connection.  The parent Container controls all message routing, a component cannot hard-wire destinations into its own code, thus, making the code usable in multiple situations.