# ApplySyntactic Show Phrase Grammar

![[ohm editor ShowPhrase.png]]
The top *src* rule examines each input character one at a time.  If a character looks like the beginning of a macro, then the succeeding characters are matched against the macro spec.  If the character doesn't look like the beginning of a macro, or, if the macro match fails, the *text* rule simply accepts the character "as is" without space-skipping.  

In this example, the 2nd leg, called *ignore*, is the "as is" catch-all.  The name *ignore* has no special meaning to the parse engine.  The name is used later in the fabricator engine (not shown here).
