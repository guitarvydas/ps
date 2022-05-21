## Arithmetic Example for WASM Using Ohm-JS and Glue
Let's begin by [[looking]] at the code associated with the `AddExp` grammar rule, above.
```
  Exp [e] = [[${e}]]
```
- a rewrite rule, `[[${e}]]`.
```
 		var _result = `f64.const ${n}`;
```
more text

```
ident [l @a] = [[local.get \$${l}${a}]]
```
