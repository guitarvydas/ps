This is an example of converting a game script into JSON.

This example uses a grammar and the FAB tool.

The point of this note is that you can use micro-DSLs to storyboard and build parts of a final game or program.

You can use tools to help you build up pieces of a game.

For example, you already use a powerful programming editor to create parts of your game / program.

You can use micro-DSLs  to focus on parts of your game / program to create a storyboard. I call micro-DSLs "SCN"s for Solution Centric Notations.

Then, you can use tools, like this one, to convert the storyboard into actual code which can be copy / pasted into your game / program.

There are many tools that you can use.  You should use the simplest tool that you can get away with.  For example, you might want to try using the BRED tool before trying the workflow used in this note.  Or, maybe you can get away with just writing a Python program with RegExs to generate code for your program.

A goal to keep in mind is to automate the workflow so that all high level storyboarding is done at the SCN level and to avoid potzing with the generated code.  I don't discuss how to do that, here in this note, but this is a goal you should keep in mind. The way to stay out of trouble is to use the DRY principle - Don't Repeat Yourself.  Make changes in only one place.  The reason that code comments don't really work is that they don't adhere to the DRY principle - you can change the code and you can change the comments.  Eventually, one of them gets out of synch and the result is confusion and bugs.






SCN
Solution Centric Notation