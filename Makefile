zlib:
	wget https://zlib.net/zlib-1.2.11.tar.xz
	tar -xf zlib-1.2.11.tar.xz
	cd zlib-1.2.11 && ./configure && make && sudo make install 

curl:
	git clone https://github.com/curl/curl.git
	sudo apt build-dep curl
	cd curl && autoreconf -fi && ./configure --with-openssl && make && sudo make install && cd ../ && gcc http.c -lcurl

util-linux:
	wget https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37-rc1.tar.xz
	tar -xf util-linux-2.37-rc1.tar.xz 
	cd util-linux-2.37-rc1/ && ./configure && make && sudo make install

lexer:
	flex lexer.l
	gcc -lfl lex.yy.c
