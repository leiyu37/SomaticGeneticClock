#!/usr/bin/env python3
import sys
args = sys.argv

in_path = args[1]
out_path = args[2]
dataid = args[3]

f_in = open(in_path)
total = 0
e = 0
for line in f_in.readlines():
    if not line.startswith("CHROM"):
        total += 1
        columns = line.split()
        if int(columns[2]) >= 23:
            e += 1
f_in.close()

f_out = open(out_path, "w")
f_out.write("{}\t{}\t{}\n".format(dataid, total, e))
f_out.close()
