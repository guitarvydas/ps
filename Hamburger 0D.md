WIP.

I tried to create the simplest example I could imagine, for demonstrating how to use Ohm-JS.

Then, I evolved the example.

Currently there are 4 steps:
1. totally ad-hoc, manual
2. ad-hoc, manual code, using 0D[^zerod] components
3. Start with a diagram, transpile it to HTML and see the results in a browser
4. wip: Create another diagram (a simple file-copy example) and convert it to command-line code.
5. future: hmm, maybe make (3) poop out a Dockerized solution.  Docker requires a huge learning-curve for me, but, maybe someone who is already familiar with Docker could do this in a few hours? ...

[^zerod]: 0D means "zero dependencies"  In my (current) view, this is a way to achieve full isolation by addressing two fronts (1) data isolation, and, (2) control flow isolation.

Through the magic of divide-and-conquer, (4) has become a sub-project that develops OPLs (Orthogonal Programming Languages) - a set of layers that transpile the example from a diagram into smaller and smaller sub-languages until culminating in "pseudo code" that can be transpiled, using Ohm-JS, into most popular programming languages.  ATM, I'm doing the easiest thing I can imagine - simply writing the transpiled code out by hand to show what happens under-the-hood.  Building a "compiler" that transpiles diagrams to text code is just a bag of details (blogged about elsewhere) and I want to avoid details to get at the meat of the solution.  ATM, I *think* that the best way to do this is to show the steps in a very manual way.  Later, I will try to describe (again) how to automate the steps (e.g. how to use Ohm-JS, and, how to transmogrify draw.io diagrams into something that Ohm-JS can grok).  If I feel particularly industrious, I will simple do this and produce a downloadable lump of code[^contribute].

[^contribute]: Contributors welcome.  If someone (regardless of experience) wants to try to write this code, I would be glad to help/advise.

github:
https://github.com/guitarvydas/hamburger
https://github.com/guitarvydas/hamburgerworkbench0d
https://github.com/guitarvydas/hamburgerworkbenchD0D
wip: checkout branch dev: https://github.com/guitarvydas/hamburgerworkbenchT0D.git

appendix:
code (messy? brainstorming?) for converting a draw.io diagram into JSON:
https://github.com/guitarvydas/das2json

appendix:
code (messy? brainstorming?) for converting a "Hello World" diagram to Python:
https://github.com/guitarvydas/das
also, converts a diagram of a script to Python

appendix:
PREP, code for the work-horse behind all of the above, boils down to one command-line program...
https://github.com/guitarvydas/prep