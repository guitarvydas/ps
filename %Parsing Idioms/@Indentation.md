## Indentation Based Grammars
The following is a fully-worked example of using Ohm-JS and accompanying JavaScript semantics code to convert markdown syntax to structured syntax (bracketed).

I believe that this same approach could be used to parse indentation-based languages, like Python.

### Github

`md` subdirectories in:

https://github.com/guitarvydas/ohm-idioms

This example includes
- a grammar
- test input
- a button that invokes the function `parse()`
- displays "OK" in the status section, if the input can be parsed using the grammar
	- displays "parse FAILED" if there is a parse error.

This example doesn't do much, but shows the basic scaffolding required to build a grammar in Ohm-JS.

Later, we will do more interesting things with the captured matches.

Load `md.html` into a browser.

[*To me, the HTML is secondary.  The main point of this example is to show how to call Ohm-JS on a grammar, before adding any semantics.  I grabbed the HTML code as boilerplate. I expect that the HTML code can be improved and changed.*]


### Raw Markdown Parser
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

<h1>Markdown Parser Workbench</h1>

<p>markdown grammar:</p>
<textarea id="grammar" rows="15" cols="90" placeholder="grammar" style="background-color:oldlace">
MarkDown {

main = line+
line = indent? spc? toEOL+ linetail
linetail =   newline toIndent* -- withContent
           | newline? end -- withoutContent
indent = indentChar+
indentChar = ("#" | "*")
toIndent = ~indentChar any
toEOL = ~newline any

newline = "\n"
spc = " "
}
</textarea>

<p>source:</p>
<textarea id="source" rows="10" cols="90" placeholder="notation test" style="background-color:oldlace;">
# a b 
## c d
## e f
</textarea>


<p id="status" >READY</p>


<br>
<button onclick="parse ()">Parse</button>
<script src="https://unpkg.com/ohm-js@16/dist/ohm.min.js"></script>
<script>

  function parse () {
      let grammarText = document.getElementById("grammar").value;
      let src = document.getElementById("source").value;
      let g = ohm.grammar (grammarText);
      let r = g.match (src);
      if (r.succeeded ()) {
          document.getElementById("status").innerHTML = "OK";
      } else {
          document.getElementById("status").innerHTML = "parse FAILED";
      }
  }
  
  </script>
