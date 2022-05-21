| Ohm pattern | JS function parameter | transpiled to |
| ------------- | ----------------------- | ------------- |
| z? | p_z | var z = opt (p_z.*op*); |
| z* | p_z | var z = ks (p_z.*op*); |
| z+ | p_z | var z = kp (p_z.*op*); |
| z  | p_z | var z = p_z.*op*; |

("opt" means "optional", "ks" means "Kleene Star", "kp" means "Kleene Plus")

Opt(), ks(), kp() return *functions* which take 1 arg - a field accessor.

`Opt(z) -> f` can be applied, say, to `length()`.  If match was found, then the result is the length of the thing contained in `z`, but if there was no match, the application does not fail and returns null.

## Example
Ohm rule:

```
line = indent? spc? toEOL+ linetail
```

transpiles to JS semantics:
```
    line: function (p_indent, p_spc, p_toEOL, p_linetail) {
        let indent = opt (p_indent.identity ());
        let spc = opt (p_spc.identity ());
        let toEOL = kp (p_toEOL.identity ());
        let linetail = verbatim (p_linetail.identity ());
        ... indent (len) ...
        ... spc (f1) ...
        ... toEOL (f3) ...
        ... linetail (f4) ...
        ...
    },
```

`_indent` is implemented as a JS array `[]`, and `opt()` untangles it

## Example
```
var semantics_hooks = {
    ...,
    line: function (p_indent, p_spc, p_toEOL, p_linetail) {
        let indent = opt (p_indent.identity ());
        let spc = opt (p_spc.identity ());
        let toEOL = kp (p_toEOL.identity ());
        let linetail = verbatim (p_linetail.identity ());
        ... indent (length) ...
        ... spc (f1) ...
        ... toEOL (f3) ...
        ... linetail (f4) ...
        ...
    },
    ...
}


function opt (x) {
    if (x.length > 0) {
        return function (f) { return f (x[0]); };
    } else {
        return null;
    }
}

function ks (x) {
    if (x.length > 0) {
        return function (f) { return f (x); };
    } else {
        return null;
    }
}

function kp (x) {
    if (x.length > 0) {
        return ks (x);
    } else {
        throw 'panic'; // + should never return 0-length match
    }
}
```

[N.B. Human-readability doesn't matter in the above.  We want machine-readability for easy transpilation.  We want repetitiveness, normalization.  Machines can do rote work and don't care about noise.  We only want human-readability (just a bare minimum of human readability) during bootstrapping and debugging.]

Funnel delegation, layering, specializing, narrowing, filtering, sifting, dribbling, seeping, screening, refining, clarifying (like clarified butter)