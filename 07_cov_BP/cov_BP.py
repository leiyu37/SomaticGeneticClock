#!/usr/bin/env python3
import sys

args = sys.argv

gvcf_path = args[1]
out_path = args[2]
dataid = args[3]

f_in = open(gvcf_path)
f_out = open(out_path, "w")
f_out.write("CHROM\tPOS\tCOV\tN_REF\tF_REF\tDATAID\n")

for line in f_in.readlines():
    if line.startswith("Chr0"):
        columns = line.split()
        chr = columns[0]
        pos = columns[1]
        if len(columns) == 10:
            record = columns[-1]
            if ":" in record:
                cov_info = record.split(":")[1]
                if "," in cov_info:
                    cov_list = cov_info.split(",")
                    dp = 0
                    n_ref = int(cov_list[0])
                    for cov in cov_list:
                        dp += int(cov)
                    if dp == 0:
                        f_out.write("{}\t{}\t0\t0\t0\t{}\n".format(chr, pos, dataid))
                    else:
                        f_ref = round(n_ref/dp, 4)
                        f_out.write("{}\t{}\t{}\t{}\t{}\t{}\n".format(chr, pos, dp, n_ref, f_ref, dataid))
                    
                else:
                    f_out.write("{}\t{}\t0\t0\t0\t{}\n".format(chr, pos, dataid))

            else:
                f_out.write("{}\t{}\t0\t0\t0\t{}\n".format(chr, pos, dataid))

        else:
            f_out.write("{}\t{}\t0\t0\t0\t{}\n".format(chr, pos, dataid))

f_in.close()
f_out.close()
