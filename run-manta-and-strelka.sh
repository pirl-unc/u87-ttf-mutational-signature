BAM_DIR=/pine/scr/k/w/kwamek/AlexRotation/sing_bash/results/Preprocessing/U87_1/Recalibrated
BAM_NAME=U87_1.recal.bam
BAM_FULL_PATH=$BAM_DIR/$BAM_NAME

echo $BAM_FULL_PATH

CPUS=8

GENOME=./reference/GRCh38_full_analysis_set_plus_decoy_hla.fa

MANTA_ANALYSIS_PATH=./mantaAnalysis
STRELKA_ANALYSIS_PATH=/outputs/strelkaAnalysis

# pull the docker container
singularity pull docker://quay.io/wtsicgp/strelka2-manta

#run Manta
singularity exec --cleanenv --bind $BAM_DIR:/inputs:ro \
	strelka2-manta_latest.sif \
  	configManta.py \
  	--tumorBam /inputs/$BAM_NAME \
  	--referenceFasta $GENOME \
  	--runDir ${MANTA_ANALYSIS_PATH}

singularity exec --cleanenv --bind $BAM_DIR:/inputs:ro \
	strelka2-manta_latest.sif \
  	${MANTA_ANALYSIS_PATH}/runWorkflow.py \
	-j $CPUS

singularity exec --cleanenv \
	--bind $BAM_DIR:/inputs:ro \
	strelka2-manta_latest.sif \
	configureStrelkaSomaticWorkflow.py \
  	--tumorBam /inputs/$BAM_NAME \
  	--referenceFasta $GENOME \
  	--indelCandidates ${MANTA_ANALYSIS_PATH}/results/variants/candidateSmallIndels.vcf.gz \
  	--runDir ${STRELKA_ANALYSIS_PATH}

singularity exec --cleanenv \
	--bind $BAM_DIR:/inputs:ro \
	strelka2-manta_latest.sif \
 	 ${STRELKA_ANALYSIS_PATH}/runWorkflow.py \
	-m local \
	-j $CPUS
