while read f; do gunzip -k $f;done < <(find . -name "*.json.gz")

