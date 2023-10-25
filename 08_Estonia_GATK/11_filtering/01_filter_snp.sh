#!/bin/bash

$HOME/tools/gatk-4.1.1.0/gatk --java-options "-Xmx96G" VariantFiltration \
   -R $WORK/A_newGenome/Zostera_marina.mainGenome.fasta \
   -V ../10_genotype/04_keepDiLoci.recode.vcf \
   -O ./05_markfilter_snp.vcf \
   --filter-expression "MQ < 40.0" \
   --filter-name "MQ_filter" \
   --filter-expression "FS > 60.0" \
   --filter-name "FS_filter" \
   --filter-expression "QD < 10.0" \
   --filter-name "QD_filter" \
   --filter-expression "MQRankSum > 2.5" \
   --filter-name "MQRankSum_L" \
   --filter-expression "MQRankSum < -2.5" \
   --filter-name "MQRankSum_S" \
   --filter-expression "ReadPosRankSum < -2.5" \
   --filter-name "ReadPosRankSum_S" \
   --filter-expression "ReadPosRankSum > 2.5" \
   --filter-name "ReadPosRankSum_L" \
   --filter-expression "SOR > 3.0" \
   --filter-name "SOR_F" \
   --filter-expression "DP > 1380.04" \
   --filter-name "DP_F"

$HOME/tools/gatk-4.1.1.0/gatk --java-options "-Xmx96G" SelectVariants \
     -R $WORK/A_newGenome/Zostera_marina.mainGenome.fasta \
     -V 05_markfilter_snp.vcf \
     -O 05_rmfilter_snp.vcf \
     --exclude-filtered true


vcftools --vcf 05_rmfilter_snp.vcf \
    --minGQ 30 \
    --minDP 20 \
    --recode \
    --recode-INFO-all \
    --out 06_rmLowGQDP

chmod 700 ./filterHomo.py
./filterHomo.py

vcftools --vcf ./07_HQsnp.vcf --max-missing 1.0 --recode-INFO-all --recode --out 08_rmMissing

vcftools --vcf ./08_rmMissing.recode.vcf --mac 1 --recode --recode-INFO-all --out 09_mac1
