rm -rf x??
split 0 -n 100 
rm -rf *.csv
ls x??|tr ' ' '\n'|xargs -i echo "{}"|xargs -i -P24 python3 summary.py "{}" 
cat *.csv|sort|uniq >> ~/Desktop/master.csv
