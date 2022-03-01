#!/bin/bash

#SBATCH -p general
#SBATCH -N 1
#SBATCH -t 7-
#SBATCH -c 10
#SBATCH -n 10
#SBATCH --mem=80g

/pine/scr/k/w/kwamek/AlexRotation/nextflow -bg run nf-core/sarek --input Illumina_whole-genome_seq_data.tsv -profile singularity --max_cpus 10
