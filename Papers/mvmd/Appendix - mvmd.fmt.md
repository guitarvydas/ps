```
Main [lb SyncBox rb] 
= {{ fmt.setIndent (0); }}
[[
import os
import glob
import re
import shutil

def mvmd (p1, p2):${fmt.ind ()}${fmt.lines (SyncBox)}${fmt.outd ()}
]]

SyncBox [Command] = [[${Command}]]
Rec [lb SyncBox rb] = [[${SyncBox}]]

Command_foreveryCommand [k1 k2 k3 k4 k5 Name k6 k7 SetSynonym @Rec]
= [[\nfor ${SetSynonym} in glob.glob (f'\{${Name}\}/*.md'):${fmt.ind ()}${fmt.lines (Rec)}${fmt.outd ()}]]

Command_stripCommand [k1 k2 k3 k4 k5 Synonym SetSynonym @Rec]
= [[
temp = os.path.basename (${Synonym})
match = re.match (r'(^[0-9-]+)(.*)', temp)
if match:
    ${SetSynonym} = match.group (2)${fmt.ind ()}${fmt.lines (Rec)}${fmt.outd ()}else:
    pass
]]

Command_copyCommand [k1 Synonym1 k2 todir k3 Synonym2 @Rec]
= [[\nshutil.copy (f'\{${Synonym1}\}', f'\{${todir}\}/\{${Synonym2}\}')${Rec}]]

Command_parameterSynonym [k1 Synonym k2 ParamName @Rec] = [[\n${Synonym} = ${ParamName}${Rec}]]

SetSynonym [k name] = [[${name}]]
GetSynonym [name] = [[${name}]]

name [nameFirst @nameRest] = [[${fmt.pythonify (nameFirst + nameRest)}]]
nameFirst [c] = [[${c}]]
nameRest [c] = [[${c}]]
nameLetter [c] = [[${c}]]
delimiter [c] = [[${c}]]
bracket [c] = [[${c}]]

ParamName_p1 [k] = [[p1]]
ParamName_p2 [k] = [[p2]]
```