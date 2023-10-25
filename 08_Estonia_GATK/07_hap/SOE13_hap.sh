#!/bin/bash

$HOME/tools/gatk-4.1.1.0/gatk --java-options "-Xmx80G" HaplotypeCaller -R $WORK/A_newGenome/Zostera_marina.mainGenome.fasta -I ../05_sam2bam/SOE13_Qfiltered.bam -O ./SOE13.g.vcf -ERC GVCF
