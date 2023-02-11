# Assembler

Assembler is a language that elides details of electronic circuit design.

Complex circuitry is reduced to a small set of functions, called *opcodes*.

The circuity is encapsulated in plastic "chips".  Electronic signals are broken out on metal "pins" that stick out of the plastic casing.

As improvements in miniaturization were developed, the chips contained more and more functionality, and, more pins.  

The complexity of internal circuitry inside chips increased more rapidly than the number of breakout pins. 

Pins are arranged to allow easy, humand and machine insertion of chips onto circuit boards.

Circuit complexity is often expressed as the number of "transistors" used.  A transistor is a small analog device that acts like a switch.  Transistors are composed of layers of chemicals called *oxides*.  Advances in miniaturization have made it possible to shrink transistors down to microscopic levels.  Today, it is common to use microprocessor chips that contain tens of thousands of transistors in packages that are only several millimeters in size, i.e. large enough for humans, and assembling machines, to handle, but very small nonetheless. 

In digital circuitry, such as computers, we are only interested in two states (1) ON and (2) OFF.  Transistors are used to represent only these two states (switched ON and switched OFF). The audio - linear operating range - characteristics of transistors is ignored and avoided in such circuitry.

Transistors have shrunk to the size of specs of dust.  In relation, dust particles can seem huge and ruin the operation of transistors and chips.  Chips are manufactured in "clean rooms" that keep the dust out.

Electric current takes a moment to travel from one end of a transistor to the other.  This is called *propagation delay*.  The propagation delay is usually quite small (sub-nanoseconds), but, adds up to significant amounts of time (e.g. microseconds) in circuits that use a lot of transistors. 

Transistors typically have three pins - (1) "ground" (common) (2) a big pipe, and, (3) a little pipe.  The big pipe carries large amounts of current, but the little pipe can control whether the big current flows or not. Very small amounts of current flowing into the little pipe can open up or shut down the big pipe.  Transistors can act like switches where only small amounts of electricity can control huge amounts of electricity.  Instead of physically flicking switches, computer programs send small amounts of electricity into chips to control interesting, bigger, devices, such as printers, robots, video screens, etc.  Likewise, we've figured out ways to take inputs from bigger switches, like keyboards and mice, and turn them into small amounts of electricity as inputs to computer chips.

For those interested, Jeri Ellsworth produced a video that shows how she built a transistor.  The transistor was huge and didn't need to be built in a clean room. [Jeri Homebrew NMOS Transistor](https://www.youtube.com/watch?v=w_znRopGtbE)


The actual number of instructions available for programming in Assembler, depends on the chip designer.  Early micro-processor chips had approximatey 80 instructions.

Most programmers no longer use Assembler directly, but, rely on HLLs (high level languages) to generate assembler for them.

Assembler uses a very terse syntax usually based on characters, e.g. characters in the ASCII alphabet.  At the lowest levels, instructions - called *opcodes* - are represented as codes made up of groups of binary bits.  In very early computers, the codes were entered by hand using physical toggle switches on the front panel of electronic computers.  Assembler programs map terse strings of ASCII characters to bit codes needed for each instruction.

Assembler strings - *mnemonics* - were kept terse to allow easy matching by early versions of Assembler programs.  Originally, mnemonic strings were placed on separater lines of text - again, to allow for easy matching ("parsing").

The concept of recursive, list-based assembly language was introduced around 1956 as the Lisp language, but was not recognized as an alternate form of assembler at the time.  Early Lisps needed to *fake out* instruction sets (e.g. CONS, CAR, CDR, EQ, etc.) and needed to be interepreted by software instead of being interpreted by hardware.  The result was that early Lisp programs were much slower than early line-oriented Assembler programs.  Line-oriented Assembler is interpreted by hardware.  Since that early time, many Lisp systems have been compiled to machine code and are interpreted by hardware instead of being interpreted by software, but, the stigma of slowness remains.  Lisp is considered to be "less efficient" than line-oriented Assembler and languages - like Rust and Haskell - that generate line-oriented Assembler.   

