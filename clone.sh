path=$(pwd)
name=$(echo "$1"|cut -d "/" -f1)
echo $name
if [ ! -x "$name" ];then

	mkdir "$name"
fi

cd $path/"$name"
echo $(pwd)
git clone https://github.com/"$1";
	
