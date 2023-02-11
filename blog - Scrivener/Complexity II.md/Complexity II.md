Title: Complexity II  
Author:

Q: Which is simpler, diagram A or 

![](ConCarCdr-flat.png)



diagram B?

![][ConCarCdr-closure.png]


Q: Which code is simpler?  Code C: 
function Cons(x,y) { 
    this.car = x; 
    this.cdr = y; 
};
function car(cell) {
    return cell.car;
};
function cdr(cell) {
    return cell.cdr;
};


or Code D? 
function Cons(x,y) {
    return function(placeholderFunction) {
	placeholderFunction(x,y);
    };
};
function car(cell) {
    return cell(
	function(x,y){
	    return x;
	}
    );
};
function cdr(cell) {
    return cell(
	function(x,y){
	    return y;
	}
    );
};



Simplicity can be defined as “lack of nuance”.


It is the Software Architect’s responsibility to make the design readable and understandable.

[ConCarCdr-flat]: ConCarCdr-flat.png

[ConCarCdr-closure]: ConCarCdr-closure.png