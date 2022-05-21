- ~/quicklisp/local-projects
	- duct
		- usage: make
		- goal: create very simple example of ė (lambdas with inner concurrency)
		- Makefile
		- builds 
			- `step.js` 
			- `routing.js` 
			- `handling.js` 
			- `find_connection.js` 
			- `find_connection_in__me.js`
		- DSLs
			- step.drakon -> step.js
			- routing.das -> routing.js
			- handling.das -> handling.js
		- DSL transpilers
			- dev.bash + dia.ohm + dia.fmt + support.js -> .das to .js
			- identity.bash + dia.ohm + identity-dia.fmt -> (out == in, check plumbing)
			- flowchart.bash + flowchart.ohm + flowchart.fmt + support.js -> .drakon to .js
		- prep
			- prep=~/tools/pre/pre
		- diagram (overview of target)
			- cat.drawio
		- diagrams manually transpiled to DSLs
			- step.drawio -> step.drakon
			- routing.drawio -> routing.das
			- handling.drawio -> handling.das
			- findconnection.drawio -> find_connection.das 
				- and inspiration for find_connection_in__me.js

		notes
			- I believe that it is important to understand how to transpile something manually before attempting to create a transpiler (compiler), hence, manual examples above
			- I drew diagrams (using draw.io) of my intended algorithms (deferring details) then hand-transpiled them into .das and .drakon text format, then used Ohm-JS to generate .js code for me
				- this allowed me to separate the algorithms from the details
				- this allowed me to not get tangled up with details during Design
				- because this is an example, 
					- I tried to be very explicit and drew diagrams of even simple algorithms (YMMV)
					- Ohm-JS made it easy to write little DSLs
					- divide and conquer - I relegated my thoughts using little DSLs, and worried about details later (in fact, I let Ohm-JS generate the detailed code for me, and only worried about the details when I was writing .ohm and .fmt files)
						- I didn't get it right the first time, I iterated the Design and the Details

	- hamburger
		- simple example of using Ohm-JS to parse simple phrases
		- probably the beginnings of a book on introductory Ohm-JS
		- done
	- hamburgerworkbench0d
		- same as hamburger example, but using 0D components (zero dependency)
		- done
	- hamburgerD0D
		- goal: 
			- transpile draw.io diagram to 0D components
			- duplicate hamburgerworkbench0d code from diagram(s)
		- wip
		- prep
			- prep=~/tools/pre/pre
		- d2f
			- d2f=~/tools/d2f/d2f
		- diagrams
			- testbench.drawio
				- diagrammatic signature of testbench component

---

- quicklisp/local-projects/das
	- on github
	- 
## Synopsis
Build/run helloworld as a drawing.

Build a build script from a drawing.


## More Detail

This current version transpiles `d2py.drawio` into `d2py.py`.

The generated build script is a Python program.

The diagram `d2py.drawio` contains snippets of Python drawn as 0D components (0D means "zero dependency").

Blue rectangles are 0D components.

Red rectangles are Python snippets.

Blue rectangles are asynchronous (a requirement of 0D) and red rectangles are synchronous blobs of code (i.e. "traditional" programming in just about any programming language (in this case Python)).

Transpile a drawing to JSON format.

### To Run the Generated Build Script

usage: ./topd2py.py

### To Build All Support Code:

usage: make

### Various Builds

- creates .py script to replace .bash script
	- result is `topd2py.py`
	- the script is used to transpile the `helloworld.drawio` diagram to Python code
- creates `helloworld.py` from `helloworld.drawio`
- creates all of the tools required for the transpiler
- Diagram To JSON Transpiler
	- `make helloworld.json` transpiles the diagram `helloworld.drawio` into JSON
	- `pyemit.py` is an example of how to transpiled the JSON to Python
		- `make helloworld.py`
	- `make d2py.json`
		- transpiles `d2py.drawio` to JSON 

## Internals

- `mpos.py` is the Message Passing Operating System.  
	- It uses 1st-class functions and queues and a Dispatcher.  
	- The Dispatcher runs the system of components.  
	- Components are 0D (zero dependency).  
	- It is encumbant on the Software Architect to arrange 0D components in a hierarchy (structured design).
	- Simple build scripts, like this one, though, don't need many layers (i.e. 1 layer is enough).
