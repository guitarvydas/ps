**Peephole Optimizer Using Ohm-JS**

Paul Tarvydas, July 8, 2022

---
Previous: [[2022-07-08-Using Ohm-JS Intro]]
youtube: [Ohm-JS for transpiling snippets of code](https://youtu.be/HDDQHW6mnvY)
https://youtu.be/HDDQHW6mnvY

---

Optimizer changes Javascript -> Javascript.

---
Match 
```
cache.at (num)
```
and optimize to 
```
cache[num]
```

---

Peephole Optimizer
- small grammar
- uses Ohm-JS features
	- lexical rules
	- syntactic rules
	- applySyntactic

---

- technique used in GCC (RTL)
	- [Fraser/Davidson](https://www.researchgate.net/publication/220404697_The_Design_and_Application_of_a_Retargetable_Peephole_Optimizer)
	- J. Cordy's [Orthogonal Code Generator](https://books.google.ca/books?id=X0OaMQEACAAJ&dq=bibliogroup:%22University+of+Toronto+Computer+Systems+Research+Institute+Technical+Report+CSRI%22&hl=en&sa=X&ved=2ahUKEwig1Legm8bqAhWvlHIEHYzzBYEQ6AEwBHoECAEQAQs) further generalizes the technique

[References](https://guitarvydas.github.io/2021/12/15/References.html)
https://guitarvydas.github.io/2021/12/15/References.html
"The Design and Application of a Retargetable Peephole Optimizer"
"An Orthogonal Model for Code Generation"

---
Peephole Optimizer Grammar
```
NLPeepholer {
top = peephole+
peephole =
  | applySyntactic<AtFunctionCall>
  | any
AtFunctionCall = "." "at" "(" Arg* ")"
Arg = 
  | "(" Arg* ")"  -- nested
  | ~"(" ~")" any -- basic
}

```
---
Peephole Optimizer Reformatter
```
top [@peephole] = ⟦⟦~{peephole}⟧⟧
peephole [x] = ⟦⟦~{x}⟧⟧
AtFunctionCall [kdot kat klp @Args krp] = ⟦⟦\[~{Args}\] ⟧⟧
Arg_nested [klp @Args krp] = ⟦⟦~{klp}~{Args}~{krp}⟧⟧
Arg_basic [c] = ⟦⟦~{c}⟧⟧
```

---
FMT Tool 
- evolving
- previously called Glue, Grasem

latest documentation: [PREP Tool (see the Glue Format section)](https://github.com/guitarvydas/prep)

earlier documentation: [Glue Tool](https://guitarvydas.github.io/assets/2021-04-11-Glue%20Tool/index.html)

---

# Appendix 
Github Code

[index4.html]((https://github.com/guitarvydas/nl/blob/main/index4.htm)
https://github.com/guitarvydas/nl/blob/main/index4.htm
