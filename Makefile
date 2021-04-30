util-linux:
	wget https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37-rc1.tar.xz
	tar -xf util-linux-2.37-rc1.tar.xz 
	cd util-linux-2.37-rc1/ && ./configure && make && sudo make install

lexer:
	flex lexer.l
	gcc -lfl lex.yy.c
