cat *following|sort |uniq > ALL
ls *following | cut -d "_" -f1  > existing
diff -i ALL existing | grep "<" |tr -d "< " > GET_NEW
while read f;do bash api_calls.sh $f following 1;bash api_calls.sh $f repos 1;done < <(cat GET_NEW)
