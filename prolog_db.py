from sys import argv
import re
f=open('prolog.pl','a+')
g=open(argv[1])
data=g.readlines()

for line in data:
	file_name=re.sub(r'_following|\.|/','',argv[1])
        line = line.replace('\n','')	
	f.write("following('{}','{}').".format(file_name,line))
	f.write('\n')
f.close()
