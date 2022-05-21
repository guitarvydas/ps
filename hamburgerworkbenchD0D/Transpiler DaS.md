## Grammar
dia.ohm
```
dia {
  Main = Implementation+
  Implementation = ContainerImplementation | SynchronousLeafImplementation

ContainerImplementation =
  | "implementation" name "(" NameList ")" SequenceOfBoxes -- withParam
  | "implementation" name SequenceOfBoxes -- noParam

SynchronousLeafImplementation 
  = "sync" name "<=" DatumList Box -- withFormals
  | "sync" name                Box -- withoutFormals

SequenceOfBoxes = NestedBox+
NestedBox = Box
NB = NestedBox
Box = "{" BoxOperation Box? "}"
OrElse = "{" "orelse" Box "}"

BoxOperation
  = ForEvery
  | Synonym
  | FindConnectionFromMe
  | Find
  | Lookup
  | WithLock
  | Cond
  | VarBox
  | WhenAll
  | When
  | Return
  | CheckReturn
  | SynchronousCall
  | Pass

WhenAll = "when" "all" PredicateBlock NestedBox
When = "when" "messages" NB?
Return = "->" DatumList NB?
CheckReturn = "check" "return" string NB?
FindConnectionFromMe = "find" Datum "from" "me" "on" "port" Datum NB OrElse NB?
Pass = "pass"

Cond = "cond" FirstCondClause RestCondClause*
FirstCondClause = CondClause
RestCondClause = CondClause
CondClause = "{" Predicate Box "}"

WithLock = "lock" Datum NB?

Find
  = "find" name "in" Datum "given" ParameterList "=>" name NB OrElse NB? -- withParams
  | "find" name "in" Datum                       "=>" name NB OrElse NB? -- withoutParams

VarBox =
  | "var" name "<=" "$i" "{" "{" DatumList "}" Datum "}" NB? -- inputmessage
  | "var" name "<=" "$o" "{" "{" DatumList "}" Datum "}" NB? -- outputmessage
  | "var" name "<="          "{" DatumList "}" NB?           -- array

Synonym =
  | "synonym" name "=" "{" DatumList "}" NB? -- obj
  | "synonym" name "=" Datum NB?             -- solitary

Lookup =
  | "lookup" Datum "=>" name NB?

ForEvery
  = "for" "every" "item" "in" Datum "given" ParameterList "=>" name NB? -- sugaredWithParams
  | "for" "every" name "in" Datum "given" ParameterList "=>" name NB? -- withParams
  | "for" "every" "item" "in" Datum  "=>" name NB? -- sugaredWithoutParams
  | "for" "every" name "in" Datum  "=>" name NB? -- withoutParams


SynchronousCall =
  // no nesting here - Call is a Leaf, not a nested box
  | "@" Datum "<=" Datum -- params
  | "@" Datum            -- noparams
  | "#" Datum "<=" Datum -- external_params
  | "#" Datum            -- external_noparams


Datum
  = Datum "of" Datum -- field
  | Datum "." Datum  -- dottedField
  | kwPORT          -- port
  | kwME            -- me
  | name            -- name

Predicate =
  | Datum "is" "not" "me" -- notme
  | Datum "is" "me"      -- me
  | Datum "==" Datum -- eq
  | Datum "!=" Datum -- ne

PredicateBlock = "{" Predicate PredicateMore* "}"
PredicateMore = Predicate

ParameterList
  = Datum "X" ParameterList -- list
  | Datum                   -- solitary

DatumList 
  = Datum "," DatumList -- list
  | Datum               -- solitary

NameList 
  = name "," NameList -- list
  | name              -- solitary

  separator
    = "<="
    | "=>"
    | "->"
    | "//"
    | "=="
    | "!="
    | "$i"
    | "$o"
    | "="
    | "{"
    | "}"
    | "("
    | ")"
    | "@"
    | "#"
    | "."
    | ","
    | eol

keyword
  = &(~namecharFirst)
          ( "implementation"
          | "messages"
          | "orelse"
          | "return"
          | "given"
          | "lookup"
          | "every"
          | "check"
          | "pass"
          | "lock"
          | "find"
          | "from"
          | "cond"
          | "with"
          | "when"
          | "item"
          | "sync"
          | "port"
          | "for"
          | "all"
          | "not"
          | "is"
          | "in"
          | "on"
          | "of"
          | "me"
          | "X") 
   &(~namecharRest)

kwME = &(~namecharFirst) "me" &(~namecharRest)
kwPORT = &(~namecharFirst) "port" &(~namecharRest)

string = dq (~dq any)* dq
dq = "\""
    
eol = "\n"

name = namecharFirst namecharRest*
namecharFirst = ~separator ~keyword ("_" | "A" .. "Z" | "a" .. "z")
namecharRest = ~separator ~keyword ("_" | "A" .. "Z" | "a" .. "z" | "0" .. "9")

space
 += comment

comment
  = "//" (~"\n" any)* "\n"  -- singleLine
  | "/*" (~"*/" any)* "*/"  -- multiLine

}
```
## Re-Formatter
dia.fmt
```
Main [@i] = [[const msg = require ('./message');\n${i}]]
Implementation [x] = [[${x}]]

ContainerImplementation_withParam [ki name lp formal rp b] = [[exports.${name} = function (_me, ${formal}) \{\nvar _ret =  null;\n${b}\nreturn  _ret;\n\}]]
ContainerImplementation_noParam [ki name b] = [[exports.${name} = function () \{\nvar _me = this;\nvar _ret = null;\n${b}\nreturn _ret;\n\}]]

SynchronousLeafImplementation_withFormals [ksync name karrow dl b] = [[

${name} = function ([${dl}]) {${b}
\}]]

SynchronousLeafImplementation_withoutFormals [ksync name b] = [[

this.${name} = function () {${b}
\}]]

SequenceOfBoxes [@b] = [[${b}]]
NestedBox [b] = [[${b}]]
NB [b] = [[${b}]]

Box [klb bo @b krb] = [[\n${bo}${b}]]
BoxOperation [op] = [[${op}]]
OrElse [klb korelse b krb] = [[${b}]]

Pass [kpass] = [[]]

When [kwhen kmessages @nb] = [[if (_me.inputQueue.length > 0) {${nb}\n\};]]

FindConnectionFromMe [kfind d kfrom kme kon kport d2 b e @nb]
  = [[var ${d} = _me.find_connection (_me, ${d2});
if (${d}) {${b}
} else \{${e}\}${nb}]]

WhenAll [kwhen kall pb nb] = [[\nif (${pb}) \{${nb}\n\}]]
Return [karrow d @nb] = [[\n_ret = ${d};${nb}]]
CheckReturn [kcheck kreturn s @nb] = [[if (_ret === null) {\nconsole.error ("no value returned");\nconsole.error (\`${s}\`);\nprocess.exit (1);}\n${nb}]]

Cond [kcond ccf ccr] = [[${ccf}${ccr}]]
CondClause [klb p b krb] = [[(${p}) {${b}
\}]]
FirstCondClause [cc] = [[if ${cc}]]
RestCondClause [cc] = [[ else if ${cc}]]

WithLock [klock name @nb] = [[${nb}]]

Find_withParams [kfind name kin d kgiven pl karrow name2 b e @nb]
  = [[var ${name2} = this.find_${name}_in_${d} (this, ${pl});if (${name2}) \{${b}\n\} else \{${e}\};${nb}]]
Find_withoutParams [kfind name kin d        karrow name2 b e @nb]
  = [[var ${name2} = this.find_${name}_in_${d} (this);if (${name2}) \{${b}\n\} else \{${e}\};${nb}]]

VarBox_array [kvar name karrow klb dl krb @nb] = [[var ${name} = \[${dl}\];${nb}]]
VarBox_inputmessage  [kvar name karrow ki klb0 klb dl krb d krb0 @nb] = [[${kvar} ${name} = new msg.InputMessage (${dl},${d}.comefrom,"?",${d});${nb}]]
VarBox_outputmessage  [kvar name karrow ko klb0 klb dl krb d krb0 @nb] = [[${kvar} ${name} = new msg.OutputMessage (${dl},${d}.comefrom,"?",${d});${nb}]]


Synonym_obj [ksyn name keq klb dl krb @nb] = [[var ${name} = \[${dl}\];${nb}]]
Synonym_solitary [ksyn name keq dl @nb] = [[var ${name} = ${dl};${nb}]]

Lookup [klookup d karrow name @nb] = [[var ${name} = _me.lookupChild (${d});${nb}]]

ForEvery_sugaredWithParams [kfor kevery kitem kin d kgiven pl kassign name @nb]
  = [[${d} (${pl}).forEach (${name} => \{${nb}\n\});]]
ForEvery_withParams [kfor kevery name1 kin d kgiven pl kassign name @nb]
  = [[${d} (${pl}).${name}.forEach (${name1} => \{${nb}\n\});]]
ForEvery_sugaredWithoutParams [kfor kevery kitem kin d kassign name @nb]
  = [[${d}.forEach (${name} => \{${nb}\n\});]]
ForEvery_withoutParams [kfor kevery name kin d kassign name1 @nb]
  = [[${d}.${name}.forEach (${name1} => \{${nb}\n\});]]


SynchronousCall_params [kat d1 karrow d2] = [[${d1} (${d2});]]
SynchronousCall_noparams [kat d1] = [[${d1} ();]]
SynchronousCall_external_params [kat d1 karrow d2] = [[_me.${d1} (${d2});]]
SynchronousCall_external_noparams [kat d1] = [[_me.${d1} ();]]


Datum_field [n kof d] = [[${d}.${n}]]
Datum_dottedField [n kdot d] = [[${n}.${d}]]
Datum_name [n] = [[${n}]]
Datum_me [n] = [[_me]]
Datum_port [n] = [[port]]

Predicate_me [left kis kme] = [[(${left} === "_me")]]
Predicate_notme [left kis lnot kme] = [[(${left} !== "_me")]]
Predicate_eq [left eq right] = [[(${left} === ${right})]]
Predicate_ne [left eq right] = [[(${left} !== ${right})]]

PredicateBlock [lb p1 @pm rb] = [[${p1}${pm}]]
PredicateMore [p] = [[ && ${p}]]


ParameterList_list [d kx pl] = [[${d}, ${pl}]]
ParameterList_solitary [d] = [[${d}]]

DatumList_list [d1 kcomma d2] = [[${d1}, ${d2}]]
DatumList_solitary [d] = [[${d}]]
NameList_list [d1 kcomma d2] = [[${d1}, ${d2}]]
NameList_solitary [d] = [[${d}]]

name [first @rest] = [[${first}${rest}]]
namecharFirst [c] = [[${c}]]
namecharRest [c] = [[${c}]]

separator [sep] = [[${sep}]]

keyword [kw] = [[${kw}]]

eol [c] = [[${c}]]

space [c] = [[${c}]]

comment [c] = [[${c}]]

string [dq1 @s dq2] = [[${s}]]
dq [c] = [[]]

```

## Makefile Entries
```
...
find_connection.js: find_connection.das $(DIA)
	./dev.bash <find_connection.das >find_connection.js

find_connection_in__me.js: find_connection_in__me.das $(DIA)
	./dev.bash <find_connection_in__me.das >find_connection_in__me.js

routing.js: routing.das $(DIA) $(IDIA)
	./dev.bash <routing.das >routing.js

handling.js: handling.das $(DIA) $(IDIA)
	./dev.bash <handling.das >handling.js
...
```

dev.bash
```
#!/bin/bash
prep=~/tools/pre/pre
cdir=`pwd`
${prep} '.' '$' dia.ohm dia.fmt --stop=1 --support=${cdir}/support.js
```