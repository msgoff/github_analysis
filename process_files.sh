mkdir output
while read f;do time ./grep_patterns_over_file.sh $f;done < <(find  x?? -maxdepth 1)
