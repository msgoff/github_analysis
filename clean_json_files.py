from tqdm import tqdm
import json
from os import listdir


q=open('summary','a+')
files=[f for f in listdir('.') if f[-4:]=='json']

for f in tqdm(files):

	data=open(f).readlines()
	

	for line in range(len(data)):
		dct=json.loads(data[line])
		write_line=(dct['id'],dct['actor']['login'],dct['type'],dct['created_at'])
		q.write(str(write_line))
    q.write('\n')
 
 
 q.close()
   
   
   
    
