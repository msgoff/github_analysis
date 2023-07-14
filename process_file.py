import io
import mmap
from sys import argv
import re
import pandas as pd
from time import sleep
with open(argv[1],'r+') as f:
    buf = mmap.mmap(f.fileno(),0)

with open('/dev/shm/pairs','r') as f:
    pairs = f.readlines()
results = []
for line in pairs:
    resp = re.split(',|:',line)
    keys = resp[0::3]
    stop = resp[4::3]
    start = resp[2::3]
    dct = {}
    for ix,tpl in enumerate(list(zip(start,stop))):
        
        seek_to = tpl[0]
        b= int(tpl[1])-int(tpl[0])
        buf.seek(int(seek_to))
        asdf = buf.read(b-1)
        dct[keys[ix]] = asdf.decode()
        #print(dct)
        #sleep(2)
    results.append(dct)

pd.set_option('display.max_columns',100)
df = pd.DataFrame(results)
df.fillna('',inplace=True)
df.to_csv('test.csv')
print(df.head())
print(len(df))
buf.close()
