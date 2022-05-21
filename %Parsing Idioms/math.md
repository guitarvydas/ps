# Math - Editing, Replacement, Formatting

## Math Pattern In Action

![[math.png]]

![[mathrun.png]]


## Math Pattern

`math.ohm`

```
simplemath {
  Main = Expr
  Expr
    = Additive
  Additive
    = Expr Operator Primary -- op
    | Primary               -- single
  Operator
    = "+" -- add
    | "-" -- subtract
  Primary 
    = "(" Expr ")" -- nested
    | digit+       -- basic
}
```

## Math Pattern Formats

`math3.fmt` <- JSON
```
Main [e] = [[\[\n${e}\n\] ]]
Expr [a] = [[${a}]]
Additive_op [e op p] = [[${op},\n${e},\n${p}]]
Additive_single [p] = [[${p}]]
Operator_add [op] = [[{"operator" : "+"}]]
Operator_subtract [op] = [[{"operator" : "-"}]]
Primary_nested [lpar e rpar] = [[\n{"nested" :\n[\n${e}\n]\n\}]]
Primary_basic [@ds] = [[{"primary" : ${ds}\}]]
```
`math1.fmt` <- Python
```
Main [e] = [[def f ():\n    return ${e}\nprint (f ())]]
Expr [a] = [[${a}]]
Additive_op [e op p] = [[${e}${op}${p}]]
Additive_single [p] = [[${p}]]
Operator_add [op] = [[+]]
Operator_subtract [op] = [[-]]
Primary_nested [lpar e rpar] = [[(${e})]]
Primary_basic [@ds] = [[${ds}]]
```
`math2.fmt` <- WASM
```
Main [e] = [[${e}]]
Expr [a] = [[${a}]]
Additive_op [e op p] = [[${p}${e}${op}]]
Additive_single [p] = [[${p}]]
Operator_add [op] = [[f64.add\n]]
Operator_subtract [op] = [[f64.sub\n]]
Primary_nested [lpar e rpar] = [[${e}]]
Primary_basic [@ds] = [[f64.const ${ds}\n]]
```

## Math Pattern BASH Script
`math.bash`
```
#!/bin/bash
prep=./prep
cid=`realpath .`
echo
${prep} '.' '$' math.ohm identity-math.fmt --stop=1 --support=${cid}/support.js <math.txt 1>&2
echo
${prep} '.' '$' math.ohm math3.fmt --stop=1 --support=${cid}/support.js <math.txt >/tmp/out.json
./jsonprettyprint.bash /tmp/out.json
echo
${prep} '.' '$' math.ohm math1.fmt --stop=1 --support=${cid}/support.js <math.txt 1>&2
echo
${prep} '.' '$' math.ohm math2.fmt --stop=1 --support=${cid}/support.js <math.txt 1>&2

```