- `dispatcher.py` is the code for the Dispatcher.  (Note that I have, since, changed my mind and believe that 1st-class functions should, themselves, be concurrent.  See the `ė` working papers.  In essence, `dispatcher.py` and `mpos.py` become a part of functions that contain inner concurrency and do not need to appear as separated blobs of code, as is done here).
- `clean.py`, `tools.py`, `abort.py` and `build.py` are 0D components as defined on the diagram.  The diagram transpiler creates these `.py` files.
- There are 2 kinds of 0D components
	- `Container`
	- `Leaf`
- A `Leaf` is a snippet of code.
- A `Container` contains and wires-up other 0D components.
	- The contained components can be
		- `Leaf`
		- `Component`
		- (you can't tell from the outside (the signature), you need to look at the implementation to know if the component is a `Leaf` or a `Container`)
		- `Container` components route messages between their children
		- `Container` components route their own input messages to their children, as appropriate
		- (edge case) `Container` components route their own input messages to their own output ports.
		- `Container` components do no work other than routing.  
		- `Container` components are *busy* as long as any child has inputs.
		- `Container` components process a single input message to completion, i.e. `Container` components wait until all children have subsided before grabbing another message from their own input queue.

## Component Structure
### Signature
```
class _d2py (mpos.Container):

    def __init__ (self, dispatcher, parent, idInParent):
        super ().__init__ (dispatcher, parent, idInParent)
        self.inputs=['go']
        self.outputs=[]

...
```

### Implementation (Container)

#### Child

```
        child0 = abort._abort (dispatcher, self, 'abort')
```

Note that each child instance is cloned from a prototype and each child is *unique* within its parent Container.

There can be more than one child cloned from the same prototype in a Container, but each instance is unique.

To appease human-readability, we assign unique *names* to each child.  The compiler doesn't need this information.  The diagram doesn't need this information (it is "obvious" that the children are unique on a diagram.  The (x,y) positions of each child are enough to unique-ify each child).  The unique names are supplied *only* for human readers, and, probably only during a transition period.  I expect that unique names will be dropped when we become accustomed to the idea of using hybrid[^hybrid] diagrams as the only form of source code (without the need for intervening textual code.  This same kind of thing happened during the transition from assembler-programming to HLL-programming.  For a while, compilers output assembler text that could be examined by humans.  Today, few compilers bother with this intermediate step, and, generate executable code directly from the high-level language.  Few programmers care to examine the code generated by compilers.

[^hybrid]: Source code = Diagram + text.  (Note that text is a subset of SVG).

#### Connection (Routing Table Entry)
```
        conn0 = mpos.Connector ([mpos.Sender ('clean', 'baton')], [mpos.Receiver ('tools', 'go')])
```

Each connection consists of
1. Sender
2. Net name (not shown in this version)
3. List of Receivers

In this POC, component names are strings and ports (etags) are strings.  It is possible to optimize the code to resolve components and ports to actual data structures at compile time, but, this optimization is not done in this POC.

The *net name* is only important in bare-metal implementations.  It is used to group *nets* together and to allow locking of all components on a single net before delivering a message (message delivery must be *atomic* - the same message must arrive at all inputs without interleaving with other messages).

In this POC, we implement `mpos` using the synchronous language Python, and, the net names do not matter. Messages are delivered atomically by default.  The same would be true of any implementation using just about any programming language on just about any operating system (e.g. Linux, MacOS, Windows, etc., i.e. any O/S that implements the preemption epicycle).

### List of Children and List of Connections
```
        self.connections = [ conn0, conn1, conn2, conn3, conn4, conn5 ]
        self.children = {'abort':child0, 'tools':child1, 'build':child2, 'clean':child3}
```

---
- das2json
	- begin: same as das (which went all the way to Python)
	- stop at .json files
	- `make all` transpiles `helloworld.drawio` to `helloworld.json` using the generated Python script `topbuildscript.py`