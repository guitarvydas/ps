Title: Anecdote - Secretary vs. Synchrony  
Author: Paul Tarvydas

# Anecdote - Secretary vs. Backup Instructions #

In the early 1980's…

We had a VAX-11/750 (IIRC) with multiple dumb terminals (24x80) hung off of it.

I noticed that most programmers did not logout before going home at the end of the day.

I noticed that our secretary used to arrive to work before all of the programmers arrived.

I asked the secretary to perform  backups every morning before the other programmers arrived.

I wrote out instructions in the form:

1. If you see "> ", type LOGOUT <return>
2. If you see "LOGIN:", type BACKUP <return>
3. When you see "PASSWORD:", type <…>
4. When you see ">" type BACKUP


About a week later, I came in early, after the secretary had arrived, but before all of the other programmers had arrived.

I saw 
"
LOGOUT
LOGIN:
>
LOGOUT
LOGIN:
>
…
"
on every terminal.

I asked the secretary what happened.  I got 2 answers:

1. Backups never succeeded.
2. The secretary never typed the word BACKUP and was always typing LOGOUT.

# Conclusion #

I had assumed that my instructions were sequential.

The secretary started reading the instructions from the top after every operation.

The single sheet of instructions was a parallel set of instructions in the secretary's mind, but serial in my mind.

