mkdir output
while read f;do grep -w $f "$1" >> output/out_"$1";done < people
