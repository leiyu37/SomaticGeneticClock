#!/usr/bin/env python3
#*.py in_path out_path G02(normal) G01(case) clone
import sys

args = sys.argv
in_path = args[1]
out_path = args[2]
sample_normal = args[3]
sample_case = args[4]
clone = args[5]

def vrf50SoGV(in_path, out_path, sample_normal, sample_case, clone):
    sample_i_dict = {}
    f_in = open(in_path)
    for line in f_in.readlines():
        if line.startswith("#CHROM"):
            columns = line.split()
            sample_i_dict[columns[9]] = 9
            sample_i_dict[columns[10]] = 10
            break
    f_in.close()

    i_case = sample_i_dict[sample_case]
    i_normal = sample_i_dict[sample_normal]

    f_in = open(in_path)
    f_out = open(out_path, "w")
    f_out.write("Normal\tTumor\tPos\tCov_Normal\tVRF_Normal\tCov_Tumor\tVRF_Tumor\tRun_ID\tClone_ID\n")

    for line in f_in.readlines():
        if line.startswith("Chr0"):
            columns = line.split()
            
            if len(columns) == 11 and len(columns[3]) == 1 and len(columns[4]) == 1:
                if (":" in columns[i_case]) and (":" in columns[i_normal]):
                    if ("," in columns[i_case].split(":")[1]) and ("," in columns[i_normal].split(":")[1]):
                        n_ref_case = int(columns[i_case].split(":")[1].split(",")[0])
                        n_alt_case = int(columns[i_case].split(":")[1].split(",")[1])
                        n_case = n_ref_case + n_alt_case
                
                        n_ref_normal = int(columns[i_normal].split(":")[1].split(",")[0])
                        n_alt_normal = int(columns[i_normal].split(":")[1].split(",")[1])
                        n_normal = n_ref_normal + n_alt_normal

                        if n_case >= 23 and n_normal >= 12:
                            vrf_case = round(n_alt_case/n_case, 4)
                            vrf_normal = round(n_alt_normal/n_normal, 4)

                            if vrf_case >= 0.5 and vrf_normal <= 0.01:
                                f_out.write("{}\t{}\t{}:{}\t{}\t{}\t{}\t{}\t{}|{}\t{}\n".format(sample_normal, sample_case, columns[0], columns[1], n_normal, vrf_normal, n_case, vrf_case, sample_normal, sample_case, clone))

    f_in.close()
    f_out.close()


vrf50SoGV(in_path, out_path, sample_normal, sample_case, clone)
