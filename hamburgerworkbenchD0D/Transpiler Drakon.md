## Grammar
flowchart.ohm
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
## Re-Formatter
flowchart.fmt
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

## Makefile Entries
```
...
step.js: step.drakon $(DRAKON) $(IDRAKON)
	./flowchart.bash <step.drakon >step.js
...
```

flowchart.bash
```
#!/bin/bash
prep=~/tools/pre/pre
cdir=`pwd`
${prep} '.' '$' flowchart.ohm flowchart.fmt --stop=1 --support=${cdir}/support.js
```
