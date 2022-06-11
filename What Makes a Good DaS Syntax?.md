[[Drawings Add Information to a Program]]

# Syntax For Synchronous Programs
## Nested Boxes
Rectangles within rectangles represent operations that are synchronous and "inherit" information from each preceding step.  

This arrangement is much like wrapping *lambda*s around blocks of code in textual languages.

At some point, the nesting becomes too deep to be visually useful.  At that point, an off-page-connector-like notation is needed.  In the example diagram below, I used squares to represent synchronous ports and dotted outlines to represent boxes that "are implemented elsewhere".  This particular drawing shows the main set of boxes plus the "implemented elsewhere" boxes ("deliver input from Container input to Child input" and "deliver input from Container input to me output").

![[hamburgerworkbenchD0D/handling.png]]
### Nested Diagram As Text
Note that the text form of the diagram is not meant for human consumption.

The only goal is machine-readability, esp. via Ohm-JS.

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
## Statecharts
Harel's paper [Statecharts](https://guitarvydas.github.io/2020/12/09/StateCharts.html) introduced a diagram syntax for nested state machines.

Harel's notation solved the "state explosion problem".

A simple diagram of a state machine is shown below...

![[app-state-diagram.png]]
The above diagram shows states as ellipses with solid outlines.

State names are preceded by one octothorpe `#`.

*Non-blocking states* are shown as ellipses with dotted outlines.

Local variables are shown in a rectangle with a dotted outline.

Transistions are shown as curved arrows.

Events that trigger transitions are prefixed by two octothorpes `##`.

Non-blocking conditionals are shown as hexagons with *true* and *false* branches.

Transition code is shown as text attached to a transition.  Transition code is executed only whan a transition is taken.

Entry and exit code for states was not needed for this diagram and is not shown.  I suggest that entry and exit code be included as part of the text contained in states, with prefix syntax like "entry: ..." and "exit: ...".

In cases where diagrams/code are meant to be included in certain states but would be visually disturbing, I've used a dotted, double line to show the inclusion.

Non-blocking transitions are shown as dotted arrows.
## Drakon Control Flow
The Drakon visual syntax is described in [drakon-editor](http://drakon-editor.sourceforge.net)

I drew a Drakon diagram using *draw.io*.  The drawing is seen below.

This diagram contains two constructs not specified by the Drakon synax:
- a comment box (a callout)
- numeric labels at the points where flows intersect skewers.

These minor additions made it easier to transpile the diagrams into textual form.

![[step.png]]
### Drakon Diagram As Text
```
flowchart Try-component {
  start main
  skewer main {
    unless has-children try-self/1
    memo-readiness-of-each-child
    step-each-child
    unless any-child-was-previously-ready try-self/2
    > activated/0
  }
  skewer try-self {
    : try-self/1
    : try-self/2
    unless self-has-input not-activated/3
    self-first-step-with-input
    > activated/0
  }
  skewer not-activated {
    : not-activated/3
    > finished/0
  }
  skewer activated {
    > finished/0
  }
  skewer finished {
    end
  }
}
```
# Syntax For Asynchronous Programs

## Components
In this form, rounded rectangle represent asynchronous components.

Sharp-edged, red rectangles represent synchronous snippets of code (in this case JavaScript).

Yellow circles represent async output ports.

Green circles represent async input ports.

Messages (data) flow from output port to input ports along arrows.  Message flow is uni-directional.

Output messages are queued (deferred send) and routed by parent Container components (in this example "Text Bench" and "Order Taker").

Each component has one input queue and all input messages are tagged and queued up in FIFO order.

Leaf components are shown with the colour *blue*.

Container components contain other components (Leaf or Container) and route messages between the contained components.

Further details (like fan-in, fan-out, Signatures, Implementations, etc., are discussed elsewhere).

![[testbench.png]]
## FBP
[FBP](http://www.jpaulmorrison.com/fbp/fbp2.htm) describes a notation plus visualization of asynchronous components similar to the above.
# Syntax That Doesn't Work
[[Diagram Syntax That Does Not Work]]
