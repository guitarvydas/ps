This is a brief example of the use of the B R E X Brex tool. 

A BREX rewrite specification consists of two strings.

Each string can contain four kinds of things
1. spaces
2. literal characters
3. a match variable bracketed by Floor bars
4. a match variable bracketed by double angle brackets.

I've created a small pattern and rewrite for C programs.

Both, BREX and its brother BRED use the same syntax for specifications.  BREX only outputs what has been rewritten, while BRED performs the rewrites and leaves everything else alone, outputting the rewrites and the text which was not touched.

The Floor brackets surround a variable name.  The pattern matcher matches anything that isn't a space and that isn't bracketed and saves it in the given variable name.

The double angle-brackets also surround a variable name.  The pattern matcher matches spaces and bracketed items and saves all of that in the given variable name.

The first string specifies the pattern to be matched, and the second string specifies how that matched text will be rewritten.

In this case, I've specified to match a floor item and give it the name *name*, followed by zero or more spaces, followed by a bracketed item called *params* followed by some more space followed by a bracketed item called *block*.

The *params* item must be enclosed in matching parentheses, while the *block* item must be enclosed in matching brace brackets.

The second string says to discard everything except the *name* parameter and to stick a newline after it.

I run the BREX tool on a sample C file - the file grep.c. BREX prints out a list of all of the function names found in that C file.

We see that the BREX tool deleted all of the text that did not match and output only the specified rewrites.  If I had used the BRED tool instead, the output would be different and would contain most of the source code from grep.c, with only the matching bits rewritten.


---
I've created a small pattern. And rewrite for C program. I'm going to use the. 

The first string specifies the pattern to be matched. The, uh, 

The first item. 

His name, a name is a M. 

The first item. 

Surrounded in the. 

Floor bars. 

Means that it'll match anything except spaces and bracketed things. 

The next two things. R. Match bracketed things. I'm going to call one of them prams and the other one block. And then I'm going to. I'm looking for an open parenthesis in a close print. This is around the first one. Open brace and a close brace around the second one. And. Spaces. Uh, in between the. 

Uh, once that pattern has been found. I'm going to take the name that if that I found. Rewrite the whole pattern with only the name that I found throwing away the parameters and the block. Part, and then I'm going to add a new line. 

I run. 

And get the result.  

