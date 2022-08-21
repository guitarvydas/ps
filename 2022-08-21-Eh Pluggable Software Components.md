# ė - Goal and Overview

The goal of this project is to program computers using pluggable units of software.

To do this we need:
- micro-concurrency
- 0D
- layers, relative sofware units
- multiple languages.

## Hello World 
Very simple example
## Leaf
![[hello world eh-Leaf.png]]

## Container
![[hello world eh-helloworld.png|400]] 

## Re-Architecting
![[hello world eh-helloworldworld.png|400]]
## Scalability
Pluggability is necessary for scalability, but, more elaborate (complicated) examples would be needed.

# Benefits
- anti-bloatware
- technical drawings come "for free"
- concurrency comes "for free"
- "build and forget" development
- distributed programming comes "for free"
- multiple-CPU paradigm
- ability to plug together software components to create mimimal set of functionality

further discussion...[[Eh - Benefits]]

# Key Insights
- 0D - No Dependencies 
- FIFOs and LIFOs
- Pipelines
- Structured Message Passing
- "First Principles Thinking"
- Closures

## FIFOs vs LIFOs
- LIFOs are implemented in most modern programming languages (i.e. function call and call-stack)
- LIFOs make implementing Operating Systems and pluggable components more difficult than necessary
- both LIFOs and FIFOs are useful, but only LIFOs are inherently supported by modern programming languages 
	- e.g. function calling employs a LIFO, and does not employ a FIFO
	- FIFOs *can* be modeled as classes, but that is not the same as being inherently supported by the notation / programming language
## Pipelines
Pipelines are useful for plumbing software units together, but, functions calling functions do not implement pipelines (due to the LIFO issue).
## Structured Message Passing
[[structured message passing.png]]
## First Principles Thinking
[[WIP/First Principles Thinking]]
## Various Random Issues
My notes about Operating Systems, in screencast form: [https://beta-share.descript.com/view/gdfwt4MfKjF](https://beta-share.descript.com/view/gdfwt4MfKjF)
- divide-and-conquer - developers vs. end-users  
- divide-and-conquer - 2 main technical aspects of operating systems  
- bloatware  
- processes  

## Divide and Conquer
- divide and conquer is understood by most programmers
- but, most programmers do not employ *enough* divide-and-conquer
	- e.g. what is commonly call "parallelism" can be broken into 2 categories
		1. 0D
		2. Simultaneity
## Closures
- Operating Systems are Greenspun's 10th Rule applied to Closures

## Further Discussion
[[Eh - Key Insights]]

# How Is This Different From What We Already Have?
State-of-the-art operating systems, like Linux, Windows, MacOS, have two (2) main functions:
1. control multitasking and blocking
2. provide a rich set of device drivers.

Wrapper operating systems cannot control blocking when the progamming units perform ad-hoc, unstructured blocking on their own.  "Functions" *block* when calling other functions.  State-of-the-art O/Ss  need to resort to brute-force methods to pry blocking away from programming units, e.g. preemption.

This project does not *directly* address the issue of providing a rich set of device drivers (2), since, each device driver represents "hard work" - specific knowledge about the internal workings of each device, where each device might have wildly different operations.  Programming such devices is made harder by the over-use of synchronization, etc., outlined in this proposal.  As such, writing device drivers in a stand-alone style should be "easier".  Incorporating already-existing device drivers is discussed below.
# Current State
- Leaf components using HSMs
## Github
# Future
- Containers
- Examples
- DaS
	- draw.io, SVG
- using existing O/Ss
- using existing Software
- emerging technologies
	- Robotics 
	- Games - NGPs, Actors
- anti-bloatware using Lambda wrappers
	- Lambdas, λs, are stack-oriented (LIFO), trying to use λs for non-stack-oriented programs causes bloat
	- functions that call other functions perform ad-hoc blocking, which O/Ss must fight to maintain control of blocking (e.g. using preemption)
# Discussion
[[micro-concurrency]]
[[0D]]
[[2022-07-11-0D]]
[[2022-08-21-Layers]]


# References
[Harel StateCharts](https://guitarvydas.github.io/2020/12/09/StateCharts.html)
[call/reurn spaghetti](https://guitarvydas.github.io/2020/12/09/CALL-RETURN-Spaghetti.html)
name
	- no Greek
	- no ASCII
Dependency essay
Functions vs. dependencies article
[Movable Feast Machine](https://guitarvydas.github.io/2020/12/09/CALL-RETURN-Spaghetti.html) not related, but, indication of "steam engine time" - similar issues being addressed differently
[[2022-07-10-Layered Programming - New-Breed Structured Programming]]
[[2022-05-30-Fire and Forget]]
[[2022-06-04-Fire and Forget]]

## Notes to Self
[[2022-08-21-Notes on Eh]]