A namespace is a JavaScript-like map of names to values. 

The values can be functions.  The values can be namespaces.  The values can be low-level data described by types.

A namespace can be a single map or a collection of maps. 

A collection of namespaces is a *stack*.

This is much like a Lisp alist, where each value in the alist is a namespace.

Namespaces can be constructed by *cons*ing namespaces onto stacks or popping them off of stacks (using the *cdr* operation).

All names within one namespace must be unique.  

The same name for an item can be used in nested namespaces (as long as the names are distinct within the same namespace).

Names *shadow* earlier versions of data with the same name.  The most-recent stacked namespace takes precedence over earlier namespaces.

References to names can be fully qualified to overcome shadowing.  

Qualification comes in the form of a name for the namespace, or an integer index, with 0 representing the first namespace, 1, representing the second namespace and so on (this is how De Bruijn indices are used).