</body>
</html>
```

### Markdown Parser With Simple Identity Semantics

The goal of an identity parse is to create output that is the same as the input.  This checks for "typo" errors and tests that the scaffolding is working.

Once a successful identity parser plus semantics has been created, we can go to town and hack on the semantic hooks to get whatever result we desire. In fact, using Ohm-JS's `addOperation()` call, we can create more than one result based on the same parse.  Each different operation would have a different name and a different set of hooks.

## Markdown To Braces
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

    <h1>Markdown Parser and Identity Semantics Workbench 2</h1>

    <p>markdown grammar:</p>
    <textarea id="grammar" rows="15" cols="90" placeholder="grammar" style="background-color:oldlace">
MarkDown {
main = toIndent* lines
lines = indent? spc? toEOL+ linetail lines?
linetail = | newline toIndent* -- withContent
| newline? end -- withoutContent
indent = indentChar+
indentChar = ("#" | "*")
toIndent = ~indentChar any
toEOL = ~newline any

newline = "\n"
spc = " "
}
    </textarea>

    <p>source:</p>
    <textarea id="source" rows="7" cols="90" placeholder="notation test" style="background-color:oldlace;">
a b
# c d
Line 1 for C D
Line 2 for C D
## e f
Line 3 for E F
Line 4 for E F
## g h
Line 5 for G H
Line 6 for G H
# i j
Line 7 for I J
Line 8 for I J
k l
    </textarea>
    <p>output:</p>
    <textarea id="output" rows="7" cols="90" placeholder="identity output" style="background-color:oldlace;">
    </textarea>


    <p id="status" >READY</p>


    <br>
    <button onclick="identity ()">Generate Identity</button>
    <script src="https://unpkg.com/ohm-js@16/dist/ohm.min.js"></script>
    <script>
      
      function findInNamespace (ns, name) {
          return ns [name];
      }
      
      function arrayShallowCopy (a) {
          return [...a];
      }
      
      function getValue (stack, fieldname, defaultValue) {
          let stk = arrayShallowCopy (stack);
          return agetValue (stk, fieldname, defaultValue) ();
      }
      
      function agetValue (stk, fieldname, defaultValue) {
          if (0 >= stk.length) {
              if (defaultValue === undefined) {
                  throw `value not found ${fieldname}`;
              } else {
                  return function () { return defaultValue; };
              }
          } else {
              let firstns = stk.pop ();
              let v = findInNamespace (firstns, fieldname);
              if (undefined !== v) {
                  return v;
              } else {
                  return agetValue (stk, fieldname, defaultValue);
              }
          }
      }
      
      function sequence (namespaceArray) {
          return namespaceArray;
      }
      
      function opt (ohmNode, op, pdepth) {
          // maybe zero (0) matches
          if (ohmNode.numChildren > 0) {
              return ohmNode [op] (pdepth);
          } else {
              return [{}];
          }
      }
      
      function kleeneStar (ohmNode, op, pdepth) {
          // maybe zero (0) matches
          if (ohmNode.numChildren > 0) {
              return ohmNode [op] (pdepth);
          } else {
              return [{}];
          }
      }

      function kleenePlus (ohmNode, op, pdepth) {
          // always > 0 matches
          return ohmNode [op] (pdepth);
      }

      function flatten (a) { return a.flat (1000); }

      function asText (cstNode) {
          return cstNode.sourceString;
      }
      
      let identity_hooks = {
          // bits of action code ("semantics") to hang off
          // like Christmas tree ornaments from the main parse
          // tree (an AST which becomes a CST when applied
          //  to actual input text).
          // In this case, we just want to perform an identity
          // transform - output == input, to check that
          // all of the underlying details have no typos in
          // them...

          // main = lines
          main: function (p_front, p_lines) {
              let pdepth = this.args.pdepth
              if (p_front.numChildren > 0) {
		  front_text = asText (p_front) + "{";
		  back_text = "}";
              } else {
		  front_text = "";
		  back_text = "";
	      }
              let front = kleeneStar (p_front, 'identity', pdepth);
              let stack = kleenePlus (p_lines, 'identity', pdepth);
              let openCount = getValue (stack, 'openCount');
              let lineText = getValue (stack, 'lineText', "");
              while (openCount !== 0) {
                  if (openCount > 0) {
                      lineText = lineText + "}";
                      openCount -= 1;
                  } else if (openCount < 0) { // can this ever happen?
                      lineText = "{" + lineText;
                      openCount += 1;
                  }
              }
              return [{lineText: 
                       function () { 
                           return front_text + lineText + back_text; 
                       }, 
                       depthChange: 
                       function () {
                           return 0;
                       }
                      }
                     ];
          },
          // lines = indent? spc? toEOL+ linetail lines?
          lines: function (p_indent, p_spc, p_toEOL, p_linetail, p_continuation) {
              let pdepth = this.args.pdepth;
              let indent = opt (p_indent, 'identity', 'dontcare');
              let depth = getValue (indent, 'depth', 0);
              if (pdepth === 'initially') {
                  pdepth = depth;
              }
              let spc = opt (p_spc, 'identity', pdepth);
              let toEOL = kleeneStar (p_toEOL, 'identity', pdepth);
              let linetail = p_linetail.identity (depth);
              let cont = p_continuation.identity (depth);

              // handle lines with no #s as prevdepth + 1
              if (pdepth !== 'initially' && depth === 0) {
                  depth = pdepth + 1;
              }

              let lineText = asText (p_spc) + asText (p_toEOL) + 
		  asText (p_linetail);

              let contText = getValue (cont, 'lineText', "");
              let openCount = getValue (cont, 'openCount', 0);

              let diff = pdepth - depth;
              if (0 !== diff) {
                  while (0 !== diff) {
                      console.log (`${pdepth} ${depth} ${diff}`);
                      if (diff < 0) {
                          lineText = "{" + lineText + contText;
                          openCount += 1;
                          diff += 1;
                      } else if (diff > 0) {
                          lineText = "}" + lineText + contText;
                          openCount -= 1;
                          diff -= 1;
                      }
                  }
              } else {
                  lineText = lineText + contText;
              }

              let ns = {
		  lineText:
		  function () {
		      return lineText;
                  }, 
		  openCount: function () {
		      return openCount;
		  }
	      };

              return [ns];
          },
          // linetail =   newline toIndent* -- withContent
          // | newline? end -- withoutContent
          linetail_withContent: function (p_newline, p_toIndent) {
              let pdepth = this.args.pdepth;
              let newline = p_newline.identity (pdepth);
              let toIndent = kleeneStar (p_toIndent, 'identity', pdepth);
              return sequence ([newline, toIndent]);
          },
          linetail_withoutContent: function (p_newline, p_end) {
              let pdepth = this.args.pdepth;
              let newline = opt (p_newline, 'identity', pdepth);
              let end = p_end.identity (pdepth);
              return sequence ([newline, end]);
          },

          // indent = indentChar+
          indent: function (p_indentChar) {
              let pdepth = this.args.pdepth;
              let stack = kleeneStar (p_indentChar, 'identity', pdepth);
              stack.push ({ depth: 
			    function () {
				return p_indentChar.numChildren; 
			    }
			  });
              return stack;
          },
          
          // indentChar = ("#" | "*")
          indentChar: function (p_c) {
              let pdepth = this.args.pdepth;
              let stack = p_c.identity (pdepth);
              return stack;
          },
          // toIndent = ~indentChar any
          toIndent: function (p_c) {
              let pdepth = this.args.pdepth;
              let stack = p_c.identity (pdepth);
              return stack;
          },
          // toEOL = ~newline any
          toEOL: function (p_c) {
              let pdepth = this.args.pdepth;
              let stack = p_c.identity (pdepth);
              return stack;
          },
          // newline = "\n"
          newline: function (p_c) {
              let pdepth = this.args.pdepth;
              let stack = p_c.identity (pdepth);
              return stack;
          },
          // spc = " "
          spc: function (p_c) {
              let pdepth = this.args.pdepth;
              let stack = p_c.identity (pdepth);
              return stack;
          },
          _terminal: function () {
              let pdepth = this.args.pdepth;
              return {text: this.sourceString};
          },
          _iter: function (...children) { 
              let pdepth = this.args.pdepth;
              let stk =  flatten (children.map(c => c.identity (pdepth))); 
              return stk;
          }
      };
      
      function parse () {
          let grammarText = document.getElementById("grammar").value;
          let src = document.getElementById("source").value;
          let g = ohm.grammar (grammarText);
          let matchResult = g.match (src);
          if (matchResult.succeeded ()) {
              document.getElementById("status").innerHTML = "OK";
              let s = g.createSemantics ();
              return [matchResult, s];
          } else {
              document.getElementById("status").innerHTML = "parse FAILED";
              let dontcare = null;
              return [ matchResult, dontcare ];
          }
      }

      function identity () {
          var [cst, treeMap] = parse ();      
          if (cst.succeeded ()) {
              treeMap.addOperation ('identity(pdepth)', identity_hooks);
              let treeWalker = treeMap (cst);
              // let transpiled = treeWalker ['identity'] ();
              let stack = treeWalker.identity ('initially');
              let text = getValue (stack, 'lineText', "");
              document.getElementById ('output').innerHTML = text;
          } else {
              document.getElementById ('output').innerHTML = 'FAILED';
          }
      }

    </script>
  </body>
</html>
```