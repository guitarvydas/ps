Title: PEG for Lisp  
Author:

 

Bryan Ford’s Thesis

http://pdos.csail.mit.edu/~baford/packrat/thesis

PEG is a breakthrough technology.


PEG Enables SCLs.

SCL means Solution Centric Language.

SCL is like DSL (but more focussed).

We can use many SCLs for one project.

Top Down Parsing - Recursive Descent

Familiar to anyone using a recursive language.

Until Ford’s thesis, TDPL was either hand-built or used in lesser-known tools, such as S/SL,TXL, etc.



* DSLs used to be hard to design
* DSLs are a “whole language” unto themselves
* Needed to budget enormous amounts of time for DSL Development
* Can’t hire replaceable programmers for DSL languages
* Need to invest time learning DSL

	




* What is a “good assembler”?
    * Lisp
    * JavaScript

* A good base language (nice to have):
    * does not need declaration-before-use
    * First-class functions
    * Closures
    * Little syntactic sugar
    * Dynamic typing

	

PEGs can parse languages that REGEXPs can’t parse

PEGs use a stack → parsing subroutines


PEGs define a parser in “top down” manner

YACC (LR) defines a language in “bottom up” manner

LR can be more rigorous but, also, harder to use

 PEG (and Recursive Descent) can parse matching parentheses, YACC cannot

PEG does (some) backtracking, resulting in “more natural” feeling for programmers  (PROLOG & TXL do full backtracking, more than PEG).

PEG (packrat) memoizes some sequences, making backtracking tractable.


PEG (TDPL) makes it possible to easily preserve spaces.

YACC does not preserve spaces (easily).

Unity Grammar === first step towards cheap and dirty transpilers

E.g. HTML → HTML+


Source-to-source translation

Easy with PEG

Hard with YACC

example: markdown is a transpiler, e.g. .md syntax → HTML

example: Shopify’s Liquid is a transpiler, e.g. HTML+restricted syntax {{ … }} → HTML+JavaScript


(see section 2.3.1 of thesis)

| Empty String | '' |
| :----- | :----- |
| Terminal (fancy word for character) | 'a' |
| Non-Terminal (fancy word for a rule) | rule |
| Sequence | e1 e2 e3 ... |
| Choice | e1 / e2 / e3 / ... |
| 0 or more | e* |
| 1 or more | e+ |
| Optional | e? |
| Followed-by | &e |
| Not followed-by | !e |



E.g. trivial arithmetic expressions

E ← N  /  ‘(‘ E ‘+’ E ‘)’  /  ‘(‘ E ‘)-’ E ‘)’
N ← D N / D
D ← ‘0’ / … / ‘9’

