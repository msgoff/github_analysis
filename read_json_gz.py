import gzip
from sys import argv
import re

# argv[1], file name
# https://stackoverflow.com/questions/39450065/python-3-read-write-compressed-json-objects-from-to-gzip-file

FILE_NAME = argv[1]
if FILE_NAME.endswith("json.gz"):
    with gzip.GzipFile(argv[1]) as f:
        DATA = f.read()
    DATA_STR = DATA.decode("utf-8")
    LST = re.findall(r"{.*?}\n", DATA_STR)
    print(LST[0])
