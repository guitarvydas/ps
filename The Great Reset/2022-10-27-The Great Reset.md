Text languages are based on 1950s biases - 1 CPU, very little memory.  

Text languages have been conquered, and I believe that Ohm-JS is the epitome of how to build them, including little embedded DSLs that take only minutes to design and implement. 

The Great Reset: in 2022, we have multiple PUs and cheap memory.  

It's time to re-think how to achieve The Goal of Programming.  

We, now, have hardware capable of displaying resizable, overlapping rectangles and need not be constrained to using text-only languages that were invented for use on clay tablets.

Parsing resizable, overlapping rectangles has not been conquered but is obtainable. I have built multiple POCs. 

Thinking in terms of programming languages that use resizable, overlapping rectangles as part of their *syntax* opens a plethora of doors.  Programming theorists have boxed themselves into a corner by thinking that diagrams are "models" instead of "syntax", and, by attacking harder problems - like finger swipes - instead of going for the low-hanging fruit of parsing SVG using existing technologies.

It should be drop-dead easy to parse SVG elements - instead-of/in-addition-to characters - using Ohm-JS.  In fact, my *d2f* tool does exactly that.  D2f parses XML - ??.graphml created by the draw.io editor - and converts the XML to textual pseudo-code which can be eaten by existing parsing technologies, such as Ohm-JS (surprise!).  

I don't parse ALL of XML, but, just a subset.  This is what textual programming languages do.  They parse a very restricted subset of written prose and transpile it to assembler opcodes. It is possible, using 2022 technologies, to transpile a restricted set of SVG elements to assembler opcodes.

What does a rectangle on a diagram compile to?  A concurrent component.

What does an arrow on a diagram compile to?  A message.

