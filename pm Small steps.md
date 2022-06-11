- [ ] adding rewrite rules (semantics)
# Adding Rewrite Rules (Semantics)
... rewrite rules
```
  const rewriteRules = {
      main: function (_matched) {
	  var walked = _matched.walk ();
	  return `got /${walked}/`;
      },
      
      // required by Ohm-JS...
      _terminal: function () { return this.sourceString; },
      _iter: function (...children) {
	  var mapped = children.map(c => {
	      var r = c.walk ();
	      return r;
	  });
	  return mapped;
      }
  };

```

... change post-match code ...

```

  function baseline () {
      let src = document.getElementById('src').value;
      let matchResult = grammar.match (src);
      if (matchResult.succeeded ()) {
          document.getElementById('status').innerHTML = "OK";
          let sem = grammar.createSemantics ();
          sem.addOperation ('walk ()', rewriteRules);
          let treeWalker = sem (matchResult);
          let text = treeWalker.walk ();
          var s = text.toString ();
          document.getElementById('output').value = s;
      } else {
          document.getElementById('output').value = grammar.trace (src);
          document.getElementById('status').innerHTML = "parse FAILED";
      }
  }

```
![[pm/smallsteps/rewriting.png]]

![[pm/smallsteps/cstplusrewrite-Adding Rewrite.png]]
- [ ] re-ordering text
# Reordering
```
      main: function (_matched1, _matched2) {
	  var walked1 = _matched1.walk ();
	  var walked2 = _matched2.walk ();
	  return `reordered /${walked2}/ /${walked1}/`;
      },
```
![[pm/smallsteps/reordering.png]]
![[pm/smallsteps/cstplusrewrite-Reordering.png]]
