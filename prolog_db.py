from sys import argv
f=open('prolog.pl','w')
g=open(argv[1])
data=g.readlines()

for line in data:
	file_name=argv[1].replace('_following','')
 	line = line.replace('\n','')	
	print("following({},{}).".format(file_name,line))
