![[ww-book-parsing Idioms/ohmeditor.png]]The screen is divided into 4 main sections — upper left, upper right, the middle and the bottom.

The upper left section holds the grammar under development. 

The upper right section holds various test cases. Test cases can be add using the `+Add` button or by double-clicking on a specific case.

The middle section (here showing `2 * ( 4 2 - 1 ) / 9`) shows the string being parsed.

The bottom section shows the resulting CST. The CST is gray when the parse is successful and red when the parse fails. Hovering over a node in the parse tree highlights the corresponding grammar rule.

On parsing failure, the red tree nodes can be opened (double-clicking) to examine details of the failure.