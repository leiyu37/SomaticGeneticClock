#!/bin/bash

zcat path_to_gzipvcf/FI_04_FI_20_raw.vcf.gz >FI_04_FI_20_raw.vcf
./vrf50SoGV.py FI_04_FI_20_raw.vcf ./output/FI_04_FI_20_vrf50.txt FI_04 FI_20 YU20_FI
rm ./FI_04_FI_20_raw.vcf
