

![[handling.png]]


The *handler* code is part of the Cos (component O/S) code.  

I've used diagrams to show the workings of this code as an example that this technique can be used for systems programming (i.e. writing low-level synchronous code).

I drew out the logic for the *handler* code as diagrams of nested boxes.

I, then, transpiled the diagram to `handling.das`.  The transpilation was done manually, to avoid excessive details in this example, and, to show the 1:1 correspondence of diagrams to `.das` code.

I used Ohm-JS to transpile `handling.das` into `handling.js`.  The transpiler is located in https://github.com/guitarvydas/duct, and invoked by `make handling.js`

The code for the transpiler (grammar plus re-format) are discussed in [[Transpiler DaS]]

# Appendix Handling.das
```
implementation deliverInputMessageToAllChildrenOfSelf (message)
      { find connection from me on port message.etag
        { lock connection
          { for every receivers in connection => dest
            { synonym params = {me, message, dest}
              { cond
                { dest.name is not me
                  { #deliver_input_from_container_input_to_child_input <= params }
                }
                { dest.name is me
                  { #deliver_input_from_container_input_to_me_output <= params }
                }
              }
            }
          }
        }
        { orelse
          { pass }
        }
      }
```