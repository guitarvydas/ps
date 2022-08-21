# Ohm-JS As A Component
I want to think of Ohm-JS as a black box (a *component*).

1. First, I draw the the signature of the desired Ohm-JS transpiler component.
2. I manually transcribe the signature into `.tbx` ("toolbox") format.  I call input and output parameters *ports*.
3. I add an Implementation.
4. I use an Ohm-JS grammar plus a `.fmt` spec to re-write the `.tbx` file into a `.js` file
5. I modify the .HTML ("baseline") function to use the black box (the `.js` file from step (4))
6. Re-test.

> [!tip] To create a black box, it is not enough to have *input* parameters.  The black box must have ***output* parameters**, too.

This is quite easy to do.  The black box does not *call* other functions, it simply sends *deferred messages*.

Deferred messages are messages that are not delivered immediately, but, simply pushed onto an output queue belonging to the component (semantically[^opt]).  

[^opt]: This can be optimized, later.

**Of Note**: Step (2) can be automated.  I perform this step manually for explanatory purposes.   See elsewhere for my technique of automatically transpiling diagrams to text code.

## 1. Black Box Transpiler Signature
![[pm/smallstepswithtbx/fmt-Transpiler.png]]

[[2022-06-18-Black Box Software Components]]
## 2. `.tbx` Transcription
> [!tip] Implementation Details
> Feel free to skip section 2.
> 

I have (arbitrarily) chosen Unicode bracket characters, "⟨" and "⟩", to bracket port-names (input and output).  I use Unicode bracket characters, "❲" and "❳", to wrap identifiers that have whitespace in them.  I use the Unicode character "⤇" as a separator between input ports and output ports (left of "⤇", and right of "⤇", resp.).

I chose Unicode brackets,  "⟪" and "⟫", for verbatim code sequences.  Verbatim code contains raw code in some programming language (in this case JavaScript) and is skipped-over by the transpilers.  Verbatim brackets are simply stripped out in the final step of automatic transpilation of `.tbx` to *programming language* (`.js` in this case), leaving the raw code as part of the final result.

## 3. `.tbx` Implementation
> [!tip] Implementation Details
> Feel free to skip section 3.
> 

I use brace brackets `{ ... }` to enclose Implementation code immediately following Signatures.

There are two kinds of recognized Implementations
1. `{ Leaf { ... }  }`
2. `{ Component { ... } }`

Programmers supply code for message handling by writing Implementations.  

All of the other code is boiler-plate and automatically supplied by the system.

`Leaf` component Implementations have 
1. `persistent` variable declarations ("instance variables" in OOP terminology)
2. `on` event transitions
	- transitions supply a single source (input) port name and some code
	- TODO: add guards (calls to predicates that must return `yes` before a transition is fired)
	- a block of code (see elsewhere for valid code phrases).

```
comp transpiler ⟨go⟩ ⟨src⟩ ⟨❲grammar name❳⟩ ⟨❲grammar text❳⟩ ⟨❲hook name❳⟩ ⟨❲semantics hooks❳⟩ ⤇  ⟨success⟩ ⟨❲transpiled text❳⟩ ⟨error⟩ {
  leaf {
   persistent src
   persistent ❲grammar name❳
   persistent ❲grammar text❳
   persistent ❲hook name❳
   persistent ❲semantics hooks❳
   on ⟨src⟩:               save ⇉ src
   on ⟨❲grammar name❳⟩:    save ⇉ ❲grammar name❳
   on ⟨❲grammar text❳⟩:    save ⇉ ❲grammar text❳
   on ⟨❲hook name❳⟩:       save ⇉ ❲hook name❳
   on ⟨❲semantics hooks❳⟩: save ⇉ ❲semantics hooks❳
   on ⟨go⟩:
     temp ⟪ohm.grammars (this.❲grammar text❳)⟫ ⇉ gs
     temp ⟪gs[this.❲grammar name❳]⟫ ⇉ g
     temp ⟪g.match (this.src)⟫ ⇉ cst
     if (⟪cst.succeeded ()⟫) {
       temp ⟪g.createSemantics ()⟫ ⇉ sem
       do ⟪sem.addOperation (this.❲hook name❳, this.❲semantics hooks❳);⟫
       temp ⟪sem (cst)[this.❲hook name❳] ()⟫ ⇉ result
       send true ⤇ ⟨success⟩
       send result ⤇ ⟨❲transpiled text❳⟩
     } else {
       send false ⤇ ⟨success⟩
       send ⟪g.trace (src)⟫ ⤇ ⟨error⟩
     }
  }
}
```

