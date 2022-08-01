import pandas as pd
from sys import argv
import re
from collections import defaultdict
from hashlib import sha256

f = open(argv[1], "r")
data = f.read()
f.close()
pattern = re.escape("*****************************************")
entries = re.split(pattern, data)
keys = set()
df_dct = defaultdict(list)
for entry in entries:
    dct = dict()
    lst = []
    for line in entry.splitlines():
        resp = re.split(":", line, 1)
        if len(resp) == 2:
            k, v = resp
            if k.strip() and v.strip():
                lst.append(
                    k
                )  # find the unique combinations of the columns where the values are not null
                dct[k] = v
    # print(dct)
    key_tuple = tuple(sorted(lst))
    keys.add(key_tuple)
    unique_name_from_columns = sha256(",".join(key_tuple).encode()).hexdigest()
    df = pd.DataFrame(pd.Series(dct))
    df_dct[unique_name_from_columns].append(df)
    # inp = input()

# print(df_dct['254e0e1add0207c21d7918e8726ad615d71c983049b8350e932d9933edc3c10a'])
