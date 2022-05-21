Example message printed with tracer bullets:

`r outputs (r::[o]char:a:(rw::[i]req:true:.))`

- messages and traces are enclosed in parentheses
- messages include previous messages recursively (tracer bullets)
- `r::[o]char:a:(...)`
	- this format means
		- component `r` created a message
		- `[o]` means that the message was an output message (`[i]` means input message)
		- `char` is the port *etag* (which is a string, a symbol, or a code of some sort), a *port* is specified by a 2-tuple `{component, etag}`
		- `a` is the actual value inside the message
			- usually referred to with `message.data` 
		- (...) is a recursive trace of messages that preceded this message
		- `.` means begining-of-time
		- full reading of the above:
			- `r` output the data `a` with *etag*  `char`
			- the message was caused by an input message sent in by `rw` on the *etag* `req` consisting of a *trigger* (`true`)
			- the message from `rw` was preceded by the *beginning of time*, in this case the kick-off message was sent by the test script.  testHarness.begin() called TopTopWrapper, which called top.js/begin which injected filenames into the system, kicking the whole chain of events off.  `Rw` means *read wrapper* which invoked the component-under-test `read.js` and jammed messages into `read.js` (`inject()`)
			- `r outputs ...` is printed when a message is sent to the top-level tester output (and is routed to the console instead of being routed to another component)
				- expect all messages printed with `? outputs ...` to be *output* messages


When actually debugging tracer bullets, I use a Lisp pretty-printer, since the nested tracer messages are wrapped in parentheses.  The structure of the message traces is more apparent when formatted.