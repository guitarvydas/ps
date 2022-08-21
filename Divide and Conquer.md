# The Point of Divide And Conquer

The point of divide and conquer is to take a problem and divide it up into two simpler problems.

The definition of *simple* comes in two parts 
1. The base case
	- the problem is so simple that it can be implemented using any technology that we have access to.
2. The recursive case
	- the  problem is not simple-enough, and, needs to be further subdivided. We keep subdividing until all parts of the problem fit the base case, and, are simple enough to be implemented using existing technology.

## How Divide And Conquer Can Fail
The base case fails if it is altered by the addition of code for other parts of the problem.

In other words, if there are dependencies of *any* kind - implicit or explicit - in the implementations, where making a change in one place inadvertently changes existing code - then divide and conquer fails.

See [[Dependencies]] for what kinds of dependencies might exist.

## When To Iterate 
We need to iterate when our understanding of the problem changes.

For example, we may discover new details about the problem, or, we may find unanswered questions about the problem.  When we get answers to the questions we may need to go back to the top and start again.

# Tools For Iteration
We need to use tools and languages that support iteration and wiping out what we had before replacing it with something new

When we use a systems programming language like Rust or C, we are reluctant to change existing code.

When we use a dynamic language like Lisp, we have less resistance to throwing away existing code and starting again.

# Types
Type systems work in two ways:
1. Type systems help us understand a problem 
2. Type systems constrain our Designs and make us reluctant to make changes in what we've already written.

In essence we want to use a typeless language and apply types only where types help our Design process.

Later, when we want to Production Engineer the code, we want very tight type checking to help remove errors in the code and to check the consistency of the code.

# Provenance
We want to Design in dynamic languages and Production Engineer (optimize) in static languages.

Ideally, we want to track the *provenance* of optimized code back to its original Design.

We want this tracking to be automatic.