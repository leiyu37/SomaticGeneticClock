#!/bin/bash

chmod 700 ./cov_BP.py
chmod 700 ./cov.py
./cov_BP.py ../09_hap_BP/BB04_BP.g.vcf ./covBP_BB04.txt BB04
./cov.py ./covBP_BB04.txt ./genomeSize_BB04.txt BB04
