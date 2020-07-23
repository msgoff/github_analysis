#!/bin/bash
echo arg1 year
echo arg2 month
year="$1"
month="$2"
num_of_days_in_month="$(cal -d "$year"-"$month"-01|tr ' ' '\n'|grep  '^[0-9]'|grep -v "$year"|wc -l)"


if [[ $month -lt 10 ]];
then
	url="http://data.githubarchive.org/$year-0$month-{01..$num_of_days_in_month}-{0..23}.json.gz"
else
	url="http://data.githubarchive.org/$year-$month-{01..$num_of_days_in_month}-{0..23}.json.gz"
fi


echo "$(eval echo $url )"|tr ' ' '\n'|xargs -i wget {}



