# machine foreach
## 
list files '/Users/tarvydas/temp/ps/@book-Hamburger Workbench - A Frivolous Introduction to Ohm-JS' ⇉ «files»

## **idle**
  ### *begin*
    go generating
## **generating**
    ? «files».empty next idle
    send subenv augment env with «files».pop
    send kick trigger
    next blocked
## **blocked**
   ### *resume*
    go generating
