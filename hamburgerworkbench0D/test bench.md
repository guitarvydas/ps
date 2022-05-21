test bench
- container
- component: HTML button
- component: phrase faker
- component: order taker
- input ports: *none*
- output port: food order
- connection: HTML button / click -> phrase faker / go
- net: net1
- connection: phrase faker / short phrase ->(net1)-> order taker / phrase
- connection: phrase faker / long phrase ->(net1)-> order taker / phrase
- connection: order taker / food order -> / food order

order taker
- container
- component: phrase parser
- input port: phrase
- output port: food order
- connection: /phrase -> phrase parser /phrase 
- connection: phrase parser /order no choices -> /food order
- connection: phrase parser /order with choices -> /food order

HTML button
- leaf (JavaScript)
- output port: click
- onclick handler
```
	me.send ("click", true);
	me.container.wakeup ();
```

Phrase  faker
- leaf (JavaScript)
- input port: go
- output port: short phrase
- output port: long phrase
- handler: go
```
me.send ("short phrase", true)
```

phrase  parser
- leaf (JavaScript)
- input port: phrase
- output port: order no choices
- output port: order with choices
- handler:  input  port
```
let obj = me.parse (message.data);
if (obj.short) {
    me.send ("order no choices", {})
} else if (obj.long) {
    me.send ("order with choices",  {condiments: obj.condiments, extras: obj.extras});
} else {
    // pass
}
```
