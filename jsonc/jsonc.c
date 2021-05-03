/*
 * jsonc.c
 * https://gitlab.com/bztsrc/jsonc
 *
 * Copyright (C) 2018 bzt (bztsrc@gitlab)
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * @brief Memory allocation-free, extremely fast JSON parser in pure ANSI C
 *
 */
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <regex.h>
#define JSON_MAXPATHLEVEL 32
char key[256];
char key_prefix[256];
int key_index=0;
int print_state=-1;

int re_findall(char *pattern, char* string);
/**
 * jsonstr: zero terminated UTF-8 string
 * key: path to a value, like "0.6.0.1" or "result.items.0.name"
 * returns the value in a malloc'd string or NULL
 */
__attribute_malloc__ char *json_get(const char *jsonstr, char *key)
{
    char *m=key, *ret=NULL;
    unsigned char *c=(unsigned char*)jsonstr,*k[JSON_MAXPATHLEVEL+1];
    unsigned char *v,*s=NULL,*e=NULL;
    int l=0, j=1, i, n, x[JSON_MAXPATHLEVEL+1]={0};
    if(!jsonstr || !jsonstr[0] || !key) return NULL;
    while(1) {
        /* skip white spaces */
        while(*c && *c<=' ') c++;
        if(j) { j=0; k[l]=v=c; }
        switch(*c) {
        /* string literals */
        case '\"': c++; while(*c && *c!='\"'){if(*c=='\\'){c++;} c++;} break;
        /* field names */
        case ':': c++; while(*c && *c<=' ') { c++; } v=c--; break;
        /* control blocks */
        case 0: case ',': case '{': case '[': case '}': case ']':
            if(*v!=','&&*v!='{'&&*v!='['&&*v!=']'&&*v!='}') {
                /* skip index for topmost object */
                n=k[0][0]=='{'?1:0;
                /* match the path */
                m=key;
                for(i=n;i<=l && *m;i++) {
                    if(i!=n) { if(*m=='.') m++; else break; }
                    if(k[i][0]=='\"' && k[i]!=v && (*m<'0'||*m>'9')) {
                        s=e=k[i]+1;
                        while(*e&&*e!='\"') { if(*e=='\\') { e++; } e++; }
                        if(memcmp(m,s,e-s)) break;
                        m+=e-s;
                    } else {
                        if(atoi(m)!=x[i]) break;
                        while(*m && *m!='.') m++;
                    }
                }
                /* find start and end of the return value */
                if(!*m) {
                    switch(*v) {
                        case '\"':
                            s=e=v+1;
                            while(*e&&*e!='\"') { if(*e=='\\') { e++; } e++; }
                            break;
                        case 'n': return NULL;
                        default:
                            s=e=v;
                            while(*e&&*e>' '&&*e!=','&&*e!=']'&&*e!='}') e++;
                            break;
                    }
                    /* we can't break the loop inside a switch in ANSI C */
                    goto end;
                }
            }
            switch(*c) {
            case 0: return NULL;
            case '{': case '[': x[++l]=0; if(l>=(int)sizeof(x)-1) return NULL; break;
            case '}': case ']': l--; break;
            case ',': x[l]++; break;
            }
            j++;
            break;
        }
        c++;
    }
    /* copy a zero terminated string of the value if any */
end:if(!*m && e>s) {
        ret=malloc(e-s+1);
        if(ret) { memcpy(ret,s,e-s); ret[e-s]=0; }
    }
    return ret;
}

void json_key(unsigned char *s){
	
    	if(*s=='\"') s++;
    while(*s && *s!=',' && *s!='{' && *s!='[' && *s!=']' && *s!='}' && *s!='\"' && *s!='\r' && *s!='\n')
    { if(key_index < 250) { key[key_index]=*s++; key_index++;}
   	
    }
}


void json_print(unsigned char *s)
{
    if(*s=='\"') s++;
    while(*s && *s!=',' && *s!='{' && *s!='[' && *s!=']' && *s!='}' && *s!='\"' && *s!='\r' && *s!='\n')
        printf("%d",sizeof(*s++));
		//putchar(*s++);
        
}
void json_dump_keys(const char *jsonstr, char* key_pattern)
{
    memset(key,'\0',256);
    key_index=0;    
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
                    if(i!=n) {key[key_index]='.'; key_index++;}
                    if(k[i][0]=='\"' && k[i]!=v) { 
			    json_key(k[i]);
		    }  else printf("%d",x[i]);

                }
		if (re_findall(key_pattern,key) == 0) {
			printf("%s\n",key);
		}

		memset(key,'\0',256);
		key_index=0;
                /* print value */
                //printf("\t\t"); json_print(v); printf("\n");
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

int re_findall(char *pattern, char* string) {
  regex_t regex;
  int reti;
  char msgbuf[10000];
  reti = regcomp(&regex, pattern, 0);
  if (reti) {
    fprintf(stderr, "Could not compile regex\n");
    exit(1);
  }
  reti = regexec(&regex, string, 0, NULL, 0);
  if (!reti) {
	  //if match found return 0 else 1
	  regfree(&regex);
	  return 0;
  }
  regfree(&regex);
  return 1;
}

