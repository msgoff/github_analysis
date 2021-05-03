#include "jsonc.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>



int main(int argc, char* argv[])
{
	FILE *stream;
	char *line = NULL;
	size_t len = 0;
	ssize_t read;
	char *test;
	stream = fopen(argv[1], "r");
	if (stream == NULL)
		exit(EXIT_FAILURE);

	while ((read = getline(&line, &len, stream)) != -1) {
		json_dump_keys(line,"commit");
		//test=json_get(line,"id");
		//printf("id:%s\n",test);
	}

	re_findall("hello","hello");

	free(line);
	fclose(stream);
	exit(EXIT_SUCCESS);
}

