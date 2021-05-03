openssl:
	 wget https://www.openssl.org/source/openssl-3.0.0-alpha15.tar.gz
	 tar -xf openssl-3.0.0-alpha15.tar.gz
	 cd openssl-3.0.0-alpha15/ && ./Configure && make && make test && sudo make install

zlib:
	wget https://zlib.net/zlib-1.2.11.tar.xz
	tar -xf zlib-1.2.11.tar.xz
	cd zlib-1.2.11 && ./configure && make && sudo make install 

curl:
	git clone https://github.com/curl/curl.git
	sudo apt update
	sudo apt build-dep curl
	cd curl && autoreconf -fi && ./configure --with-openssl && make && sudo make install && cd ../ && gcc http.c -lcurl

util-linux:
	wget https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37-rc1.tar.xz
	tar -xf util-linux-2.37-rc1.tar.xz 
	cd util-linux-2.37-rc1/ && ./configure && make && sudo make install

flex:
	git clone https://github.com/westes/flex
	sudo apt install help2man -y
	cd flex && bash autogen.sh && ./configure && make && sudo make install

get_data:
	gcc get_data.c -o get_data -lcurl 


lexer:
	flex lexer.l
	gcc -lfl lex.yy.c
