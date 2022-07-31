#!/bin/bash

url="http://data.githubarchive.org/2022-07-{01..31}-{0..23}.json.gz"
echo "$(eval echo $url )"|tr ' ' '\n'|xargs -i wget {}


