a Phrase contains words separated by spaces
a Word contains Syllables separated by "-"
a Sign is: "[" (Word | WordSeparator)+ "]"

`sza nag-[ba lu-sze]-ed-di`

Phrase = Word WordSeparator Words
WordSeparator = " "
SyllableSeparator = "-"
Sign = "[" Phrase "]"
Word = 
  | Syllable "-" Word
  | Syllable
Syllable = letter+

```
ATF {
Phrase = Word (" " Word)*
SyllableSeparator = "-"
Word = Syllable ("-" Syllable)*
Syllable = 
  | ("[" Phrase "]") -- sign
  | letter+          -- letters
space := "\t" | "\n"
}
```