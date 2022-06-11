A very simple example ...
![[hamburger1.png]]

The test marked (on the right) "green" was parsed successfully, and the "red" tests fail.

"I Want A Hamburger" passes the parse successfully.

"I want a hamburger" fails the parse, because the grammar specifies capital letters[^prod] for "Want" and "A" and "Hamburger".

[^prod]: For production, we want something more forgiving, but, for this example, I want to keep things simple and defer details such as capitalization.

"I Want A Cheeseburger" fails because the word "Cheeseburger" is not specified by this grammar[^next].

[^next]:  See the next example, if you like Cheeseburgers.
