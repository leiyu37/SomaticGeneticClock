#!/bin/bash

$HOME/tools/gatk-4.1.1.0/gatk --java-options "-Xmx80G" Mutect2 -R $WORK/A_newGenome/Zostera_marina.mainGenome.fasta -I path_to_bam/KOI10_Qfiltered.bam -I path_to_bam/KOI19_Qfiltered.bam -normal KOI10 -O ./vcfs/KOI10_KOI19_raw.vcf.gz --tmp-dir ./temp

$HOME/tools/gatk-4.1.1.0/gatk --java-options "-Xmx80G" Mutect2 -R $WORK/A_newGenome/Zostera_marina.mainGenome.fasta -I path_to_bam/KOI19_Qfiltered.bam -I path_to_bam/KOI10_Qfiltered.bam -normal KOI19 -O ./vcfs/KOI19_KOI10_raw.vcf.gz --tmp-dir ./temp
