# The State Explosion Problem
A non-hierarchical, "flat", design results in too much non-elided detail.

Example: imagine a simple table lamp with 2 push-buttons 
1. power on/off
2. brightness dim/medium/high

## Example
### Lamp
![[state explosion-Lamp.png]]


### State Explosion

![[state explosion-State Explosion.png]]

The *state explosion* problem becomes more severe in more complicated software architectures.

### Layering - HSM - Hierarchical State Machine

![[state explosion-HSM - Hierarchical State Machine.png]]

Originally suggested by Harel in StateCharts paper.

Concurrency is moved to a separate notation. "Concurrency" is called "orthogonal states" in StateChart notation.

