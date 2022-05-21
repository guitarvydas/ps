```

import os
import glob
import re
import shutil

def mvmd (p1, p2):    
    LTfromGT = p1
    LTtoGT = p2
    for filename in glob.glob (f'{LTfromGT}/*.md'):    
        temp = os.path.basename (filename)
        match = re.match (r'(^[0-9-]+)(.*)', temp)
        if match:
            strippedFilename = match.group (2)    
            shutil.copy (f'{filename}', f'{LTtoGT}/{strippedFilename}')
        else:
            pass
   

```