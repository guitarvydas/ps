Basics, fundamental to the rest of this discussion is here: [[Programming is Setting Switches]]

1.  `lack of syntax (due to mid-1950s fear of parsing)`

Parsing is "pattern matching".

For example, REGEX is a form of "pattern matching", but is more restricted than "parsing".  

REGEX was first developed for compiler techonology, then was jail-breaked out and used for other kinds of work.  Now, REGEX is included in various programming languages like JavaScript and Python, and is used for all kinds of things, not just for building compilers.

Parsing, esp. PEG (esp. Ohm-JS) was developed for compiler technology.  

I favour the idea of jail-breaking *parsing* technology and using it for other kinds of work.

Applying *divide and conquer* to the act of programming results in 2 steps (utterly obvious to most programmers):
1. grok (understand the input)
2. re-format (take the understood pieces and spit them out in a different order, for fun and profit).

"Parsing" is just a bag of tricks for doing (1).

Re-formatting (2), can be fairly basic, like using printf ().

I get bored with the repetitiveness of *printf* and use helpers like Bash scripts, JavaScript template strings, etc.

Some people invent DSLs for (2), like IBM's RPG, but, it's all really the same at the most basic level - format the output.

Some people attach big words to the act of doing (1), like "input validation", but, it's all really the same at the most basic level - read in the current state-of-the-world (or some restricted state-of-the-world, like a text file) and use whatever tricks you know to understand what's there.  Collect up the bits that you understand and pass them on to (2).

Example: using a computer for cashflow what-ifs.
1. Read keystrokes from the keyboard and give them meaning, like "arrow keys" vs. letters and numbers.  Breathe in .CSV files and pattern-match them for fields of info.
2. Present (re-format) the data in what looks like a 2D grid.  A 2D grid looks familiar to accountants and CEOs and lets them think in terms of cashflows instead of bits and switches.
3. Repeat.

Example: using a computer for gaming.
1. Read electrical inputs from the gaming controller and give them meaning, like joystick vs. button pushes.  Use a data structure to represent the saved-state of the game.  Read the state in and grok it before resuming the game.
2. Present (re-format) the game state on a 2D electrical screen.
3. Repeat.

4.  Can you elaborate?
5.  I know we've gotten a lot better at writing parsers, but was it really worth it?What do we _really_ get out of more complicated syntax?

Use a different word than "parse".  "Parse" has religious connotations.  When people hear the word "parse" they think of compilers instead of what else parsing can be used for.

I suggest using the phrase "pattern matching" instead of "parsing".

The phrase "pattern matching" is re-gaining popularity with the FP crowd.  If you want to learn what FP can teach you, jump to Ohm-Editor and play with pattern matching.  Don't stop at GO.  Don't bother to read the Dragon Book.

At one point, early on, building compilers was considered to be a difficult program.  By digging in to specific code (e.g. for building compilers), we developed more-general techniques.  Unfortunately, the general techniques have become related *only* to the specific code that they were originally devised for (compilers) instead of being recognized as being generally useful.



1.  Can you elaborate on `The premature-optimization clique expunged FEXPRs with a vengeance.` ? Specifically, what was being optimized away and how this limited exploration in newer languages?

[[2022-06-08-Compilation vs FEXPRs]]

1.  I'm a little disappoint Greenspun doesn't have a first 9 rules
	
	Left as an exercise to the readers?  
	
	If you know Lisp (Lisp, not Scheme, Clojure, etc), then the first rules are "so obvious" as to not bear writing down.
	
1.  Bret Victors `don't use characters / do use REPLs` : aren't REPLs still just characters? In my mind the difference between a REPL and a script / compiled program isn't the presentation of the characters but rather the interactivity

One guy showed how to input non-character data.

But, everyone thought it was magic and genuflected instead of thinking "Hey, I'll try that, the hardware is expensive right now, but will be cheap after the turn of the century".

Apple made zillions by only implementing part of that vision...  (Actually, Apple made zillions by licensing postscript for their printers, but that's another rabbit hole)

REPL means "live", "interactive".  REPL is not relegated to only be used with textual programs.

4.  `It was/is believed that there must be "one language to rule them all", and, Lisp and Smalltalk tried to cover all of the bases` <- does this matter as much if we just treat them as assembly?
5.  I don't think I understand `the brain-damage that pervasive synchrony has caused` ?
