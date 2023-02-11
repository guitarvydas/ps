Title: Bash vs Concurrency  
Author:

[I write this essay after battling with bash for almost 2 weeks, to build a "simple" Scrivener to Jekyll transformer.

I contend that bash's (macosx's) take on multitasking made my simple project much more difficult than it needed to be].


I contend that bash does not support concurrency.


The version of multitasking that is currently in vogue is not concurrency.

Multitasking conflates numerous issues, for example

* time-sharing
* memory-sharing
* parallel processing
* concurrency.

Concurrency is concurrency, not all that other stuff.



Rendezvous is a technique that makes concurrent processes act in a sequential manner.

Rendezvous can be implemented in the concurrent domain,[^fn1] but one does not need rendezvous to have concurrency.


The following script hangs:

#!/bin/bash
rm -f pipe_*

pipe1=pipe_$RANDOM
pipe2=pipe_$RANDOM
mkfifo ${pipe1}
mkfifo ${pipe2}

./z.bash 3<${pipe1} 4<${pipe2}
echo "arrived here"

echo 1 >${pipe1}
echo 2 >${pipe2}

 What could be simpler?  It create two named pipes, runs another script (z.bash) and pours characters into the pipes.

The following script hangs, also.

#!/bin/bash
rm -f pipe_*

pipe1=pipe_$RANDOM
pipe2=pipe_$RANDOM
mkfifo ${pipe1}
mkfifo ${pipe2}

./z.bash 3<${pipe1} 4<${pipe2}
echo "arrived here"

echo 1 >${pipe1} &
echo 2 >${pipe2} &


The following script does not hang.

#!/bin/bash
rm -f pipe_*

pipe1=pipe_$RANDOM
pipe2=pipe_$RANDOM
mkfifo ${pipe1}
mkfifo ${pipe2}

./z.bash 3<${pipe1} 4<${pipe2} &
echo "arrived here"

echo 1 >${pipe1}
echo 2 >${pipe2}


The script, z.bash takes input from two pipes, pipe1 and pipe2.

Bash, on MacOSX (Catalina), does not let z.bash run until both pipes are "instantiated" by having 2 ends.

If we use the first script, z.bash runs and blocks until its pipes are instantiated.  This means that the first script blocks on the call to z.bash and never succeeds in running the echo lines.  Both echoes are needed before z.bash can be instantiated.

The second script suffers the same fate, even though we've spawned the echos as separate processes.

The third script doesn't hang, because z.bash is spawned - asynchronously - and the script is allowed to continue.  In fact, z.bash does hang until its pipes have been instantiated, but that happens in another process which doesn't affect the operation of the third script.

If this sounds confusing, it's because it is confusing.

The semantics of bash fit someone elses' problem, just not this above - very simple - problem.  [Actually, I haven't dug too deeply into this problem - I'm blaming bash, but maybe I should blame UNIX, or just the combination of bash + MacOSX, or … TC;DB (too complicated, didn't bother)].

AFAICT, something is causing z.bash to wait until both ends of all of its pipes had been instantiated.  This smacks of rendezvous semantics.



[^fn1]: Network people do this "all the time".  They use ACK/NAK protocols when they want to synchronize.  Hardware designers knew how to do this in the 1980's, if not earlier.