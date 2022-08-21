# Dependencies
Dependencies come in two kinds:
1. Explicit dependencies
2. Implicit dependencies

The simple function call, `f(x)`, creates both kinds of dependencies.

# Explicit Dependencies

The explicit dependency is that of referring, by name, to the function `f`.

DLLs (Dynamic Shared Libraries, .so, .dynlib, etc.) attempt to solve this kind of dependency using indirection that is fixed up a load time.  DLLs address this problem in only one direction (*call*)

# Implicit Dependencies
## Blocking

The written function invocation `f(x)`, expects the caller to *block* until the function `f` returns a value.  

In mathematics this does not matter since it is expected that function calls take zero time.

In computers, though, function calls take non-zero-time and use the call stack as a bookmarking data structure.

In both cases the function indvoation causes a dependency.  

In mathematics it doesn't matter, whereas, with computers it does matter.

Using a computer, a function call takes some time and we cannot calculate the final amount of time needed for any function call.

This means, that on a computer, the caller is dependent on the callee.

This is a hidden dependency.

If we change code in a library function we also change the code in the caller because the caller is dependent on the library function.

## Return Bookmarks
stack used as a dynamic data structure to record bookmarks

# Scalability

Operating systems isolate components using large-grained processes.

Code inside processes may contain dependencies, hence, cannot be broken apart and scaled.

Operating systems need to use *preemption* to regain control of blocking.


# 0D - Zero Dependencies
more than encapsulation
## How To Reason About 0D 
Don't use technologies that cover up the problem and make it easy to deal with dependencies, e.g.
- make (don't use make)
- package managers (don't use package managers, packages, etc.)
- don't use preemption
## 0D Using Python
Don't use function calls (across components).

Break call dependencies by using deferred Send ().

Queues - input and output.

Components cannot refer to other components, they can only send messages.  Messages are routed by Parent Containers, not by the components themselves.

2 types of components:
1. Leaf
2. Container (Router)

Processes.

Make everything explicit, including stacks.  Recursion becomes feedback loops that modify stacks (this is implicitly done with FP languages now).

