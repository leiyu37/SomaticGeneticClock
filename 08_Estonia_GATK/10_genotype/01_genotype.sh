#!/bin/bash

$HOME/tools/gatk-4.1.1.0/gatk --java-options "-Xmx90G" CombineGVCFs -R $WORK/A_newGenome/Zostera_marina.mainGenome.fasta \
--variant ../07_hap/KOI10.g.vcf \
--variant ../07_hap/KOI18.g.vcf \
--variant ../07_hap/KOI19.g.vcf \
--variant ../07_hap/KYD02.g.vcf \
--variant ../07_hap/KYD03.g.vcf \
--variant ../07_hap/KYD06.g.vcf \
--variant ../07_hap/KYD12.g.vcf \
--variant ../07_hap/SOE03.g.vcf \
--variant ../07_hap/SOE13.g.vcf \
--variant ../07_hap/SOE14.g.vcf \
-O 01_merge.g.vcf

$HOME/tools/gatk-4.1.1.0/gatk --java-options "-Xmx80G" GenotypeGVCFs -R $WORK/A_newGenome/Zostera_marina.mainGenome.fasta -V ./01_merge.g.vcf -O ./02_raw.vcf

bcftools filter --SnpGap 20 -o 03_indelDistance_snp.vcf -O v ./02_raw.vcf

chmod 700 02_selectSNP.py
./02_selectSNP.py

$HOME/tools/gatk-4.1.1.0/gatk  --java-options "-Xmx96G" VariantsToTable \
-R $WORK/A_newGenome/Zostera_marina.mainGenome.fasta \
-V ./04_keepDiLoci.recode.vcf \
-O ./05_Rtable.txt \
-F CHROM -F POS -F FILTER -F QD -F MQ -F FS -F SOR -F MQRankSum -F ReadPosRankSum -F DP
