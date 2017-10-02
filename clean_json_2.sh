xzgrep git  2017-01-01-0.json.gz |sed -re 's/"actor":.{1,20},|display_login.*?"public":|"org":.*//g'|sort -t, -k3|sed -re 's/"true,//g'

