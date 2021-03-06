#!/bin/bash

#SBATCH -p general
#SBATCH -N 1
#SBATCH --mem=80g
#SBATCH -n 1
#SBATCH -c 12
#SBATCH -t 7-

#tsvfile = "Illumina_whole-genome_seq_data.tsv"

echo "Hi"

/pine/scr/k/w/kwamek/AlexRotation/nextflow run nf-core/sarek --input Illumina_whole-genome_seq_data.tsv -profile singularity -bg

echo "Bye"
