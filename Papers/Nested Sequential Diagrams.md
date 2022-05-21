## Synopsis
This paper describes 
- a way to use `draw.io` to draw *DaS*[^das] diagrams
- then to transpile the *DaS* diagrams into a textual form (manually[^man])
- then to transpile the textual form of the diagrams to JavaScript.

[^das]: DaS means *Diagrams as Syntax*

The code generated in this way is used in the kernel of a concurrent operating system.

[^man]: I argue that it is important to understand how to do something manually before automating the process.  I describe how to create automatic transpilers (compilers) for diagrams, elsewhere.  This paper is about the process of converting diagrams to executable code.  If a process is sufficiently mundane (boring), then it can be automated more easily.  I hope to show that converting diagrams to text is mundane.

## Assembly Code For the Next Generation of Expression

> In a 'real' Computer Science, the best languages of an era should serve as 'assembly code' for the next generation of expression.

\-Alan Kay
~ 31:50 [https://www.youtube.com/watch?v=fhOHn9TClXY&t=859s](https://www.youtube.com/watch?v=fhOHn9TClXY&t=859s)[^ra]

[^ra]: Thanks to Rajiv Abraham for pointing this quote out to me.

## Diagram
### Find Connection
### Routing

![[routing.png]]

### Handling
![[handling.png]]
## DaS Code
### Find Connection
```
implementation find_connection (etag)
  { for every item in connections of me => connection
      { synonym sender = connection.sender
          { when all
              {
                  sender.name is me
                  sender.etag == etag
              }
              { -> connection }
          }
      }
  }


```
#### Find Connection in ME
```
implementation find_connection_in__me (childname, etag)
  { for every item in connections of me => connection
      { synonym sender = connection.sender
          { when all
              {
                  sender.name == childname
                  sender.etag == etag
              }
              { -> connection }
          }
      }
  }

```
### Routing
```
implementation route
{ for every item in children of me => child
  { for every item in outputQueue of child.runnable => output_message
    { synonym message = output_message
      { find connection in me given child X message.etag => connection
        { lock connection
          { for every receivers in connection => dest
              { synonym params = {me, dest, message}
                { cond
                  { dest.name is not me
                    { @deliver_to_child_input <= params }
                  }
                  { dest.name is me
                    { @deliver_to_me_output <= params }
                  }
                }
            }
          }
        }
        { orelse
           { pass }
        }
      }
    }
    {@child.runnable.resetOutputQueue}
  }
}

sync deliver_to_child_input <= me, dest, message
   // map message for receiver
  { var input_message <= $i{{dest.etag, message.data} message}
    { lookup dest.name => receiver
      { @receiver.enqueueInput <= input_message }
    }
  }

sync deliver_to_me_output <= me, dest, message
  // map message for output
  { var output_message <= $o{{dest.etag, message.data} message}
    { @me.enqueueOutput <= output_message }
  }

```
### Handling
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