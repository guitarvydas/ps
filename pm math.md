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

    <h1>Arithmetic</h1>

    This grammar was taken from https://github.com/harc/ohm/tree/master/examples/math.
    <br>
    <label for="src">source:</label>
    <textarea id="src" rows="1" cols="60" placeholder="src" style="background-color:oldlace;">(x+y)*7</textarea>
    <br>
    <label for="identity">identity:</label>
    <textarea id="identity" rows="1" cols="60" placeholder="transpiled"  readonly style="background-color:whitesmoke;">
    </textarea>
    <br>
    <label for="js">JavaScript:</label>
    <textarea id="js" rows="1" cols="60" placeholder="transpiled"  readonly style="background-color:whitesmoke;">
    </textarea>
    <br>
    <label for="py">Python:</label>
    <textarea id="py" rows="1" cols="60" placeholder="transpiled"  readonly style="background-color:whitesmoke;">
    </textarea>
    <br>
    <label for="c">C:</label>
    <textarea id="c" rows="1" cols="60" placeholder="transpiled"  readonly style="background-color:whitesmoke;">
    </textarea>
    <br>
    <label for="common lisp">Common Lisp:</label>
    <textarea id="cl" rows="1" cols="60" placeholder="transpiled"  readonly style="background-color:whitesmoke;">
    </textarea>
    <br>
    <label for="wasm">WASM:</label>
    <textarea id="wasm" rows="12" cols="60" placeholder="transpiled"  readonly style="background-color:whitesmoke;">
    </textarea>
    <br>
    <br>
    <p id="status" > READY </p>

    <!-- Ohm-JS -->
    <script src="https://unpkg.com/ohm-js@16/dist/ohm.min.js"></script>


    <br>
    <button onclick="transpile ()">Transpile</button>
    <script>

      const grammar = ohm.grammar(String.raw`
Arithmetic {
  /* taken from https://github.com/harc/ohm/tree/master/examples/math */
  Top = Exp

  Exp
    = AddExp

  AddExp
    = AddExp "+" MulExp  -- plus
    | AddExp "-" MulExp  -- minus
    | MulExp

  MulExp
    = MulExp "*" ExpExp  -- times
    | MulExp "/" ExpExp  -- divide
    | ExpExp

  ExpExp
    = PriExp "^" ExpExp  -- power
    | PriExp

  PriExp
    = "(" Exp ")"  -- paren
    | "+" PriExp   -- pos
    | "-" PriExp   -- neg
    | ident
    | number

  ident  (an identifier)
    = letter alnum*

  number  (a number)
    = digit* "." digit+  -- fract
    | digit+             -- whole
}
`);

      const hooks = {
	  Top: function (AddExp) {
	      return `${AddExp.i ()}`;
	  },
	  Exp: function (AddExp) {
	      return `${AddExp.i ()}`;
	  },
	  AddExp_plus: function (AddExp, kplus,MulExp) {
	      return `${AddExp.i ()}+${MulExp.i ()}`;
	  },
	  AddExp_minus: function (AddExp, kplus, MulExp) {
	      return `${AddExp.i ()}-${MulExp.i ()}`;
	  },
	  AddExp: function (MulExp) {
	      return `${MulExp.i ()}`;
	  },
	  
	  MulExp_times: function (MulExp, kstar, ExpExp) {
	      return `${MulExp.i ()}*${ExpExp.i ()}`;
	  },
	  MulExp_divide: function (MulExp, kslash, ExpExp) {
	      return `${MulExp.i ()}/${ExpExp.i ()}`;
	  },
	  MulExp: function (ExpExp) {
	      return `${ExpExp.i ()}`;
	  },
	  
	  ExpExp_power: function (PriExp, kcaret, ExpExp) {
	      return `${PriExp.i ()}^${ExpExp.i ()}`;
	  },
	  ExpExp: function (PriExp) {
	      return `${PriExp.i ()}`;
	  },
	  
	  PriExp_paren: function (klp, Exp, krp) {
	      return `(${Exp.i ()})`;
	  },
	  PriExp_pos: function (kplus, PriExp) {
	      return `+${PriExp.i ()}`;
	  },
	  PriExp_neg: function (kdash, PriExp) {
	      return `-${PriExp.i ()}`;
	  },
	  PriExp: function (x) {
	      return x.i ();
	  },
	  
	  ident: function (letter, alnum) {
	      return letter.i () + alnum.i ().join ('');
	  },
	  
	  number_fract: function (d1, kdot, d2) {
	      return d1.i ().join ('') + '.' + d2.i ().join ('');
	  },
	  number_whole: function (d1) {
	      return d1.i ().join ('');
	  },
	  
	  _terminal: function () { return this.sourceString; },
	  _iter: function (...children) {
	      var mapped = children.map(c => {
		  var r = c.i ();
		  return r;
	      });
	      return mapped;
	  }
      };

      const jshooks = {
	  Top: function (AddExp) {
	      return `console.log (${AddExp.i ()});`;
	  },
      };
      
      const pyhooks = {
	  Top: function (AddExp) {
	      return `print (${AddExp.i ()})`;
	  },
      };
      
      const chooks = {
	  Top: function (AddExp) {
	      return `printf ("%d\\n", ${AddExp.i ()})`;
	  },
      };

      const clhooks = {
	  Top: function (AddExp) {
	      return `(format *standard-output* "~a~%" ${AddExp.cl ()})`;
	  },
	  Exp: function (AddExp) {
	      return `${AddExp.cl ()}`;
	  },
	  AddExp_plus: function (AddExp, kplus, MulExp) {
	      return `(+ ${AddExp.cl ()} ${MulExp.cl ()})`;
	  },
	  AddExp_minus: function (AddExp, kplus, MulExp) {
	      return `(- ${AddExp.cl ()} ${MulExp.cl ()})`;
	  },
	  AddExp: function (MulExp) {
	      return `${MulExp.cl ()}`;
	  },
	  
	  MulExp_times: function (MulExp, kstar, ExpExp) {
	      return `(* ${MulExp.cl ()} ${ExpExp.cl ()})`;
	  },
	  MulExp_divide: function (MulExp, kslash, ExpExp) {
	      return `(/ ${MulExp.cl ()} ${ExpExp.cl ()})`;
	  },
	  MulExp: function (ExpExp) {
	      return `${ExpExp.cl ()}`;
	  },
	  
	  ExpExp_power: function (PriExp, kcaret, ExpExp) {
	      return `(expt ${PriExp.cl ()} ${ExpExp.cl ()})`;
	  },
	  ExpExp: function (PriExp) {
	      return `${PriExp.cl ()}`;
	  },
	  
	  PriExp_paren: function (klp, Exp, krp) {
	      return `${Exp.cl ()}`;
	  },
	  PriExp_pos: function (kplus, PriExp) {
	      return `${PriExp.cl ()}`;
	  },
	  PriExp_neg: function (kdash, PriExp) {
	      return `-${PriExp.cl ()}`;
	  },
	  PriExp: function (x) {
	      return x.cl ();
	  },
	  
	  ident: function (letter, alnum) {
	      return `${letter.cl ()}${alnum.cl ().join ('')}`;
	  },
	  
	  number_fract: function (d1, kdot, d2) {
	      return `${d1.cl ().join ('')}.${d2.cl ().join ('')}`;
	  },
	  number_whole: function (d1) {
	      return `${d1.cl ().join ('')}`;
	  },
	  
	  _terminal: function () { return this.sourceString; },
	  _iter: function (...children) {
	      var mapped = children.map(c => {
		  var r = c.cl ();
		  return r;
	      });
	      return mapped;
	  }
      };

      const wasmhooks = {
	  Top: function (AddExp) {
	      var s = '(module\n';
	      s += ' (func $custom (param $x f64) (param $y f64) (result f64)\n';
	      s += `${AddExp.wasm ()})\n`;
	      s += `  (export "custom" (func $custom))
)
`;

	      return s;
	  },
	  Exp: function (AddExp) {
	      return `${AddExp.wasm ()}`;
	  },
	  AddExp_plus: function (AddExp, kplus, MulExp) {
	      return `${AddExp.wasm ()}\n${MulExp.wasm ()}\nf64.add\n`;
	  },
	  AddExp_minus: function (AddExp, kplus, MulExp) {
	      return `${AddExp.wasm ()}\n${MulExp.wasm ()}\nf64.sub\n`;
	  },
	  AddExp: function (MulExp) {
	      return `${MulExp.wasm ()}`;
	  },
	  
	  MulExp_times: function (MulExp, kstar, ExpExp) {
	      return `${MulExp.wasm ()}\n${ExpExp.wasm ()}\nf64.mul\n`;
	  },
	  MulExp_divide: function (MulExp, kslash, ExpExp) {
	      return `${MulExp.wasm ()}\n${ExpExp.wasm ()}\nf64.div\n`;
	  },
	  MulExp: function (ExpExp) {
	      return `${ExpExp.wasm ()}`;
	  },
	  
	  ExpExp_power: function (PriExp, kcaret, ExpExp) {
	      throw 'Exercise left to reader';
	  },
	  ExpExp: function (PriExp) {
	      return `${PriExp.wasm ()}`;
	  },
	  
	  PriExp_paren: function (klp, Exp, krp) {
	      return `${Exp.wasm ()}`;
	  },
	  PriExp_pos: function (kplus, PriExp) {
	      return `${PriExp.wasm ()}`;
	  },
	  PriExp_neg: function (kdash, PriExp) {
	      return `${PriExp.wasm ()}\\nf64.neg`;
	  },
	  PriExp: function (x) {
	      return x.wasm ();
	  },
	  
	  ident: function (letter, alnum) {
	      return `local.get \$${letter.wasm ()}${alnum.wasm ().join ('')}`;
	  },
	  
	  number_fract: function (d1, kdot, d2) {
	      return `f64.const ${d1.wasm ().join ('')}.${d2.wasm ().join ('')}`;
	  },
	  number_whole: function (d1) {
	      return `f64.const ${d1.wasm ().join ('')}`;
	  },
	  
	  _terminal: function () { return this.sourceString; },
	  _iter: function (...children) {
	      var mapped = children.map(c => {
		  var r = c.wasm ();
		  return r;
	      });
	      return mapped;
	  }
      };


      function transpile () {
	  let src = document.getElementById('src').value;
	  let matchResult = grammar.match (src);
	  if (matchResult.succeeded ()) {
              document.getElementById('status').innerHTML = "OK";
              let sem = grammar.createSemantics ();
              sem.addOperation ('i ()', hooks);
              sem.addOperation ('js ()', jshooks);
              sem.addOperation ('py ()', pyhooks);
              sem.addOperation ('c ()', chooks);
              sem.addOperation ('cl ()', clhooks);
              sem.addOperation ('wasm ()', wasmhooks);
              let treeWalker = sem (matchResult);
              let text = treeWalker.i ();
              document.getElementById('identity').value = text;
              let jstext = treeWalker.js ();
              document.getElementById('js').value = jstext;
              let pytext = treeWalker.py ();
              document.getElementById('py').value = pytext;
              let ctext = treeWalker.c ();
              document.getElementById('c').value = ctext;
              let cltext = treeWalker.cl ();
              document.getElementById('cl').value = cltext;
              let wasmtext = treeWalker.wasm ();
              document.getElementById('wasm').value = wasmtext;
	  } else {
              document.getElementById('identity').value = grammar.trace (src);
              document.getElementById('status').innerHTML = "parse FAILED";
	  }
      }
    </script>
  </body>
</html>


```