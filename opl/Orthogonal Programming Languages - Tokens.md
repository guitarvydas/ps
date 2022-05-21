"x" -> ContainerObject(char="x")
rule -> ContainerObject(*rule*)
rule+ -> ContainerObject(ContainerObject(*rule*), length = 1...)
rule* -> ContainerObject(ContainerObject(*rule*), length = 0...)
rule? -> ContainerObject(ContainerObject(*rule*), length = [0|1])
"A" .. "Z" -> ContainerObject(length = 1, char="??", range = ["A", "Z"]))

rule = A B C
-> ContainerObject(A, B, C)


| line | `[ [indent]? [spc]? [toEOL]+ linetail ] `|

(previousDepth)
depth = .indent.length
[
   | (depth == previousDepth) *
   | (depth < previousDepth) *
   | else                                  "{" * "}"
]
next (depth)

[...]? length -> if (self.length > 0) then child.length

.indent -> first ([indent]?)
| line | `[ [indent]? [spc]? [toEOL]+ linetail ] `|
            .1        .2     .3       .4
line: function (indent?, spc?, toEOL+, linetail) { ... }
indent. == first (indent)[0].
spc. == first (spc) [0].
toEOL. = all-of (toEOL).
linetail = linetail

| linetail_withContent | `[ newline [toIdent]* ] `|
linetail_withContent: function (newline, toIdent*) {
  newline == newline
  toIdent == (toIdent.length > 0) && all-of (toIdent)

line: function (_indent?, _spc?, _toEOL+, _linetail) { ... }
indent = opt (_indent)
spc = opt (_spc)
toEOL = kp (_toEOL)
linetail = _linetail

var semantics_hooks = {
    ...,
    line: function (_indent, _spc, _toEOL, _linetail) {
	indent = opt (_indent);
	spc = opt (_spc);
	toEOL = kp (_toEOL);
	linetail = _linetail;
	...
    },
    ...
}

  
