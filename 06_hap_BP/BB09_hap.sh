#!/bin/bash

$HOME/tools/gatk-4.1.1.0/gatk --java-options "-Xmx80G" HaplotypeCaller -R $WORK/A_newGenome/Zostera_marina.mainGenome.fasta -I path_to_bam/BB09_Qfiltered.bam  -O ./BB09_BP.g.vcf -ERC BP_RESOLUTION
