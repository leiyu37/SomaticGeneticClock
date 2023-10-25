#!/bin/bash

samtools view -Sb path_to_sam/KOI19.sam >./bams/KOI19.bam
rm path_to_sam/KOI19.sam
samtools sort ./bams/KOI19.bam >./bams/KOI19_sort.bam
$HOME/tools/gatk-4.1.1.0/gatk --java-options "-Xmx90G" MarkDuplicates -I ./bams/KOI19_sort.bam -O ./bams/KOI19_markdup.bam -M ./bams/KOI19_metrics.txt -MAX_FILE_HANDLES 1000 --REMOVE_DUPLICATES true
rm ./bams/KOI19_sort.bam
samtools view -q 20 -f 0x2 -b ./bams/KOI19_markdup.bam >KOI19_Qfiltered.bam
samtools index ./KOI19_Qfiltered.bam
samtools flagstat ./KOI19_Qfiltered.bam >KOI19_stat.txt
rm ./bams/KOI19_markdup.bam
