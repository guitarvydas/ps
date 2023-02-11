# LEGO®

LEGO® is a plastic block used as childrens' toys.

All LEGO® blocks are the same[lego] and are completely deboupled from one another.

[^lego]: This isn't strictly true any more. Today, the LEGO company produces blocks with many different shapes and APIs.  The fundmental building block - the classic LEGO® block - remains the same, though.

Children can build up large, complicated physical structures using LEGO® blocks.

What are the defining characteristics of LEGO® blocks? Why do children find the blocks easy to use?
- sameness
- simple API
- independence.

Each basic block is the same.  Once  child figures out how it works, there are no further complications to understand.

Simple API.  The interface to LEGO® blocks is simple and consistent.  One side of each block contains pegs, the other side contains holes that accept the pegs.  The pegs and holes are all the same.  Block can be snapped together in any orientation, once the basic principle of keeping pegs on top and holes on bottom, has been learned.

In contrast, modern programming languages create functions that are not all the same.  Each function interface is slightly different, unlike LEGO® blocks.

In contrast, modern programming languages create functions that depend on one another and - due to the callstack - are not independent.

> [!question] Lambda calculus is slowly rediscovering some of the principles already known to children.  
> 
> Like LEGO® blocks, Lambda Calculus functions are useless on their own, and must be composed with many other functions before significant structure becomes visible.
> 
> Lambda Calculus functions appear to have simple APIs - one parameter with only one type (a callable function).  Yet, functions break one of the most basic principles of LEGO® blocks.  Functions are not independent, due to the use of a shared variable that ties them all together - the hardware-assisted callstack.