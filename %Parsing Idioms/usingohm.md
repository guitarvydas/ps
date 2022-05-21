## Appendix - Using Ohm-JS

IMO, the best way to start with Ohm-JS is by using the Ohm Editor.

### My Ohm Workflow
IMO, the best way to develop a language is:
1. create the grammar with the Ohm-Editor
2. Test the grammar using the Ohm-Editor and various language snippets.
3. Write an identity transform (input->parser->output, same output as input).
4. Modify the identity transform to suit your needs.

### Sample Grammars
I modified the sample Ohm grammar (Arithmetic) to create transpilers for WASM, Python, JS and Lisp:

#### WASM
[WASM Prototype](https://guitarvydas.github.io/2021/05/15/WASM-Arithmetic-Transpiler.html)

#### Python
#### JavaScript
#### Common Lisp
[Python, JS, Lisp Prototypes](https://guitarvydas.github.io/2021/05/11/Ohm-Arithmetic.html)
