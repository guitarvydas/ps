The secret sauce of composition is - *independence* (AKA concurrency[^parallelism] (I have begun to call it 0D (zero dependencies))).

The secret sauce of FBP is concurrency.

Once you have 0D, you can draw diagrams (if you wish), incl. node-and-arrow diagrams.

Trying to draw diagrams in a sync-based paradigm (i.e. just about every existing language) meets with resistance, and, eventually, hopelessness.

[^paralllelism]: Parallelism is often conflated with concurrency, but is only a subset of concurrency.  Rob Pike's talk ("Concurrency is not Parallelism") gave me the words for dividing-and-conquering these concepts ...

FP achieves independence by restricting what can be done - 1:1, 1 in, 1 out (always).  And, by using only 1 type - the callable function. 

FP deconstructs that 1 type into user-defined sub-types, though (from my nuts-and-bolts perspective) and gives the impression that many types exist.  The datums are always callable functions, though.