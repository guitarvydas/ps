
## Github Code

The above discussion shows screenshots of the Ohm-Editor in action.  The code below shows how to wire all of this stuff up into a working web app that can be loaded into a browser.  There are many ways to do this and what I show is, but, one way to do this.  When you learn more about Ohm-JS, you will be able to choose different ways of building apps with Ohm-JS.

The idea of this code is to hard-wire the grammar into an HTML text area, and, to hard-wire the rewrite rules into a Javascript `<script ... >`.

The code builds an HTML web page and presents the user with a button.

When the user clicks the button, the Javascript is fired up to run the Ohm-JS pattern-matcher, and, if successful, to run the re-write phase.

The result of all of this activitiy is a text string.

The resulting text string is dumped into another textarea and displayed.  The resulting text string is dumped into a browser field named 'output'.

If anything goes wrong, we simply dump the string 'FAILED' into the output field.  Again, when you learn more about Ohm-JS, you will be able to write more informative error messages.  For now, we want to reduce the number of details, so a dumb, uninformative error message is used.

This is a manifestation of the *shuhari* principles:
1. just get something to work
2. learn how it works by examining the code
3. let your imagination soar and make sweeping changes to the code, or write completely new code, based on what else you already know.

