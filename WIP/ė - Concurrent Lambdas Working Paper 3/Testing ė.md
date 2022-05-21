Running *make* should execute 3 tests (read, write, top).  Identity grammars are regression-tested, too.

Messages are printed in full, including their tracer bullets.  In this test workbench. See [[Tracer Bullets ė]].

```
$ make
./identity.bash <routing.das >identity-routing.js
./identity.bash <handling.das >identity-handling.js
./identity.bash <routing.das >identity-routing.js
./identity.bash <handling.das >identity-handling.js
node test

read ...
r outputs (r::[o]char:a:(rw::[i]req:true:.))
r outputs (r::[o]char:b:(rw::[i]req:true:.))
r outputs (r::[o]char:c:(rw::[i]req:true:.))

write ...
xyz

top ...







a
T outputs (w->T::[o]char:a:(w->?::[o]char:a:(r->w::[i]char:a:(r->?::[o]char:a:(w->r::[i]req:true:(w->?::[o]request:true:(T->w::[i]filename:test.out:(.->undefined::[i]output filename:test.out:.))))))))



b
T outputs (w->T::[o]char:b:(w->?::[o]char:b:(r->w::[i]char:b:(r->?::[o]char:b:(w->r::[i]req:true:(w->?::[o]request:true:(r->w::[i]char:a:(r->?::[o]char:a:(w->r::[i]req:true:(w->?::[o]request:true:(T->w::[i]filename:test.out:(.->undefined::[i]output filename:test.out:.))))))))))))



c
T outputs (w->T::[o]char:c:(w->?::[o]char:c:(r->w::[i]char:c:(r->?::[o]char:c:(w->r::[i]req:true:(w->?::[o]request:true:(r->w::[i]char:b:(r->?::[o]char:b:(w->r::[i]req:true:(w->?::[o]request:true:(r->w::[i]char:a:(r->?::[o]char:a:(w->r::[i]req:true:(w->?::[o]request:true:(T->w::[i]filename:test.out:(.->undefined::[i]output filename:test.out:.))))))))))))))))





child T output length=0


top top ...
const handling = require('./handling');
const deliver = require('./containerDeliver');
const routing = require('./routing');
const runnable = require('./runnable');


const top = require('./top');
const read = require ('./read');
const write = require ('./write');

var signature = {
    name: "top",
    inputs: [
        { "name": "input filename", "structure": ["infname"] },
        { "name": "output filename", "structure": ["outfname"] }
    ],
    outputs: [
    ]
};
$ 

```

`Top` reads three (3) characters from `test1.txt` ("abc") and prints them out in full glory.

`TopTop` reads `test.txt` which happens to contain text that looks like part of a program.  See `test.js/testContainerContainer ()`.  The messages output by `write.js` aren't bubbled all the way to the top (no connection specified), so there is no "T outputs (...)" message when `TopTop` is tested.  Only the console.log(...) output appears on the screen, as output by `write.js`.  `Write.js`'s message `send()`s go off into the ether.