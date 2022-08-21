# The Problem
I have written a book in Obsidian, and want to publish it using Leanpub.

File links for Leanpub are different than for Obsidian.

- `[[abc]]` must be converted to `[manuscript/abc.md]`
- `[[def.png]]` must be converted to `![manuscript/resources/def.png]`

Files must be copied from Obsidian directories to Leanpub directories and the links need to be converted.

## Other Constraints
This could easily be done using shell scripts or Python scripts.

I choose to "eat my own dogfood" by drawing DaS diagrams and converting them to Python code.  I would like to perform the conversion automatically ("compiled"), but, will settle for manual compilation, too.

> [!INFO] I have written JS code that converts .drawio diagrams to .json.  So, I know that it is possible to do machine-based transpilation, but, snapping the various pieces together into a whole is still cumbersome (esp. using sync-text-based languages)

## Directories
The input files (Obsidian) are in one directory, the output files (Leanpub) are in another directory.

## Input File
```
---
tags:
- pm
---
[[pm introduction]]
[[SCN]]
[[scn2]]
# Parsing Basics 
    [[Parsing Basics]]
    [[Control Flow in Parsing]]
    [[Parser Overview]]
    [[Parse Tree]]
    [[Parse Tree With Holes]]
    [[Parsers Are Tree Builders]]
    [[Parsers Help With Tree-Walking]]
    [[Parsing - Creating Semantics Dynamically]]
    [[Bare Parse Tree]]
    [[One Parse Tree Approach]]
    [[Pipeline of Many Parse Trees Approach]]
    [[regex]]

# Getting Started
[[pm Getting started]]
[[pm Small steps]]
[[pm Hamburger Workbench]]
# Idioms
[[pm Idioms]]
# Advanced Idioms
## Syntax Stacks
[[pm Syntax Stacks]]
## Verbatim
[[pm Verbatim Code]]
## Symbols Containing Whitespace
[[pm compound identifiers]]
# Examples
[[pm math]]
[[pm Parsing C]]
[[pm Transpiling Scheme to JavaScript]]
# Macros
[[pm Macros]]
[[pm Prep]]
# Components
[[2022-06-17-Ohm As A Component]]
- [ ] PROLOG for backtracking
- [ ] Ohm has backtracking, too - is that good enough?
- [ ] miniKanren maybe for exhaustive search
# Other Features
[[pm Other Features of Ohm-JS]]
# Exercises
[[pm Exercises]]
# Appendix - Using Ohm-JS
[[pm using Ohm]]
[[pm Ohm Editor Brief Introduction]]
# Appendix - What Is So Good About Ohm-JS?
[[Why You Need To Learn Ohm-JS]]
[[whyohm]]
# Appendix - Other Parsing Technologies
[[pm Appendix Other Technologies]]
# Appendix - Various Issues Related to Pattern Matching
[[pm Interpreting vs. Compiling]]
- [ ] syntax-driven programming, sequencing
- [ ] diagram parsing

# Appendix - Ohm-JS
[ohmjs.org](https://ohmjs.org()
# Appendix - Language Theory vs. PEG
[[Language Theory vs PEG]]

```