All variable names are enclosed in unicode brackets, e.g. `«files»`.

All accesses to attributes use `/`, e.g. `«files»/xyz`.

All predicate (methods that return a `yes / no` value) calls use `?`, e.g.  ``«files»?empty`.

All procedures (methods whose return value is ignored) calls use `!`, e.g. `«files»!push (Operand?)`. Procs can have exactly 1 or 0 arguments (S/SL and Currying in λ-calculus).  Multiple args can be formed using synchronous collections (below).


All impure function (methods which return exactly one Object and might have side-effects) calls use `@`, e.g. ``«files»@pop`

All pure function (methods which return exactly one Object and cannot have side-effects) calls use `/`, e.g. `«files»/first`.  Pure functions are indisitinguishable from attributes.

Verbatim code for another language is enclosed in (different) unicode brackets, e.g. `❮ ... ❯`.  Verbatim code is usually macro-expanded by a lower-level preprocessor.

Strings are enclosed in single-quotes, e.g. `'a b c'`.

Effective addresses are signified by `&`, e.g. `&«files»/xyz` or `&«files»@pop` (the first example is the effective address of an attribute, the second example is an unevaluated function (a predicate)).

A list of operands is enclosed in square brackets `[ ... ]`, with spaces (not commas) separating them.

An empty list is `[]`.

Valid operations on lists:
- `@pop`
- `!push (operand)` or `!proc ()`
- `?empty`
- `/first`
- `/rest`


A datum can be
- an Operand
- `{` Operand+ `}` -- synchronous collection, destructurable