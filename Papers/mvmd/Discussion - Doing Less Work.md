## Doing Less Work

We can do a lot less work in step 2 by punting most of the work to existing compilers.  Lispers know this by the name *macros* (programmable Lisp macros are different from C-like dumb macros).

How much less work?  It depends on how much time you want to put in buffing the script.  If you are only going to use the script once, then you will devote less time for working on the script.  If you are going to use the script many times, then you might devote more time for checking for common silly errors.  In the extreme, you might build a full-blown compiler and take months/years to buff it.  This wil also depend on what languages/libraries you can access and how much work they do for you (e.g. checking for silly errors).  I tend to think that one should build *many* mini-languages for each project, instead of using a single General Purpose Programming Language.  From this perspective, one should spend less than a few hours to buff scripts.

Script-buffing can be punted to a different department - e.g. Maintenance Engineering.

Divide-and-conquer implies that you make ir work, then worry about the low-level details.  Eschew premature optimization by not using a Production Engineering language during the Design process.