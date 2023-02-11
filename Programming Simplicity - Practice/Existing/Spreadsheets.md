Spreadsheets are grids of numbers and formulae.

Out-of-the-box use of spreadsheets is "simple".  There is no nuance.  What to do is "obvious".  The barrier to entry is low.  

There is only one main operation: click into a cell, change it, hit ENTER and watch all the other cells update.

A spreadsheet is instantly familiar - it looks like an accounting grid on a piece of paper.

There are no options to memorize, you can begin using the spreadsheet immediately.

As your use of a spreadsheet becomes more sophisticated, you can incrementally add nuance by learning new commands, one step at a time.

The available functions are shown on a drop-down menu, allowing users to peruse possible choices and to dig further into the reference documention as needed.  

Auto-completion is an incremental improvement over the simple drop-down menu.  Instead of  clicking on the drop-down widget, a user focuses on a field (usually using a mouse) and the auto-completion machinery creates a drop-down list automatically.  As the user types, the drop-down list is pruned and become shorter, displaying only the options that match with what the user has partially typed.  As such, auto-completion is but an marginal improvement over drop-down menus.  Auto-completion is not a game-changing improvement saving only a few keystrokes and/or lookup in a printed reference manual.  The game-changing idea is that users can type equations into cells, regardless of how they create the text of the equations.

Name of cells are instantly "obvious" - row-column notation is used.  Each row and column is visibly labelled with a number or a letter.  End-users refer to cells by using their row-column coordinates.

## How Spreadsheets Become Poor Programs With Poor Scalability

Spreadsheets are "flat" and 2D.  This makes spreadsheets instantly accessible and understandable to non-programmers.

This "flatness" is a tradeoff.  Sophisticated use of spreadsheets is hampered when the number of cells needed grows beyond some easy-to-comprehend number (see "Rule of 7").

The simple row-column naming of cells does not scale well when many cells are involved.

The typical solution for "going to the next level" is to allows multiple spreadsheets on separate - flat - tabs.

The typical solution for "going beyond the next level" is to employ a programming language which is geared towards expressing large programs.

The UX step between using a single spreadsheet and using multiple spreadsheet on multiple tabs is jarring to end-users.  Ostensibly, the tabs are meant to act like pages in printed books.  Suddenly, the simple row-column naming scheme for cells must be augmented with a page number.

The UX step between using single and multiple spreadsheets vs. using programming languages is even more jarring to end-users.  Programming languages have no relation to concepts taught in elementary school and require Univeristy training to use.  Spreadsheet-based projects either 
- continue using a morass of spreadsheets and a huge volume of cells, or,
- snap to employing programming languages and programmers.

In the first case, the project becomes a tangled mess of details.

In the second case, there seems to be no middle ground.  A project must switch to paying for programmers' time and to losing control of domain-specific knowledge about the problem(s) that is not possessed by programmers.

## Attempts at Narrowing the Chasm Between Spreadsheets and Programming Languages

Several attempts have been made to lessen the cognitive load for end-users needing to scale projects upwards:
- Visual Basic
- JavaScript
- Notebooks

These solutions all have tradeoffs and problems in joining non-programming and programming concepts.

## Fixes
- 0D
	- encourage building and testing of totally decoupled Components
