# Identity Transpilation

At this point, we will do *something* with the captured matches.

We are going to re-format the captures and then *emit* the newly-formatted code.

Ohm-JS calls this *semantics*.

Ohm-JS allows you to use the full power of JavaScript to produce newly-formatted code.

In the following examples, though, we will use a simple tool called `prep` which uses Ohm grammars and another sub-language called `glue` to re-format the captured matches.

The `glue` sub-language only creates strings (JavaScript template strings, to be exact) and foregoes other possible features of JavaScript programming.



In using the `prep` tool to build transpilers, and, transpiler pipelines, it is advantageous to test the grammar using
1. first, the Ohm-Editor
2. creating an identity transform.

In creating the identity transform, we expect the output of the pipeline to be exactly the same as the input (modulo any space-skipping due to the use of `syntactic` rules).

This gives us a simple check to see that the grammar and scripts are debugged.

Having a working identity transform gives us a jumping-off point for writing re-formatting rules (using the `glue` syntax).

In this section, we discuss only the creation of an identity transpiler.  In later sections, we will hack on the identity grammars to give more interesting results.

We will switch to using *bash* scripts for these examples.  The example grammars were first debugged using the Ohm-Editor, then used to create appropriate `prep` invocations.

## Identity Transpiler

`identity.bash`:
```
#!/bin/bash
prep=./prep
cid=`realpath .`
${prep} '.' '$' identity.ohm identity.fmt --stop=1 --support=${cid}/support.js <identity.txt
${prep} '.' '$' identity.ohm identity2.fmt --stop=1 --support=${cid}/support.js <identity.txt
```

`identity.ohm`
```
leftRecursion {
  Main = Item
  Item = Item alnum -- recursive
       | alnum      -- bottom
}
```

`identity.fmt`
```
Main [P] = [[${P}]]
Item_recursive [item an] = [[${item}${an}]]
Item_bottom [a] = [[${a}]]
```

We have already discussed `.ohm` grammars.

We will not discuss the `.bash` script, but some explanation of the `.fmt` file is included in what follows.

- Each `.fmt` rule has exactly the same name as the corresponding `.ohm` grammar rule name.
- Each `.fmt` rule consists of three (3) parts:
	1. name
	2. names for each match captured by the grammar parser `.ohm`
	3. a formatting rule enclosed in `[[ ... ]]` double brackets.
	4. (the `=` is syntactic sugar that separates the left-hand side from the right-hand side of each rule).

The formatting rules are simply glued together and presented to JavaScript as *template string*s.

Each `.fmt` rule walks the parse tree for each captured match.

The captured match has the same name in the right-hand side as declared in the left-hand side parameter list.

For purposes of explanation, examine the second line of the `.fmt` rule
```
Item_recursive [item an] = [[${item}${an}]]
```
This line says that the Item_recursive format rule takes two arguments, called `item` and `an` (for alphanum).  The right-hand side says to glue the two arguments together into a final JavaScript *template string* `${item}${an}`.  According to JavaScript rules, the parameters are evaluated within the final string, e.g. `${item}` evaluates the pattern-match tree and inserts the result (always a string in `.fmt` syntax) into the final result string.  In essence, `${item}` carries the match of the `Item allnum` pattern and `${an}` carries the match of the `| alnum`.  

Further: if a grammar rule uses `*` or `+` or `?`, then its corresponding parameter in the `.fmt` rule must have `@` in front of it.

*Detail (don't worry about this if you don't understand it yet)*: the tree-walker evaluates parameters recursively, and builds up return strings.  Each recursive traversal produces a string and that string is glued into the result before being passed back upwards through the chain of recursions.

*Detail (don't worry about this if you don't understand it yet)*: there is a syntax (experimental) for handling `.fmt` parameters before their evaluation, but, this feature is not needed in this example, and, is rarely needed in larger examples. You can read about this feature, `{{ ... }}`, in the `glue` documentation.  Maybe a pipeline approach will make this feature redundant in the future (the jury is still out).

## Identity Transpiler In Action

![[identity.png]]