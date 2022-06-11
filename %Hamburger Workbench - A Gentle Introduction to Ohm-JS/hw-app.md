We create a web app that accepts a silly phrase ("I Want A Hamburger") in a text box.

The app pattern-matches the phrase to check to see what is says.

If the phrase is correct, the app prints a simple message and quits.

If the phrase is incorrect, nothing happens ("FAIL" is displayed).

The point of this - very simple - example is to show how to use the Ohm-Editor to set up a pattern-to-be-matched.

The pattern-to-be-matched is called a *grammar*.

The Ohm-editor consists of 4 sections:
1. the grammar
2. test cases
3. the input string (from the current test case)
4. the parse tree if the pattern-match was successful, else, some helpful information
