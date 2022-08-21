A parse tree is usually drawn as a 2D diagram with *nodes* and  lines between the nodes,  looking like an upside-down tree.

The *root node* is usually at  the top  of  the  diagram and the leaves are near the bottom.

The tree branches out  downwards and stops branching at the leaves.

The AST can be flattened and writtten  out as text.  That text is  called a  *grammar*.

Let's imagine a simple language that only  consists of expressions of numbers, using only two operators - plus and minus  and allows parentheses for grouping.

The AST for the above simple language might be written as:


```
Expr =   
| Expr op Expr
| "(" Expr ")"
| primary 

primary = digit+

op = "+" | "-"
```
(There is more than one way to write this grammar,  so YMMV.  Most  often you see grammars warped to fit the parsing tools' rules).

## ADT

![[parsetree-ast.png]]

## CDT

For input `1+2`, the parser might produce

![[parsetree-cdt.png]]

## De-Noised CDT
And, if we cut all the noise out of the tree, we might get

![[parsetree-de-noised-cdt.png]]

## The Simple Language  in Ohm-JS

![[Screen Shot 2022-04-19 at 9.22.01 PM.png]]
