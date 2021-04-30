ANSI C JSON Parser by bzt
=========================

Again, I was in a need for a simple library, and couldn't find any. Have you seen jansson? What a lunatic come up with
that API??? What a mess! Or what about the other C/C++ monsters eating up all the RAM? Nah, I rather have implemented a
really small, fast and simple JSON parser, that does not need any memory allocation, except for the result value. The
only dependency is libc (four functions namely, assuming they are not already provided by the compiler as intristics,
`memcmp()`, `memcpy()`, `atoi()` and `malloc()`).

Features
--------

- Superfast
- Compiles to a few-hundred bytes or so
- Single function API
- UTF-8 compatible
- Can parse any size of JSONs, even Gigabytes in length without extra memory allocation
- Not well-formed JSON tolerant

Application Programming Interface
---------------------------------

There's only one function, which is kinda self-explanatory:

```c
char *json_get(const char *jsonstr, char *key);
```

You pass a zero terminated, UTF-8 JSON string of any length as input, and a path to a value. The function will return a newly
malloc'd string with the value or NULL in case the key is not found. It can parse all RFC 8259 compliant JSON strings correctly,
but it's more permissive on the input, and allows some malformed JSON strings as well. If the JSON is not well-formed, the return
value is most likely NULL, or maybe the first child value for the path if it's possible figure that out.

I've set the maximum recursion level to 32 levels. If you need by any chance more (unlikely), then change the define
`JSON_MAXPATHLEVEL`. Because I've converted the recursion into a loop, each extra level will need no more than 2 additional
words on the stack (8 bytes for 32 bit machines, 16 for 64 bit), statically allocated.

That's all folks, simplicity is the ultimate sophistication!

About the Keys
--------------

All fields can be referenced by their index number, starting with 0. What's more, object fields with names can be referenced
by their names too. Arrays and nameless object fields use number notation only. Sub-levels are separated by a dot '.', for
example: `0.6.0.1` or `result.items.0.name`. Although the parser could interpret an object list, it assumes if the root is an
object, then there's only one object at the top level, so it's index is omitted. Then you can start the path with the topmost
object's field name, like "result" instead of "0.result". If the top level is an array, then you must start the path with an
index number, even if there's only one element in it.

For convinience, incomplete paths return the first child. Like paths "arr" and "arr.0" both return the first element of the array.
Likewise, for `{ "obj": { "id":1, "name":"one" } }` all of "obj.id", "obj.0", "0.0", "0" and "obj" paths return the id, 1.

To iterate on an array or object fields, use sprintf() with "%d" to create the key, and increase sprintf's argument until
json_get() returns a NULL (remember no memory allocation takes place except for the return value).

You can also use this wrapper if you want:

```c
#include <stdarg.h>

char *json_getl(const char *jsonstr, char *fmt, ...)
{
    char buf[BUFSIZ];
    va_list args;
    va_start(args, fmt);
    vsprintf(buf, fmt, args);
    return json_get(jsonstr, buf);
}
```

Then the iteration would be:

```c
for (i=0; str = json_getl(json, "result.items.%d.name", i); i++) {
    /* do what you want to do with the value in str */
    free(str);
};
```

To give you a full example of paths, here's a getrawtransaction json for a real life example, which has integers, strings, objects,
arrays of strings and arrays of objects, etc. It should look something like this:

```
result.txid                             975953c0507d1a4b8a4...20de73b5245ca667649
result.hash                             975953c0507d1a4b8a4...20de73b5245ca667649
result.version                          2
result.size                             187
result.vsize                            187
result.locktime                         101
result.vin.0.txid                       7b261a69c17467a...9e7f176ad3f33c9
result.vin.0.vout                       0
result.vin.0.scriptSig.asm              304402203041de1030...368ba46e3c9c563b1942e
result.vin.0.scriptSig.hex              47304402203041de10...8ba46e3c9c563b1942e01
result.vin.0.sequence                   4294967294
result.vout.0.value                     9.99684230
result.vout.0.n                         0
result.vout.0.scriptPubKey.asm          OP_HASH160 2ec4a9...39c513 OP_EQUAL
result.vout.0.scriptPubKey.hex          a9142ec4a9...52c25f239c51387
result.vout.0.scriptPubKey.reqSigs      1
result.vout.0.scriptPubKey.type         scripthash
result.vout.0.scriptPubKey.addresses.0  2MwWWfTM...ivFh9ticc
result.vout.1.value                     0.00300000
result.vout.1.n                         1
result.vout.1.scriptPubKey.asm          OP_HASH160 a2f3da4...10be58ff1 OP_EQUAL
result.vout.1.scriptPubKey.hex          a914a2f3...65e010be58ff187
result.vout.1.scriptPubKey.reqSigs      1
result.vout.1.scriptPubKey.type         scripthash
result.vout.1.scriptPubKey.addresses.0  2N86qaYm1...87ASSqiKn
result.hex                              0200000001c9333fad76f1e7041...be58ff18765000000
result.blockhash                        5970e1518fe02...be6256932233ad561
result.confirmations                    2
result.time                             1539010130
result.blocktime                        1539010130
error                                   null
id                                      null
```

Dumping the Keys
----------------

I haven't included the JSON dumper in the C source, because an application shouldn't need it. But for development purposes it
could be useful to see what keys are defined in a JSON, so here's the code I've used to generate the list above:

```c
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
```

Because we are not allowed to modify the input JSON string (note the "const" qualifier), we can't put string terminator zeros
in it. Therefore we need a helper function to print strings, which is the same simple putchar loop, we just use more than one
terminator characters.

The json_dump uses the same minimalistic parser loop like json_get, but instead of matching the key it prints the path and the
value in the most indented "if(*v...)" block.

MIT License
-----------

```
    Copyright (C) 2018 bzt (bztsrc@gitlab)

    Permission is hereby granted, free of charge, to any person
    obtaining a copy of this software and associated documentation
    files (the "Software"), to deal in the Software without
    restriction, including without limitation the rights to use, copy,
    modify, merge, publish, distribute, sublicense, and/or sell copies
    of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS IN THE SOFTWARE.
```

Cheers!

bzt
