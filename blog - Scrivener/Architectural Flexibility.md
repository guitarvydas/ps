Title: Architectural Flexibility  
Author:

In this essay, I address the issue of architectural flexibility.


Architectural flexibility is the idea that a complete software system can be modified on short notice.

We can change the way a software system works by simply "rewiring" it.

Furthermore, flexibility allows us to cut/copy/paste elements of a software system to create a new software system.  Software libraries and APIs are meant for this kind of purpose.  Using the concurrent paradigm makes such reuse and multiple use easier to accomplish.

What are the goals of flexibility?

* Create software components
* Plug software components together like LEGO® blocks
* Rewire a software system to easily create different behaviours
* "Borrow" bits of architecture when creating new software systems

To achieve flexibility, we require:

* dependencies - components have no dependencies (or very few and very explicit)
* isolation - components are isolated from one another, in memory, control flow, namespaces, etc.

Present technologies encourage the use of dependencies.  Tools, such as make, npm, etc. are provided to manage dependencies.  The goal of zero-dependencies means that make, npm, etc. must not be used during construction of a software system.

OO provides encapsulation of data, but does not provide encapsulation of control flow.  In fact, OO creates spaghetti control flow paths by allowing method overriding.

Operating system processes provide encapsulation of control flow and namespace isolation.

Present languages allow naming of targets.  For example, to call a function, one must specify the name of the called function.

DLLs - dynamic link libraries, place a layer of indirection between callers and callees.

Calling a function usually involves pushing a breadcrumb onto a stack. Often, the breadcrumb is hidden from programmers' view. This creates  dynamic dependency chains which are often expressed as backtraces when problems occur.

Present-day function syntax requires syntactic sugaring to express data delivered as parameters, a different syntactic sugaring for data delivered as return values and yet another syntactic sugaring for data delivered as exceptions. 

- fractal
- recursive


Add an output queue