#!/bin/bash

$HOME/tools/bbmap/bbduk.sh \
in1=path_to_raw_reads/KOI19_1.fq.gz \
in2=path_to_raw_reads/KOI19_2.fq.gz \
out1=./KOI19_bbduk_1.fq.gz \
out2=./KOI19_bbduk_2.fq.gz \
ref=$HOME/tools/bbmap/resources/adapters.fa \
ktrim=r \
k=23 \
mink=11 \
hdist=1 \
tpe \
tbo \
qtrim=r \
trimq=20 \
maq=20 \
minlen=50
