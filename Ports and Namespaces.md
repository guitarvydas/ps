A port is a block of data.

A port has a direction
- input
- output

A port can be destructured into several *types* of data.

In classical notation, we might write:

`f (x, y, z) -> r`

This represents two (2) ports - one input port and one output port.

The input port `(x, y, z)` can be desctructured into three sub-parts
- x
- y
- z

The output port, in the above example, consists on one datum `r` and can be destructured as
- r

All data on a port arrives (and leaves) at the same time - synchronously.

Ports, though, are asynchronous.  For example

`f (u, v, w) (x, y, z) -> r`

describes two input ports and one output port.  There is no implicit synchronization between the two input ports `(u, v, w)` and `(x, y, z)`.  `U`, `v` and `w` always arrive together as a block and `x`, `y`, `z` always arrive together in a block, but the arrival time of the first block is not dependent on the second block.  In fact `(x, y, z)` might arrive before `(u, v, w)`

In some languages, we are allowed to name each input parameter.  In earlier languages, parameters were stored in arrays.  Access to the parameters was based on their position within the array.

Input parameters and output return values can be treated in the same way with a normalized syntax, i.e. as desctructurable namespaces.

Normalizing is useful for automating and for describing machine-based algorithms.