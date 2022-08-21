---
tags:
- pm
---
[[pm what is pattern-matching - parsing?]]
[[pm Ohm-JS Introduction]]

Software development tools have evolved following a single path.  Most pattern matching tools match patterns in text only.  This is due to historical reasons - in the mid-1900s hardware supported characters as bytes more easily than graphics.  In general, pattern-matching can be applied to many kinds of data, but our current crop of tools restrict most code libraries to matching only text-based data.

It is possible to convert non-textual representations to text, and then, to use existing textual pattern matching libraries to find patterns in the representations.

For example, backtracking, exhaustive search and Relational programming techniques (e.g. PROLOG, and its descendants) can be used to scrape information from 2D representations, like `.drawio` files, and, to infer relationships contained therein.

