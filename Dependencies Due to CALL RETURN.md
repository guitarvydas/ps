The hardware implementation of CALL/RETURN implicitly creates dependencies - a set of *bookmarks* (return addresses) using a *global variable* (the CPU stack).

Contrary to what is commonly believed, the use of CALL/RETURN inhibits code composition.
