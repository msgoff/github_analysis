#include <stdarg.h>
#include "jsonc.h"
#include <stddef.h>
#include <stdio.h>
#include <ctype.h>
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>




void json_print(unsigned char *s)
{
    if(*s=='\"') s++;
    while(*s && *s!=',' && *s!='{' && *s!='[' && *s!=']' && *s!='}' && *s!='\"' && *s!='\r' && *s!='\n')
        putchar(*s++);
}
void json_dump(const char *jsonstr)
{
    unsigned char *c=(unsigned char*)jsonstr,*k[33],*v;
    int l=0,j=1,i,n,x[33]={0};
    if(!jsonstr || !jsonstr[0]) return;
    while(1) {
        while(*c && *c<=' ') c++;
        if(j) { j=0; k[l]=v=c; }
        switch(*c) {
        case '\"': c++; while(*c && *c!='\"') { if(*c=='\\') { c++; } c++; } break;
        case ':': c++; while(*c && *c<=' ') { c++; } v=c--; break;
        case 0: case ',': case '{': case '[': case '}': case ']':
            if(*v!=','&&*v!='{'&&*v!='['&&*v!=']'&&*v!='}') {
                n=k[0][0]=='{'?1:0;
                /* print path */
                for(i=n;i<=l;i++) {
                    if(i!=n) printf(".");
                    if(k[i][0]=='\"' && k[i]!=v) json_print(k[i]); else printf("%d",x[i]);
                }
                /* print value */
                printf("\t\t"); json_print(v); printf("\n");
            }
            switch(*c) {
            case 0: return;
            case '{': case '[': x[++l]=0; if(l>=sizeof(x)-1) return NULL; break;
            case '}': case ']': l--; break;
            case ',': x[l]++; break;
            }
            j++;
            break;
        }
        c++;
    }
}

int main(int argc, char** argv){
  struct stat s;
  char *buffer;
  int fd;
  fd = open(argv[1], O_RDONLY);
  if (fd < 0)
    return EXIT_FAILURE;
  fstat(fd, &s);
  /* PROT_READ disallows writing to buffer: will segv */
  buffer = mmap(0, s.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
  if (buffer != (void *)-1) {
	  json_dump(buffer);
  }
  close(fd);
   return 0;
}



