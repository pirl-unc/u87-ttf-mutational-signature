#!/bin/bash

#SBATCH --partition general
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --mem=128g
#SBATCH --cpus-per-task 16
#SBATCH --time 7-

#tsvfile = "Illumina_whole-genome_seq_data.tsv"

module load nextflow

echo "Hi"

nextflow run nf-core/sarek --input Illumina_whole-genome_seq_data.tsv -profile singularity -bg

echo "Bye"
