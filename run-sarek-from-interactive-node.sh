#!/usr/bin/env bash
module load nextflow
nextflow -bg run nf-core/sarek --input Illumina_whole-genome_seq_data.tsv -profile singularity --max_cpus 10
