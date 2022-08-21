In the fictional programming manual for XYZpi, the rule book says:

- if you type in the phrase

```
I Want A Hamburger
```

- then the Red LED[^led] will light up.

[^led]: LED means "Light Emitting Diode".  LEDs form the basis for most lighting these days, from TV screens, LEDs in your phone, etc.  There are other technologies (like liquid crysals), but LEDs are cheaper and more abundant.  Small computers, like rPIs, know how to turn LEDs on and off.

We use Ohm-JS[^peg] to pattern-match the phrase `I Want A Hamburger`.

[^peg]: Ohm-JS is a variant on the PEG technology.  PEG stands for Parsing Expression Grammar.  Don't worry if you don't understand what this means or if this is too much information.

We use *hooks* (AKA *semantics*) to transpile the phrase into code like:

```
redLED(1);
```

or, in pseudo-assembler[^wasm] :

[^wasm]: Note the similarity to WASM.

```
PUSH #1
CALL REDLED
...
REDLED:
 ...
 RET
```

[[Hamburger Most Simple]]

[[Hamburger Embellished But Still Simple]]

[[Hamburger Github]]

[[../Why You Need To Learn Ohm-JS]]
