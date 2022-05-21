(document) -> (PIC) -> [TBL/EQN|(optional)] -> [TROFF] -> (typesetter) [TBL]:line=dotted

graphics:
[] ≣ box (transpiler gets to assign (x,y) coordinate)
. ≣ no graphic (transpiler gets to assign (x,y) coordinate)
-> ≣ arrow joining two graphic elements (lhs graphic connected to rhs graphic)
(...) ≣  text

graphic attributes:
:line=dotted ≣ graphic attribute (*of what exactly*?)
| ≣ *I don't understand this yet*

misc:
- does `[TBL]:line=dotted` mean "assign line=dotted attribute to any box that contains text that begins with text TBL..."?
- I like the idea of separating attributes from the elements, details kill, elide/defer details...
- transpiler "assignment" of (x,y) is "smart", it caculates the size of the graphic elements, then attaches (x,y,w,h) to each element, then creates arrows that start at the appropriate (x,y) and terminate at the appropriate (x1,y1), further thinking: are the arrows polylines, are they beziers or sharp? (I guess that the have attributes, and by default are something-something-something)