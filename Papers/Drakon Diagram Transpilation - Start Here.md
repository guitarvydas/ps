## Synopsis
This paper describes 
- a way to use `draw.io` to draw *Drakon* diagrams
- then to transpile the *Drakon* diagrams into a textual form (manually[^man])
- then to transpile the textual form of the diagrams to JavaScript.

The code generated in this way is used in the kernel of a concurrent operating system.

[^man]: I argue that it is important to understand how to do something manually before automating the process.  I describe how to create automatic transpilers (compilers) for diagrams, elsewhere.  This paper is about the process of converting diagrams to executable code.  If a process is sufficiently mundane (boring), then it can be automated more easily.  I hope to show that converting diagrams to text is mundane.

## Assembly Code For the Next Generation of Expression

> In a 'real' Computer Science, the best languages of an era should serve as 'assembly code' for the next generation of expression.

\-Alan Kay
~ 31:50 [https://www.youtube.com/watch?v=fhOHn9TClXY&t=859s](https://www.youtube.com/watch?v=fhOHn9TClXY&t=859s)[^ra]

[^ra]: Thanks to Rajiv Abraham for pointing this quote out to me.

## Diagram
This paper is not about *why* I drew this diagram, but, *that* I could use a diagram and subsequently use a transpiler (compiler) to convert the diagram to running JavaScript code[^dv].

[^dv]: I learned this phrasing from Darius Vaiciunas, but, he was talking about the weather and not computer science.

To understand this diagram
1. one must understand the Drakon diagram format (links included below)
2. I describe minor annotations that were added to the diagram, to make it easier to translate it mechanically into a textual form.

A brief overview of the purpose of this code is given in an Appendix.

In essence, using a diagram allowed me to separate the algorithm from implementation details.  

The algorithm is (was) experimental and required several iterations to converge on the result that I desired.  Knowing that I could use an automated process to transpile the code to JavaScript made it easier to think *only* about the algorithm and it made it easier to "go back to the drawing board" (i.e. *iterate* the design of the algorithm) without feeling locked-in by the fear of erasing and re-coding parts of the existing code.

A brief reading of the salient points follows below.

![[step.png]]

### Overview Reading of the Diagram
The diagram has one entry point, the ellipse labelled "Try component".

The diagram has one exit point, the ellipse labelled "end".

The diagram has five (5) skewers
1. main
2. try self
3. not activated
4. activated
5. finish

Each skewer is read from top to bottom as a sequence of steps.

Each skewer is ornamented by a *head* rhomboid shape (with a solid outline).

Each skewer is ornamented by a *tail* rhomboid shape (with a dotted outline, inverted such that the smaller section of the rhomboid is at the top) that indicates the next next skewer to be visited.

The hexagons represent conditionals.  These were implemented as function calls to predicates that returned yes/no.

The rectangles represent processing steps, implemented as function calls (whose return value is ignored).

Join points from one skewer to the next are labelled with small integers.  This is an addition to the standard Drakon format.  In fact, any lump of text could have been used instead of the integers.

The diagram was drawn using [draw.io](https://app.diagrams.net), although I could have used the Drakon editor.

The callout-box is a comment and is completely ignored during the transpilation step.

### Drakon Drawing Format

Drakon is a methodology invented for the Russian Space Program.

The methodology (and format) is documented in three (3) tutorial PDF files:
- https://drakonhub.com/files/drakon_part1_eng.pdf
- https://drakonhub.com/files/drakon_part2_eng.pdf
- https://drakonhub.com/files/drakon_part3_eng.pdf

## Nested Textual Form

```
flowchart Try-component {
  start main
  skewer main {
    unless has-children try-self/1
    memo-readiness-of-each-child
    step-each-child
    unless any-child-was-previously-ready try-self/2
    > activated/0
  }
  skewer try-self {
    : try-self/1
    : try-self/2
    unless self-has-input not-activated/3
    self-first-step-with-input
    > activated/0
  }
  skewer not-activated {
    : not-activated/3
    > finished/0
  }
  skewer activated {
    > finished/0
  }
  skewer finished {
    end
  }
}
```

## Transpilation to JavaScript
We use Ohm-JS to transpile the textual form into JavaScript.

Ohm-JS requires two (2) steps:
1. pattern-match the input text code against a *grammar*
2. reformat the captured matches and output as JavaScript code

### Grammar

```
flowchart {

Flowchart = "flowchart" name "{" "start" name Skewer+ "}"
Skewer
  = "skewer" name "{" Action LabelledAction+ "}" -- both
  | "skewer" name "{" Action "}"                 -- actiononly
  | "skewer" name "{" LabelledAction+ "}"        -- labelledactionsonly
  | "skewer" name "{" "}"                        -- neither
  
Action 
  = Unless
  | Result
  | Jump
  | End
  | Call
  | Send


LabelledAction 
  = ":" LabelDef Action -- action
  | ":" LabelDef        -- empty
  
Unless = "unless" name LabelRef Action?
Jump = ">" LabelRef Action?
Send = "send" name Value Action?
Call = MethodRef Action?
Result = ">>" YesNo Action?
End = "end" Action?

YesNo = 
  | "yes" -- yes
  | "no"  -- no

keyword = (
    "flowchart" 
  | "skewer" 
  | "start" 
  | "unless" 
  | "send" 
  | "end"
  | "yes"
  | "no"
  | "_"
  ) ~namecharRest

bracket = "{" | "}" | "(" | ")" | "[" | "]"
separator = ":" | ">>" | ">" | "/" | bracket

LabelDef = Label
LabelRef = Label
Label = name "/" number

MethodRef = name ~"/"

name
  = "_"        -- trigger
  | namestring -- name 
namestring = namecharFirst namecharRest*
namecharFirst = ~keyword namechar 
namecharRest = ~keyword namechar

namechar = ~space ~separator any

number = digit+

space
 += comment

comment
  = "//" (~"\n" any)* "\n"  -- singleLine
  | "/*" (~"*/" any)* "*/"  -- multiLine

string = dq (~dq any)* dq
dq = "\""

Value = name | number

}
```
### Formatting Output
I used the *prep* tool to create JavaScript from the Ohm-JS match captures.

The *prep* tool is a thin veneer over Ohm-JS (the semantics portion).  It is possible to use raw Ohm-JS for all of this code, foregoing the use of *prep*.  As can be seen, though, there are enough details needed in the transpilation process to make it beneficial to separate *what* is wanted from the *how*.

Using raw Ohm-JS requires the creation of JavaScript functions that take match captures as parameters and then reformat the captures into some other form.

The *prep* tool restricts all JavaScript semantics code to dealing only with strings (JavaScript *template strings*). 

```
Flowchart [kfc name lb kstart start @sk rb] = [[\nexports.${name} = function () {
var _ret = undefined;
var lambdas = {${sk}
_endoflambdas: null
};
return (function (_me) { return lambdas.${start} (_me, 0); });
}
]]


Skewer_both [ksk name lb a @la rb] = [[\n${name}: function (_me, _label) {
if (_label === 0) {${a}${la}
} else {
_me.panic ("${name}", _label); 
}
}\,]]

Skewer_actiononly [ksk name lb a rb] = [[\n${name}: function (_me, _label) {
if (_label === 0) {${a}
} else {
_me.panic ("${name}", _label); 
}
}\,]]

Skewer_labelledactionsonly [ksk name lb @la rb] = [[\n${name}: function (_me, _label) {
if (_label === 0) {${la}
} else {
_me.panic ("${name}", _label); 
}
}\,]]

Skewer_neither [ksk name lb rb] = [[\n${name}: function (_me, _label) {
_me.panic ("${name}", _label); 
}\,]]

Action [a] = [[\n${a}\n]]

LabelledAction_action [kcolon ldef cont] = [[\nreturn ${support.formatLabelFunction (ldef)};
} else if (_label === ${support.formatIndex (ldef)}) \{${cont}\n]]
LabelledAction_empty [kcolon ldef] = [[\nreturn ${support.formatLabelFunction (ldef)};
} else if (_label === ${support.formatIndex (ldef)}) {\n]]

Unless [ku n1 lref @cont]
  = [[if (!_me.${n1} ()) {
 return ${support.formatLabelFunction (lref)};
} else {
${cont}
;}]]

Jump [k n @cont] = [[return ${support.formatLabelFunction (n)};${cont}]]
Call [n @cont] = [[_me.${n} ();${cont}]]
Send [ksend n v @cont] = [[_me.send ("${n}", ${v}, _me.name, null);${cont}]]
Result [k v @cont] = [[_ret = ${v};${cont}]]
End [k @cont] = [[return _ret;${cont}]]

YesNo_yes [yn] = [[true]]
YesNo_no [yn] = [[false]]



LabelDef [n] = [[${n}]]
LabelRef [n] = [[${n}]]
Label [name kslash number] = [[${name}${kslash}${number}]]

MethodRef [n] = [[${n}]]



bracket [c] = [[${c}]]
separator [c] = [[${c}]]

name_trigger [k] = [[true]]
name_name [n] = [[${n}]]
namestring [first @rest] = [[${support.mangle (first + rest)}]]
namecharFirst [c] = [[${c}]]
namecharRest [c] = [[${c}]]

separator [sep] = [[${sep}]]

keyword [kw] = [[${kw}]]

space [c] = [[${c}]]

comment [c] = [[${c}]]

string [qb @cs qe] = [[${qb}${cs}${qe}]]
dq [c] = [[${c}]]
```
### JavaScript Output
```

exports.Try_component = function () {
    var _ret = undefined;
    var lambdas = {
        main: function (_me, _label) {
            if (_label === 0) {
                if (!_me.has_children ()) {
                    return lambdas.try_self (_me, 1);
                } else {

                    _me.memo_readiness_of_each_child ();
                    _me.step_each_child ();
                    if (!_me.any_child_was_previously_ready ()) {
                        return lambdas.try_self (_me, 2);
                    } else {

                        return lambdas.activated (_me, 0);

                        ;}



                    ;}

            } else {
                _me.panic ("main", _label); 
            }
        },
        try_self: function (_me, _label) {
            if (_label === 0) {
                return lambdas.try_self (_me, 1);
            } else if (_label === 1) {

                return lambdas.try_self (_me, 2);
            } else if (_label === 2) {
                if (!_me.self_has_input ()) {
                    return lambdas.not_activated (_me, 3);
                } else {

                    _me.self_first_step_with_input ();
                    return lambdas.activated (_me, 0);


                    ;}


            } else {
                _me.panic ("try_self", _label); 
            }
        },
        not_activated: function (_me, _label) {
            if (_label === 0) {
                return lambdas.not_activated (_me, 3);
            } else if (_label === 3) {
                return lambdas.finished (_me, 0);


            } else {
                _me.panic ("not_activated", _label); 
            }
        },
        activated: function (_me, _label) {
            if (_label === 0) {
                return lambdas.finished (_me, 0);

            } else {
                _me.panic ("activated", _label); 
            }
        },
        finished: function (_me, _label) {
            if (_label === 0) {
                return _ret;

            } else {
                _me.panic ("finished", _label); 
            }
        },
        _endoflambdas: null
    };
    return (function (_me) { return lambdas.main (_me, 0); });
}
```
## Appendix Appeasing SVG and Draw.io

SVG defines
- rectangles
- ellipses
- lines
- text.

If these items are used in the diagrammatic syntax, then automated parsing is easier.

Other shapes, like general rhomboids, are composed of multiple lines and are "more difficult" to parse.

At present, it would be easier to build automatic diagram parsers (AKA transpilers, compilers) by using only constructs that are directly supported by SVG, i.e. *rectangles*, *ellipses*, *squares*, *circles*, *lines* and *text*.

SVG allows shape elements to have attributes, like color.  These attributes can be easily parsed and can be used to augment diagrammatic syntax.

In the future, diagram editors might be improved to support more shapes natively, like rhomboids and pentagons and hexagons, etc.

As far as transpilation is concerned, it doesn't matter how much work needs to be done in the editor to recognize and emit shapes.  The transpilation process is aided by an output format (like SVG) that directly includes shapes that need no further parsing.

Alternately, one might build the equivalent of a *tokenizer* that preprocesses SVG and walks lines to recognize closed shapes and to replace the line groups by single higher-level diagrammatic elements (e.g. header boxes (rhomboids), arrows, etc.).

### Draw.io

It appears that `draw.io` uses a precursor to SVG notation, called `mxGraph`.

As such, `draw.io` is the only diagram editor that I have found that is suitable for writing programs as diagrams.  

### SVG Overkill

Most other SVG editors seem to emphasize other more swoopy characteristics of SVG.  

These other editors create full-blown graphical drawings, which are more difficult to parse than simple SVG.

These other editors contribute to the notion that there is a wide gulf between textual progamming languages and so-called visual programming languages.

### Difference Between Textual Programming Languages and Diagrammatic Programming Languages

In my opinion, the main difference between textual programming languages and diagrams is the fact that most current textual programming languages contain under-the-hood synchrony which clashes with accepted interpretation of diagrams by humans.  

Synchrony might be a requirement for theoretical treatment of progamming languages, but synchrony makes for a poor UX for non-theoretical use.

Programming languages are IDEs for programming.  As such, they should appeal to the basic instincts of the class of programmers that the programming languages are intended to be used by.

Tools, such as Ohm-JS, PEG, etc. make it easier to create multiple languages, hence, languages can be tuned for specifiy uses (e.g. language-building theory vs. spreadsheets, etc.).

I argue that programmers should build *SCN*s (Solution-Centric Notations) on a per-project basis instead of relying on the use of General Purpose Programming Languages and Operating Systems.  This notion is very similar to Lispers' use of *macros* and the idea of *little languages*.  

### DSLs
The accepted notion of DSLs represents a different breed of SCN.

DSLs seem to take days/weeks/months of work to build and try to capture a broad swath of functionality, albeit tuned for specific purposes.

SCNs, though, should take only hours (afternoons) to build.  In the future, we might have toolboxes that provide components for tokenizing shapes, declaring identifiers, checking usage of identifiers against declarations, etc.

SCNs rely on existing languages ("toolbox languages"), like JavaScript, C, Python, etc. to do the heavy lifting and compilation to executable code.

## Appendix Appeasing Ohm-JS and PEG

- Left handles to make parsing easy and obvious.
	- Gammars are single-layered constructs, and, as such can introduce hidden gotchas as grammatical constructs are added to a given SCN.
	- To reduce bugs due to such phrase inter-dependencies, the use of Left-Handles removes all parsing ambiguities.  For example, if every programming construct begins with a unique character or a unique keyword, the parser can work less-hard to understand (grok, parse) the incoming text.  Likewise, the programmer doesn't need to worry about disambiguating the grammar.  
	- The main drawback of this technique is the limited supply of unique characters (aided by the use of UNICODE characters) and a language that looks like a Christmas Tree of strange symbols that are difficult to remember and form a poor(er) UX than well-crafted languages.
	- Another drawback is with the use of keywords. If an SCN contains many hard-wired keywords, they might end up clashing with users' desires to use these words as symbols (and not keywords).  For example if a user wants to use the symbol *list*, the user must ensure that there is no hard-wired keyword named *list*, first.  This tension between keywords and user-defined symbols, can be seen played out in Lisp-2s vs. Lisp-1s.
- 
## Appendix What Is The Point Of This Algorithm?
This algorithm forms a portion of the a message-passing system composed with software components.

Components come in two (2) flavours:
1. Container
2. Leaf

The code for executing a Container needs to treat the Container as a state machine and to step the state machine multiple times.

Each step requires delegation of the step command to all children components within a Container.

A Container must not pull another input from its own input queue unless all of its children are quiescent.

The diagram is meant to encode this step-wise logic in an understandable form.  

It is likely that the algorithm can be further reduced and optimized at the expense of increasing the level of obfuscation of the purpose of the algorithm.

This diagram represents a *start* in the thinking process.  I expect that the diagram will be discarded in the future and replaced by a more elegant algorithm.  The point of this project was not to buff the algorithm(s), but, to show that diagrams can be transpiled and that concurrency can be used at a very low level.  Another salient point of the project is to show how to divide-and-conquer - by separating control-flow from implementation considerations.

## Appendix Github
The diagram and its code are part of a larger project found in [duct](https://github.com/guitarvydas/duct)

The name *duct* was used in the hopes of finding a less-baggage-ful word for something akin to UNIX-style *pipes* and concurrency in the small.

The name was chosen as the project began.  The project morphed over time.  In retrospect, a different name might have been used.
## Appendix Prep
