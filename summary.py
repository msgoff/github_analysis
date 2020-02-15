import pandas as pd 
from sys import argv
f = open(argv[1])
data = f.readlines()
f.close()
import re
import json
lst = []
from tqdm import tqdm
for ix in tqdm(range(len(data))):
    try:
        reps = re.findall('\.json:(clone.*)',data[ix])[0].replace('clone_url','"clone_url')
        reps = re.sub('"license.*','',reps)
        dct = {}
        for line in reps.split(','):
            line_split = line.split(':',1)
            if len(line_split) == 2:
                k,v = line_split
                k = k.strip()
                v =  v.strip()
                k = k.replace('"','')
                v = v.replace('"','')
                dct[k] = v
        lst.append(dct)
    except Exception as e:
        print(e)

df = pd.DataFrame(lst)
df.dropna(subset=['stargazers_count'],how='all',inplace=True)
df['stargazers_count'] = df['stargazers_count'].apply(int)
df = df.drop_duplicates(subset='clone_url')
df = df[df['stargazers_count']>5]
df.sort_values('stargazers_count',ascending=False,inplace=True)
df.to_csv('{}.csv'.format(argv[1]),index=False)