**Of Note**: The `.tbx` implementation supplies the *bare minimum* code phrasing necessary to implement a component.  Code that does "something else" is written in another language and included as *verbatim* code.  In the above example, I've included snippets of JavaScript as *verbatim* code. TODO: it might be possible to define layers of toolbox languages that allow phrasing common to most other programming languages (e.g. lambdas, mutation, etc.).  This is an area of active research.
# 4. `.tbx` As `.js`
> [!tip] Implementation Details
> Feel free to skip section 4. on first reading
> 

```
function Transpiler () {
    this.getOutputMap = function () {
        let map = {};
        this.outputqueue.forEach (output => {
            map [output.port] = output.data;
        });
        return map;
    }
    this.outputqueue = [];
    this.src = undefined;
    this.grammar_name = undefined;
    this.grammar_text = undefined;
    this.hook_name = undefined;
    this.semantics_hooks = undefined;
    this.handler = function (message) {
        message.port = message.port.replace (/ /g, '_');
        if (message.port === "src") {
            this.src = message.data;
        }
        if (message.port === "grammar_name") {
            this.grammar_name = message.data;
        }
        if (message.port === "grammar_text") {
            this.grammar_text = message.data;
        }
        if (message.port === "hook_name") {
            this.hook_name = message.data;
        }
        if (message.port === "semantics_hooks") {
            this.semantics_hooks = message.data;
        }
        if (message.port === "go") {
            let gs = ohm.grammars (this.grammar_text);
            let g = gs[this.grammar_name];
            let cst = g.match (this.src);
            if (cst.succeeded ()){
                let sem = g.createSemantics ();
                sem.addOperation (this.hook_name, this.semantics_hooks);
                let result = sem (cst)[this.hook_name] ();
                this.outputqueue.push ({port: "success", data: true});
                this.outputqueue.push ({port: "transpiled_text", data: result});
            }else{
                this.outputqueue.push ({port: "success", data: false});
                this.outputqueue.push ({port: "error", data: g.trace (src)});
            }
        }
    }
}
```

The `.ohm` grammar...
```
comp {
  Main = "comp" nameDef InputPort+ "⤇" OutputPort+ Implementation?

  Implementation = "{" (LeafImplementation | ContainerImplementation) "}"

  LeafImplementation = "leaf" "{" Handler "}"

  ContainerImplementation = "container" "{" Handler "}"

  Handler = PersistentVariable+ Transition+

  PersistentVariable = "persistent" nameRef

  Transition = "on" SourcePort ":" Code+

  Code =
    | "save" "⇉" nameRef -- save
    | TempVariable -- temp
    | IfStatement -- if
    | "do" verbatim -- do
    | "send" Expression "⤇" SinkPort -- send

  TempVariable = "temp" Expression "⇉" nameDef
  IfStatement = "if" "(" Expression ")" "{" Code+ "}" "else" "{" Code+ "}"

  Expression =
    | verbatim
    | operand

  operand =
    | nameRef

  Port = "⟨" #nameRef "⟩"
  InputPort = Port
  OutputPort = Port
  SourcePort = Port
  SinkPort = Port

  name =
    | "❲" (~"❳" any)* "❳" -- bracketed
    | ident -- single

  nameDef = name
  nameRef = name
    
  verbatim = "⟪" (~"⟫" any)* "⟫"
  
  keyword = ("save" | "send" | "do" | "temp" | "if" | "else" | "comp" | "leaf" | "container" | "on" | "persistent") &separator
  ident = ~keyword ident1 identrest*
  
  ident1 = "_" | letter
  identrest = alnum | ident1

  separator = " " | "\n" | "\t"  
}
```

