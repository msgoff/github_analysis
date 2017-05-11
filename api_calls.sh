username=''
token=''

github_api()
{
    curl -u $username:$token https://api.github.com/users/"$1"/"$2"?page="$3"\&per_page=100 |
        grep --color=auto html_url |
        grep --color=auto -oP http.* |
        tr -d '"' | tr -d ',' |
        grep --color=auto -v "https://github.com/$1$"|
        sed -re 's/https:\/\/github\.com\///g' > /tmp/resp
        cat /tmp/resp >> "$1"_"$2"

        num_lines=$(wc -l /tmp/resp | cut -d" " -f1)
        echo $num_lines
        if [ $num_lines == 100 ];then
                github_api "$1" "$2"  $(($3 + 1))
        fi

}

github_api "$1" "$2" "$3"
