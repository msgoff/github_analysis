cat ms_people |grep login|sort |uniq|cut -d ":" -f2|tr -d '"'|tr -d ' ' |tr -d ',' >people
