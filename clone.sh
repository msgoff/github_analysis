path=$(pwd)
if [ ! -x "$1" ];then

	mkdir "$1"
fi

cp "$1"_repos $path/"$1"
cd $path/"$1"
echo $(pwd)

while read f;
	do 
		echo https://github.com/$f;
	done < <(cat "$1"_repos)
	
