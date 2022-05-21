The simple diagram in this essay is expressed as the following text:

```
{ parameter <from> = $1
  { parameter <to> = $2
    { for every .md file in <from>/_posts => filename
      { strip date from front of filename => strippedFilename
        { copy filename to <to>/strippedFilename }
      }
    }
  }
}
```

It becomes quickly apparent that this text has lots of syntactic sugar in it.

For example, we might re-write the text as:

```
parameter <from> = $1
  parameter <to> = $2
    for every .md file in <from>/_posts => filename
      strip date from front of filename => strippedFilename
        copy filename to <to>/strippedFilename
```

The question, then, arises

> Why Bother?

The point of this essay is to propose a new syntax for programming consisting of diagrams.

We don't care if the textual representation of the diagrams is pleasing to the human eye.

The important aspect to keep in mind, is appeasing existing software tools.

Most existing tools (e.g. compilers, Ohm, PEG, parser-generators, etc.) work on the basis of using text files composed of grids of non-overlapping characters (small, fixed-sized bitmaps, such as ASCII and Unicode).  

Technologies, such as Ohm (based on PEG) can pattern-match balanced brackets and tend to skip over whitespace.

These technologies are happy to process very regular, mundane, sequences of characters in the form of "free flowing" text.

Indentation-based text syntaxes, in languages like Python and Markdown, make compiler-compiler technologies[^ohn] less happy.

[^ohm]: Like Ohm, Ohm-JS, PEG, etc.

In conclusion, there seems to be no good reason to compress the textual format of DaS text code.

As is seen in this essay, Ohm-JS can happily process the above brace-bracketed syntax and produce code in lower-level languages, like Python.

I expect that conversion from diagram to DaS textual syntax is only a temporary measure. 
 I expect that transpilers, that convert diagrams directly to code and obviate the need to intermediate textual code, will appear and replace the need for intermediate textual programming languages.