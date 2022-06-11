[[p-hamburgerworkbench]]
[[ch-iwantahamburger]]
[[ch-Simplified Parsing for an Ad-Hoc Application]]
# Step 2 Using Components to Re-Organize The Simple App
Imagine that we want to test the operation of the phrase parser code.

Ideally, we would wrap the *phrase parser* into a component and then add a few components to poke command messages at the *phrase parser* component.

If fact, we'd like to set up a test bench, which tests *exactly* one component - the *phrase parser* - and doesn't tangle up details of other components into the test.

To do this, we must ensure that the components are completely idependent of each other (*isolated* - something more than *encapsulated*).

I've done exactly this in setting up the *testbench*.  

There are many ways to do this.  You don't need to agree with how I did this, you only need to understand *what* I did (what my intentions were).  

I needed to write the program in a way that makes it easier for you to understand my intentions.

I chose to do this by wrapping a small number of pieces of software into independent Components.

The code for what I did is in the github directory listed below.

The code uses a library routine that I call `cos.js` to isolate the components.

## Github Code
https://github.com/guitarvydas/hamburgerworkbench0d

## Breakdown
I've chosen to break the testbench into five (5) components:
1. HTML button
2. Phrase Faker
3. Phrase Parser
4. Order Taker
5. Test Bench.

Components 1-3 are Leaf components.  They are implemented in Javascript.

Components 4 and 5 are Container components.  They are implemented as Javascipt tables (objects, arrays).

The UUT - unit under test - is component #3 The Phrase Parser.  It is wrapped in a Container "Order Taker" (#4).

"HTML Button" and "Phrase Faker" are components that were built for the test bench.  It is possible that "HTML Button" might be used in other apps, but "Phrase Faker" is fairly specific to this test bench, since it has hard-wired phrases in it, and, the phrases are very specific to this tester.

"Test Bench" wraps all of the components together to make the test bench.

For this example, the components were all implemented manually in JavaScript.  See below for non-manual transpilation - I show how to convert diagrams to JavaScript code automatically.  If it works for JavaScript, it can be made to work for just about any language (e.g. Python, C++, Haskell, etc.).

Each Component is described in two (2) parts:
1. Signature
2. Implementation.

The Signature contains
- The kind name of the Component prototype (like a class).
- The details of the Implementation plus a name.  Currently, the system matches up the names in (1) with Implementation names in (2).  It is probably possible to optimize this scheme, but for now, the correspondence remains visible and loose.

Container Components are extended to contain:
- a list of children
- routings between the children (and/or the Container itself).

[[Message Routing]]

## COS The Component Operating System

[[COS]]

COS is further discussed in another book.

# Step 3 Using Drawings To Re-Organize The Component-Based App

In this step, we edit the program as a diagram in `testbench.drawio` and then run `make`.

This process creates a `.js` file for every component on the diagram.

Then, we load the result into a browser and see that it runs the same as in Step 2.

We can change the diagram and run `make` again to see our changes in the browser.

## Github Code
https://github.com/guitarvydas/hamburgerworkbenchD0D

## How It Works
The bulk of the work in this example is done by 
```
make testbench.json
```
This process converts the diagram to a factbase (PROLOG in this case, but other languages could have been used, like JavaScript, Python, C++, etc.).

The converted `testbench.json` file is transpiled into `testbench.js`.

The transpiler inferences new information about `testbench.json` 

[[Main Steps For Transpiling Diagrams To Code]]
[[p-appendices-hw]]
[[ch-hamburgerworkbenchgithub]]
[[Hamburger Github]]
