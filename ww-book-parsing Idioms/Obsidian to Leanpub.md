see `obsidian2leanpub.drawio`

- all part headings in separate files
- all chapter headings in separate files
- all content in separate files
- all appendices in separate files, with separate headings, in separate part
- create book (book.md) that contains Obsidian links to all files in book \[\[ ...\]\]
	- one file per line in book.md
	- lines can have leading and trailing spaces
- copy `make.py` into top-level directory of Dropbox book directory
- edit pathnames in `make.py`
- run `python3 make.py` to copy and mangle all files into
	- manuscript
	- manuscript/resources
- leanpub.com >> authors >> books >> unpublished >> Versions >> Preview New Version >> Preview New Version >> Create Preview

## Done
- mv .png files to resources
- reformat Obisidan links to be references to md links
	- images `![The San Juan Mountains are beautiful!](resources/xxx.png)`
	- hashtags `[title](#tag)`

## Todo
- add 2 #s to each # in Obsidian file <-- no, needs more thought
- make list of needed refs
- check needed refs against final manuscript directory and flag missing refs
- make  list of needed refs unique