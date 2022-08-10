#include "jsonc.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  FILE *stream;
  char *line = NULL;
  size_t len = 0;
  ssize_t read;
  char *test;
  stream = fopen(argv[1], "r");
  if (stream == NULL)
    exit(EXIT_FAILURE);

  while ((read = getline(&line, &len, stream)) != -1) {
    if (line != NULL) {
      if (re_findall("forks_count\":0", line) != 0) {
        json_dump_keys(line, "forks");
        printf("*****************************************\n");
      }
    }
  }

  free(line);
  fclose(stream);
  exit(EXIT_SUCCESS);
}
