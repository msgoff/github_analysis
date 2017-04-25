#set year 
year=2016
#you can change 12 to however many months you want out of the year
for month in {1..12};do
  

  num_of_days_in_month=$(

	cal -d $year-$month-01 | 
	          tr " "  '\n'|
	          grep -P '\d'|
		  tail -n 1
		
			)

echo $num_of_days_in_month



=====================================================================================================

#https://www.githubarchive.org/  
#wget http://data.githubarchive.org/2015-01-{01..30}-{0..23}.json.gz


url=http://data.githubarchive.org/$year-0$month-{01..$num_of_days_in_month}-{0..23}.json.gz
echo $url
wget $(eval echo $url)


=====================================================================================================



done
