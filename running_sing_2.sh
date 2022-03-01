#!/bin/bash

#SBATCH -p general
#SBATCH -N 1
#SBATCH --mem=80g
#SBATCH -n 1
#SBATCH -c 12
#SBATCH -t 7-

/pine/scr/k/w/kwamek/AlexRotation/nextflow -bg run nf-core/sarek --input Illumina_whole-genome_seq_data.tsv -profile singularity --max_cpus 10
