It is possible to string pattern matcher/replacers together in a chain.

An example of this can be seen in the Scheme to Javascript section, where we preprocess the original Scheme code to replace all back-quoted lists with their un-backquoted equivalents.

# Background
The idea of macros was evolved in early Lisps.  

During the evolution, it was found that certain patterns of code were like boilerplates and additional syntax was invented to make writing boilerplates easier.

Lists are a fundamental datatype in Lisp, and, therefore it is possible to create List constants.  Most languages have the concept of string constants - it is possible to create strings using a special syntax like `"abc"` instead of the more laborious syntax of creating strings by calling string constructors `string('a', 'b', 'c')`.

In Lisp, it is possible to write List constants, too.

An example of a List constant might be the shorthand syntax:
```
'(a b 3)
```

which means the same thing as
```
(list a b 3)
```

The above doesn't look too hairy as it stands, but more involved bits of code become cumbersome to write, so the single-quote shorthand is often used in writing Lisp.

In addition to the single-quote shorthand, though, lispers wanted to evaluate bits of the insides of constants, especially when writing macros.

For example, one might want to evaluate "b" but not a, resulting in 
```
(list 'a b 3)
```
Again, this results in hairy code when larger programs are written.

To alleviate this problem, the back-quote syntax was invented...
```
`(a ,b 3)
```
The back-quote means that everything is quoted except when explicitly evaluated with the `,` operator.

This syntax was augmented by more syntax operators that produced list splices, e.g.
```
`(a ,@(b c) 3)`
```
results in
```
(list 'a b c 3)
```
where the list `(b c)` is spliced into the final list.

The knee-jerk reaction to parsing the above kind of thing is to set ad-hoc flags that say "parsing inside a backquote".

We can, though, use syntax pipelines to displace ad-hoc flags. 

We let the parser match the code and we create a second syntax that indicates that a back-quote is being parsed.

To do this, we begin with a basic grammar, like
```
scheme {
  Main = Sexpr+
  Sexpr =
    | QuotedSexpr -- quoted
    | List -- list
    | atom -- atom

atom =
  | string
  | number
  | "#f"
  | "#t"
  | symbol

List =
 | "(" Sexpr* "." Sexpr ")" -- dotted
 | "(" Sexpr* ")" -- plain

QuotedSexpr = sq Sexpr

string = dq (~dq any)* dq
number = digit+
ws = " " | "\n" | "\t"
separator = "(" | ")" | "," | bq | sq | ",@" | dq | ";" | "#" | "."
dq = "\""
sq = "'"
bq = "\x60"
symbol = symchar+
symchar = ~separator ~ws any
comment = ";" (~nl any)* nl
nl = "\n"
space += comment
}
```

and then extend / override the grammar with back-quote pattern-matching, like
```
bqscheme <: scheme {
  Sexpr += 
    | bq BQList -- bqlist
    //| bq atom -- bq YAGNI
    //| bq QuotedList -- YAGNI
  BQList =
   //| "(" BQSexpr* "." BQSexpr ")" -- dotted YAGNI
   | "(" BQitem* ")" -- plain
  BQitem =
    //| ",@" BQList -- bqconstsplice YAGNI
    //| ",@" Sexpr -- bqsplice YAGNI
    | "," Sexpr -- eval
    | Sexpr -- quoted
}
```

The point of pattern-replacing using this extended grammar is to create valid Lisp code that contains no backquotes, making the task of downstream replacers easier.

Note that languages like Python and Javascript have equivalent syntax for unquoting.  In Javascript, *template strings* allow the insertion of evaluated Javascript expressions inside of string constants, like `"... ${...} ..."`.  In Python, *format strings* (`f'... { ... } ...'`) provide similar functionality.  One might write string parsers / checkers / linters for these languages using the multiple-grammar technique.

# Cheating
One of the "tricks" for writing transpilers quickly is to do as little work as possible (YAGNI[^yagni]).

In this case, we begin with working code.  We know:
- the code has compiled cleanly using a full-blown compiler
	- we don't need to re-check the code, we only need to transpile it
- we can scan the code and see what Scheme language constructs it actually uses
	- we can cut corners, not needing to implement a full-blown Scheme grammar.

In the above grammar extension, `bqscheme`, I've marked places where YAGNI applies to the task-at-hand, i.e. transpiling working code.

The original `prolog.scm` code contains no `,@` clauses, and, it uses backquote only on full lists, never using dotted list syntax in a backquote.

Another "trick" is to concentrate on only one problem at a time, the proverbial "do one job well" adage.

In this case, we build a replacer that *only* replaces backquotes.  

We replace backquotes with simpler, but, legal Scheme code.  The transpiler, at this point, transpiles Scheme to Scheme.  Downstream transpilers can convert this code to other languages without having to worry about backquotes.  This division of work makes the current job easier (deal with backquotes only, not needing to tangle other issues up with this issue) and it makes the job of the downstream transpilers easier, since part of the work has been peeled away ("build and forget").

Pipelining, like this, simplifies each task.  One source of complexity is trying to do too much in any one step.

It often appears that pipelining is the same as composing functions.  This is not always the case, since functions have hidden dependencies in them, e.g.
- hard-wired names of other functions tht are called
- hard-wired synchrony under-the-hood.

UNIX shell pipelines are one way to break a problem down into several isolated pieces.  It is possible to optimize pipelines using closures, but, why bother?  Final runtime efficiency only matters in the eye-of-the-beholder.  If you are developing new code, your need for efficiency is different than if you are productizing code.  During development, it is OK to burn CPU cycles on a souped-up development machine, if it shortens development turnaround time.


[^yagni]: You Aren't Going to Need It.

## HTML Code
This code runs the replacer on a line of back-quoted text, then re-runs the output through the vanilla Scheme grammar as a regression test.  The vanilla grammar does not support back-quotes.  The vanilla grammar will fail if any backquotes make it through this replacer pass.  If the replacer does it job correctly, then the resulting Scheme code will pass through the vanilla grammar successfully (this is what the regression test is supposed to look for).

The code for a proof-of-concept is...
```
<!DOCTYPE html>
<html>
  <head>
    <style>
      textarea {
      }
    </style>
  </head>
  <body>

    <h1>Backquote Replacer For Nils Holm's Prolog Scheme App</h1>
    <br>
    <label for="src">source:</label>
    <textarea id="src" rows="2" cols="60" placeholder="src" style="background-color:oldlace;">
                    (append (cdr a) `(r! ,l) (cdr g))
    </textarea>
    <br>
    <label for="output">output:</label>
    <textarea id="output" rows="2" cols="60" placeholder="transpiled"  readonly style="background-color:whitesmoke;">
    </textarea>
    <br>
    <br>
    <label for="regression">regression:</label>
    <textarea id="regression" rows="2" cols="60" placeholder="transpiled"  readonly style="background-color:whitesmoke;">
    </textarea>
    <br>
    <p id="status" > READY </p>

    <!-- Ohm-JS -->
    <script src="https://unpkg.com/ohm-js@16/dist/ohm.min.js"></script>


    <br>
    <button onclick="bqreplace ()">Replace Backquotes</button>
    <script>

      const grammars = ohm.grammars(String.raw`
scheme {
  Main = Sexpr+
  Sexpr =
    | QuotedSexpr -- quoted
    | List -- list
    | atom -- atom

atom =
  | string
  | number
  | "#f"
  | "#t"
  | symbol

List =
 | "(" Sexpr* "." Sexpr ")" -- dotted
 | "(" Sexpr* ")" -- plain

QuotedSexpr = sq Sexpr

string = dq (~dq any)* dq
number = digit+
ws = " " | "\n" | "\t"
separator = "(" | ")" | "," | bq | sq | ",@" | dq | ";" | "#" | "."
dq = "\""
sq = "'"
bq = "\x60"
symbol = symchar+
symchar = ~separator ~ws any
comment = ";" (~nl any)* nl
nl = "\n"
space += comment
}

bqscheme <: scheme {
  Sexpr += 
    | bq BQList -- bqlist
    //| bq atom -- bq YAGNI
    //| bq QuotedList -- YAGNI
  BQList =
   //| "(" BQSexpr* "." BQSexpr ")" -- dotted YAGNI
   | "(" BQitem* ")" -- plain
  BQitem =
    //| ",@" BQList -- bqconstsplice YAGNI
    //| ",@" Sexpr -- bqsplice YAGNI
    | "," Sexpr -- eval
    | Sexpr -- quoted
}

`);

      const hooks = {
	  
	  Main: function (Sexprs) {
	      return `${Sexprs.bq ().join ('\n')}`;
	  },
	  
	  atom: function (a) {
	      return `${a.bq ()}`;
	  },
	  
	  List_dotted: function (klp, Sexprs1, kdot, Sexpr2, krp) {
	      return `(${Sexprs1.bq ().join ('')} . ${Sexpr2.bq ()})`;
	  },
	  
	  List_plain: function (klp, Sexprs, krp) {
	      return `(${Sexprs.bq ().join ('')})`;
	  },
	  
	  QuotedSexpr: function (sq, Sexpr) {
	      return `'${Sexpr.bq ()}`;
	  },
	  
	  string: function (dq1, cs, dq2) {
	      return `"${cs.bq ().join ('')}"`;
	  },
	  
	  number: function (ds) {
	      return ds.bq ().join ('');
	  },
	  
	  ws: function (c) {
	      return c.bq ();
	  },
	  
	  separator: function (c) {
	      return c.bq ();
	  },
	  
	  dq: function (c) {
	      return c.bq ();
	  },
	  
	  sq: function (c) {
	      return c.bq ();
	  },
	  
	  bq: function (c) {
	      return c.bq ();
	  },
	  
	  symbol: function (symchars) {
	      return symchars.bq ().join ('') + ' ';
	  },
	  
	  symchar: function (c) {
	      return c.bq ();
	  },
	  
	  comment: function (ksemicolon, cs, nl) {
	      return `;${cs.bq ().join ('')}${nl.bq ()}`;
	  },
	  
	  nl: function (c) {
	      return c.bq ();
	  },
	  
	  space: function (c) {
	      return c.bq ();
	  },
	  
	  // bqscheme
	  Sexpr_bqlist: function (kbq, x) {
	      return `(list ${x.bq ()})`;
	  },
	  
	  BQList_plain: function (klp, Sexprs, krp) {
	      return `${Sexprs.bq ().join ('')}`;
	  },
	  
	  BQitem_eval: function (kcomma, Sexpr) {
	      return Sexpr.bq ();
	  },

	  BQitem_quoted: function (Sexpr) {
	      return "'" + Sexpr.bq ();
	  },

	  _terminal: function () { return this.sourceString; },
	  _iter: function (...children) {
	      var mapped = children.map(c => {
		  var r = c.bq ();
		  return r;
	      });
	      return mapped;
	  }
      };

      function bqreplace () {
	  let src = document.getElementById('src').value;
	  let grammar = grammars["bqscheme"]
	  let matchResult = grammar.match (src);
	  if (matchResult.succeeded ()) {
              document.getElementById('status').innerHTML = "OK";
              let sem = grammar.createSemantics ();
              sem.addOperation ('bq ()', hooks);
              let treeWalker = sem (matchResult);
              let text = treeWalker.bq ();
              document.getElementById('output').value = text;
	      {
		  let regression_src = document.getElementById ('output').value;
		  let regression_grammar = grammars["scheme"]
		  let regression_matchResult = regression_grammar.match (regression_src);
		  if (regression_matchResult.succeeded ()) {
		      document.getElementById('regression').innerHTML = "regression Test OK";
		  } else {
		      document.getElementById('regression').innerHTML = "regression Test FAILED";
		  }
	      }
	  } else {
              document.getElementById('output').value = grammar.trace (src);
              document.getElementById('status').innerHTML = "parse FAILED";
	  }
      }
    </script>
  </body>
</html>


```