(note parsing of nested, matched, parentheses ‘(‘ … ‘)’



| REGEXP | PEG |
| :----- | :----- |
| /a/ | OneA = "a" |



JavaScript
const text = "a";
const re = /a/;

function main () {
    if (re.test (text)) {
		console.log ('Success');
    } else {
		console.log ('Failure');
    }
}
main ();


Common Lisp (ESRAP)

(defparameter text1 "a")

(defun example1-esrap ()
  (esrap:defrule oneA #\a (:lambda (x) x))
  (esrap:parse 'oneA text1))



Ohm-JS
const text = "a";

const example1_grammar = '
Example1 {
  OneA = "a"
}';

const ohm = require ('ohm-js');
const ohmParser = ohm.grammar (example1_grammar);
const result = ohmParser.match (text);

if (result.succeeded ()) {
    console.log ("Success");
} else {
    console.log ("Failure");
}



| REGEXP | PEG (Ohm-JS) |
| :----- | :----- |
| /ab/ | OneAThenOneB = OneA OneB   OneA = "a"   OneB = "b"  |



JavaScript

const text = "ab";
const re = /ab/;

function main () {
    if (re.test (text)) {
	console.log ('Success');
    } else {
	console.log ('Failure'ß);
    }
}
main ();


Common Lisp (ESRAP)

(defparameter text2 "ab")

(defun example2-esrap ()
  (esrap:defrule oneA #\a (:lambda (x) x))
  (esrap:defrule oneB #\b (:lambda (x) x))
  (esrap:defrule oneAThenOneB (and oneA oneB) (:lambda (x) x))
  (esrap:parse 'oneAThenOneB text2))



Ohm-JS
const text = "ab";

const example2_grammar = `
Example2 {
  OneAThenOneB = OneA OneB
  OneA = "a"
  OneB = "b"
}`;

const ohm = require ('ohm-js');
const ohmParser = ohm.grammar (example2_grammar);
const result = ohmParser.match (text);

if (result.succeeded ()) {
    console.log ("Ohm matching succeeded");
} else {
    console.log ("Ohm matching failed");
}



| REGEXP | PEG (Ohm-JS) |
| :----- | :----- |
| /(a)(b)/ | OneAThenOneB = OneA OneB   OneA = "a"   OneB = "b"  |



JavaScript

const text = "ab";
const re = /(a)(b)/;

function main () {
    var matchArray = text.match (re);
    if (matchArray) {
	var first = matchArray[1];
	var second = matchArray[2];
	console.log (`(javascript) flipped is "${second}${first}"`);
    } else {
	console.log (`pattern failed`);
    }
}
main ();


Common Lisp (ESRAP)

(defparameter text "ab")

(defun example3-esrap ()
  (esrap:defrule oneA #\a (:lambda (x) x))
  (esrap:defrule oneB #\b (:lambda (x) x))
  (esrap:defrule oneAThenOneBAndFlip (and oneA oneB) 
     (:destructure (a b) (list b a)))
  (esrap:parse 'oneAThenOneBAndFlip text))
  



Ohm-JS
const text = "ab";

const example1_grammar = '
Example1 {
  OneAThenOneB = OneA OneB
  OneA = "a"
  OneB = "b"
}';

const ohm = require ('ohm-js');
const ohmParser = ohm.grammar (example1_grammar);
const result = ohmParser.match (text);

if (result.succeeded ()) {
    var semantics = ohmParser.createSemantics ();
    semantics.addOperation (
	'flip',
	{
	    OneAThenOneB: function (a, b) { 
		return `${b.flip ()}${a.flip ()}`;
	    },
	    OneA: function (a) { return a.flip (); },
	    OneB: function (b) { return b.flip ();},
	      _terminal: function() { return this.primitiveValue; }
	}
    );
    console.log ("Ohm flipped : " + semantics (result).flip ());
} else {
    console.log ("Ohm matching failed");
}



(can't do this in REGEXP)

Common Lisp (ESRAP)


(defparameter svgRectString "
<svg width=\"800\" height=\"800\">
      <rect id=\"id0\" x=\"40\" y=\"120\" width=\"150\" height=\"60\"></rect>
      <rect id=\"id1\" x=\"40\" y=\"320\" width=\"150\" height=\"60\"></rect>
      <rect id=\"id2\" x=\"280\" y=\"120\" width=\"250\" height=\"130\"></rect>
      <rect id=\"id3\" x=\"650\" y=\"120\" width=\"150\" height=\"60\"></rect>
      <rect id=\"id4\" x=\"650\" y=\"270\" width=\"150\" height=\"60\"></rect>
      <rect id=\"id5\" x=\"650\" y=\"360\" width=\"150\" height=\"60\"></rect>
      <rect id=\"id6\" x=\"650\" y=\"440\" width=\"150\" height=\"60\"></rect>
</svg>
")

(defun example6-esrap ()
  (esrap:defrule SVGElement 
      (and (* ws) "<svg" (* ws) (* SVGAttribute) ">" (* ws) (+ SVGRect) "</svg>" (* ws))
    (:lambda (x)
      (format nil "svg: {~%~{~a~^,~% ~},~% contents :[~%~{~a~^,~%~}~%]~%}~%"
	      (fourth x) (seventh x))))
  (esrap:defrule SVGAttribute (or WidthAttribute HeightAttribute))
  (esrap:defrule WidthAttribute (and "width=" IntegerString)
    (:function second)
    (:lambda (n) (format nil "w: ~a" n)))
  (esrap:defrule HeightAttribute (and "height=" IntegerString)
    (:destructure (h n)
		  (declare (ignore h))
		  (format nil "h: ~a" n)))
  (esrap:defrule SVGRect 
      (and "<rect" (* ws) (+ RectContent) ">" (* ws) "</rect>" (* ws))
    (:function third)
    (:lambda (content) (format nil "{ kind: 'rect', ~{~a~^, ~} }"
			content)))
  (esrap:defrule RectContent (or IDattr Xattr Yattr WidthAttr HeightAttr) 
    (:lambda (x) x))
  (esrap:defrule IDattr (and "id=" (* ws) String) 
    (:function third) (:lambda (str) (format nil "id: '~a'" str)))
  (esrap:defrule Xattr (and "x=" (* ws) IntegerString) 
    (:function third) (:lambda (str) (format nil "x: ~a" str)))
  (esrap:defrule Yattr (and "y=" (* ws) IntegerString) 
    (:function third) (:lambda (str) (format nil "y: ~a" str)))
  (esrap:defrule WidthAttr (and "width=" (* ws) IntegerString) 
    (:function third) (:lambda (str) (format nil "w: ~a" str)))
  (esrap:defrule HeightAttr (and "height=" (* ws) IntegerString) 
    (:function third) (:lambda (str) (format nil "h: ~a" str)))
  (esrap:defrule IntegerString 
      (and "\"" (* (esrap:character-ranges (#\0 #\9))) "\"" (* ws))
    (:destructure (q1 digits q2 w)
		  (declare (ignore q1 q2 w))
		  (parse-integer (esrap:text digits))))
  (esrap:defrule String (and #\" (* NotQuote) #\" (* ws)) 
    (:function second)
    (:text t))
  (esrap:defrule ws (or #\Space #\Newline))
  (esrap:defrule NotQuote (and (esrap::! #\") esrap::character) 
    (:function second)
    (:text t))

  (esrap:parse 'SVGElement svgRectString))


Ohm-JS

const text = `
<svg width="800" height="800">
      <rect id="id0" x="40" y="120" width="150" height="60"></rect>
      <rect id="id1" x="40" y="320" width="150" height="60"></rect>
      <rect id="id2" x="280" y="120" width="250" height="130"></rect>
      <rect id="id3" x="650" y="120" width="150" height="60"></rect>
      <rect id="id4" x="650" y="270" width="150" height="60"></rect>
      <rect id="id5" x="650" y="360" width="150" height="60"></rect>
      <rect id="id6" x="650" y="440" width="150" height="60"></rect>
</svg>
`;


const example6_grammar = `
Example1 {
  SVGElement = "<svg" SVGAttribute* ">" SVGRect+ "</svg>"
  SVGAttribute = WidthAttribute | HeightAttribute
  SVGRect = "<rect" RectContent+ ">" "</rect>"
  RectContent = IDAttribute | XAttribute | YAttribute | WidthAttribute | HeightAttribute

  IDAttribute = "id=" string
  XAttribute = "x=" integerString
  YAttribute = "y=" integerString
  WidthAttribute = "width=" integerString
  HeightAttribute = "height=" integerString

  string = "\\"" notDQuote* "\\""
  notDQuote = ~"\\"" any
  integerString = "\\"" integerDigit+ "\\""
  integerDigit = "0" .. "9"
}`;

const ohm = require ('ohm-js');
const ohmParser = ohm.grammar (example6_grammar);
const result = ohmParser.match (text);

if (result.succeeded ()) {
    var semantics = ohmParser.createSemantics ();
    addExample6 (semantics);
    addJSON6 (semantics);
    console.log ('example6 ohm:');
    console.log (semantics (result).example6 ());
    console.log ('example6 ohm JSON:');
    console.log (semantics (result).JSON6 ());
} else {
    console.log ("Ohm matching failed");
}

function addExample6 (semantics) {
    semantics.addOperation (
	'example6',
	{
	    SVGElement: function (_svg, attrs, _gt, rects, _end) {
		return "<svg" + attrs.example6 ().join ('') + ">\n" + rects.example6 ().join ('\n') + "\n</svg>"; },
	    SVGAttribute: function (attribute) { return attribute.example6 (); },
	    SVGRect: function (_rect, contents, _gt, _end) {
		return "<rect" + contents.example6 ().join ('') + ">" + "</rect>";},
	    RectContent: function (attribute) { return attribute.example6 (); },
	    IDAttribute: function (_id, str) {return "id=" + str.example6 (); },
	    XAttribute: function (_x, n) { return "x=" + n.example6 (); },
	    YAttribute: function (_y, n) { return "y=" + n.example6 (); },
	    WidthAttribute: function (_w, n) { return "width="+ n.example6 (); },
	    HeightAttribute: function (_h, n) { return "height=" + n.example6 (); },
	    string: function (_q1, characters, _q2) { return '"' + characters.example6 ().join('') + '"'; },
	    notDQuote: function (c) { return c.example6 (); },
	    integerString: function (_q1, digits, _q2) { return '"' + digits.example6 ().join('') + '"'; },
	    integerDigit: function (d) { return d.example6 (); },
	    _terminal: function() { return this.primitiveValue; }
	}
    );
}

function addJSON6 (semantics) {
    semantics.addOperation (
	'JSON6',
	{
	    SVGElement: function (_svg, attrs, _gt, rects, _end) {
		return "svg {\n" + attrs.JSON6 ().join (',\n') + ",\ncontents: [\n  " + rects.JSON6 ().join (',\n  ') + "\n]}"; },
	    SVGAttribute: function (attribute) { return attribute.JSON6 (); },
	    SVGRect: function (_rect, contents, _gt, _end) {
		return "{ kind: 'rect', " + contents.JSON6 ().join (', ') + " }";},
	    RectContent: function (attribute) { return attribute.JSON6 (); },
	    IDAttribute: function (_id, str) {return "id: " + str.JSON6 (); },
	    XAttribute: function (_x, n) { return "x: " + n.JSON6 (); },
	    YAttribute: function (_y, n) { return "y: " + n.JSON6 (); },
	    WidthAttribute: function (_w, n) { return "w: "+ n.JSON6 (); },
	    HeightAttribute: function (_h, n) { return "h: " + n.JSON6 (); },
	    string: function (_q1, characters, _q2) { return "'" + characters.JSON6 ().join('') + "'"; },
	    notDQuote: function (c) { return c.JSON6 (); },
	    integerString: function (_q1, digits, _q2) { return digits.JSON6 ().join(''); },
	    integerDigit: function (d) { return d.JSON6 (); },
	    _terminal: function() { return this.primitiveValue; }
	}
    );
}
