Curently, I use sledge-hammer approaches for isolating processes.

In JavaScript, this means something like 
```
require('child_process').execSync('rm -rf "/tmp/iwantahamburger/*");
```

Other languages (like Python) probably have similar break-outs.

[[Docker]] is another sledge-hammer approach.

Why do I do this?  See [[2022-05-27 Isolation]].