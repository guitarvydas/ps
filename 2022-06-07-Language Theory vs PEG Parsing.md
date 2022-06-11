The gear-box effect of over-use of low-level synchronization is seen, in microcosm, in the Language Theory vs. PEG Parsing technologies.

They *look* the same, but lead to wildly different approaches to thinking about solutions.

Example: Let's say that you want to instrument a C program.  You want to find every block enclosed in braces `{ ... }` and insert a line of code (say, a printf())/

This sounds like a simple bulk-edit operation.

If you only have gear-boxes at your disposal, you have to write a Language specification that covers every millimeter of *all* C programs in the world.

If you have a parser-builder DSL, like PEG, then you can write a much simpler grammar that matches balanced brace-brackets and skips over "everything else".

Here's an example of a simple PEG-ish grammar (done in Ohm-JS, which is a better PEG, IMO):

```
balanced {
  main = matched main?
  matched =
    | "{" main "}" -- nested
    | anythingelse+ -- bottom
  anythingelse = ~"{" ~"}" any
}
```

The above grammar recognizes the first example, "Snake game", in https://ssiddique.info/20-c-game-projects-for-beginners-with-source-code.html.

The above grammar doesn't *do* anything with the matches, it simply captures them.  

Other PEG libraries should be able to do the same kind of thing.

LR(k), though, requires that a full grammar for C be written.  This turns what should be a simple batch-edit into a mega-project.

I wouldn't use the above Ohm-JS grammar for Production Engineering, but, I might use it to make my life easier during development.

To *do* something (like insert printf()s), you have to write a bit more code.  Not a lot of code, just a bit.

A full-blown Ohm-JS app to insert `printf ()`s after every `{` and before every `}` is shown below

[[Inserting Printfs]]