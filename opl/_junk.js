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