The `js-comp.fmt` re-formatter into Javascript...
```
Main [kcomp NameDef @InputPort karrow @OutputPort @Implementation] = [[function ${fmt.capitalize (NameDef)} () {${Implementation}\n}]]

Implementation [lb x rb] = [[${x}]]

LeafImplementation [kleaf lb Handler rb] = [[
this.getOutputMap = function () {
  let map = {};
  this.outputqueue.forEach (output => {
    map [output.port] = output.data;
  });
  return map;
}
${Handler}]]

ContainerImplementation [kcontainer lb Handler rb] = [[
this.outputqueue.forEach (output => {
    map [output.port] = output.data;
  });
  return map;
}
${Handler}]]

Handler [@PersistentVariable @Transition] = [[\nthis.outputqueue = [];${PersistentVariable}\nthis.handler = function (message) {\nmessage.port = message.port.replace (/ /g, '_');
${Transition}
}]]

PersistentVariable [kpersistent NameRef] = [[\nthis.${NameRef} = undefined;]]

Transition [kon SourcePort kcolon @Code] = [[\nif (message.port === "${SourcePort}") {${Code}\n\}]]

Code_save [ksave karrow NameRef] = [[\nthis.${NameRef} = message.data;]]
Code_temp [TempVariable] = [[${TempVariable}]]
Code_if [IfStatement] = [[${IfStatement}]]
Code_do [kdo verbatim] = [[\n${verbatim}]]
Code_send [ksend Expression karrow SinkPort] = [[\nthis.outputqueue.push (\{port: "${SinkPort}", data: ${Expression}\});]]

TempVariable [ktemp Expression karrow NameDef] = [[\nlet ${NameDef} = ${Expression};]]
IfStatement [kif lp Expression rp lb @Code rb kelse lb2 @Code2 rb2] = [[\n${kif} ${lp}${Expression}${rp}${lb}${Code}\n${rb}${kelse}${lb2}${Code2}\n${rb2}]]

Expression [x] = [[${x}]]

operand [NameRef] = [[${NameRef}]]

Port [lb NameRef rb] = [[${NameRef}]]
InputPort [Port] = [[${Port}]]
OutputPort [Port] = [[${Port}]]
SourcePort [Port] = [[${Port}]]
SinkPort [Port] = [[${Port}]]

name_bracketed [lb @cs rb] = [[${lb}${cs}${rb}]]
name_single [ident] = [[${ident}]]

nameDef [Name] = [[${Name}]]
nameRef [Name] = [[${Name}]]

verbatim [lb @cs rb] = [[${lb}${cs}${rb}]]

ident [ident1 @identrest] = [[${ident1}${identrest}]]

ident1 [c] = [[${c}]]
identrest [c] = [[${c}]]

keyword [kw la_sep] = [[${kw}]]
separator [c] = [[${c}]]
```

**Of interest**: the output queue is flattened into a single JavaScript object (a *dictionary*) by the `this.getOutputMap ()` function.  TODO: is this a good idea?, should the output queue have only one of each value or should it have a stack for each value? (AKA *alist*).

## 5. Modify HTML
```
  function baseline () {
      let src = document.getElementById('src').value;
      let transpiler = new Transpiler ();
      transpiler.handler ({port: "src", data: src});
      transpiler.handler ({port: "grammar name", data: "baseline"});
      transpiler.handler ({port: "grammar text", data: grammars});
      transpiler.handler ({port: "hook name", data: "walk"});
      transpiler.handler ({port: "semantics hooks", data: rewriteRules});
      transpiler.handler ({port: "go", data: true});
      let result = transpiler.getOutputMap ();
      if (result.success) {
          document.getElementById('status').innerHTML = "OK";
          document.getElementById('output').value = result.transpiled_text;
      } else {
          document.getElementById('output').value = result.error;
          document.getElementById('status').innerHTML = "parse FAILED";
      }
  }
```

Of Note: The above code calls `transpiler.handler (...)` 6 times, once for each input port.  

This could be optimized to use only one input port by changing the signature. 

But, why optimize this?  The above code is for machines, not humans, to read.  It doesn't matter what the code *looks* like to human eyes. 

Note that current programming languages use the single-port method.  All inputs arrive in a single block (non-homogenous) at the same time to a function.  The function, then, desctructures the block into what looks like separate parameters.

It might be more beneficial (AKA flexible) to leave the input ports separated as shown in the above signature.  This might allow distributed apps to function more simultaneously (parallelism is but a subset of simultaneity, IMO).  Separate ports can be fired at different times.

## 6. Re-Test
Load `index4reordering0D.html` into a browser and click the "Test" button.

## Github
[tbx](https://github.com/guitarvydas/tbx)
