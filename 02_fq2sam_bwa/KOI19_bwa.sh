#!/bin/bash

$HOME/tools/bwa-0.7.17/bwa mem -R "@RG\tID:KOI19\tSM:KOI19\tPL:illumina\tLB:lib\tPU:unit" -t 16 -M zm_chr path_to_filtered_reads/KOI19_bbduk_1.fq.gz path_to_filtered_reads/KOI19_bbduk_2.fq.gz >./KOI19.sam
