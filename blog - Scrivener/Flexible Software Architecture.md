Title: Flexible Software Architecture  
Author:

- no dependencies
- no way to call peers
- parent routes data


I recommend that every component have two queues - input and outputs.  This allows deferred sending and promotes architectural flexibility.

I recommend that a component never mentions or calls another component.   This causes hidden dependencies.  I recommend that components send messages to their outputs, allowing their parents (and the dispatcher) to route data to its destination.

I recommend that messages be 2-tuples - a pin (essentially a tag) and data.