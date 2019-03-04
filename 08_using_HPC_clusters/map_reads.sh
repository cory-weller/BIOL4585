#!/usr/bin/env bash

accessionID="ERR2704803"
subfolder="testing"

# Load modules
module load bwa
module load samtools
module load gatk


# Ensure we're in the proper directory
mkdir -p /scratch/$USER/BIOL4585/08_using_HPC_clusters/${subfolder} && cd /scratch/$USER/BIOL4585/08_using_HPC_clusters/${subfolder}

# Download the required files
# -X <integer> downloads a subset of the first <integer> sequencing reads
fastq-dump -X 100000 ${accessionID}

# Index the reference genome
bwa index MT_reference.fasta

# Align reads to reference genome
bwa mem MT_reference.fasta ${accessionID}.fastq > MT.sam

# Convert to .bam format
samtools view -b MT.sam > MT.bam

# Sort .bam file
samtools sort MT.bam > MT.sorted.bam

# Generate fasta index (faidx) and sequence dictionary for reference genome
samtools faidx MT_reference.fasta
gatk CreateSequenceDictionary --REFERENCE MT_reference.fasta

# Add read groupsand index .bam file
gatk AddOrReplaceReadGroups --INPUT MT.sorted.bam --OUTPUT MT.sorted.readgroups.bam --RGLB library1 --RGPL illumina --RGPU platform1 --RGSM ${accessionID}
samtools index MT.sorted.readgroups.bam

# Validate the file
gatk ValidateSamFile --INPUT MT.sorted.readgroups.bam

# Run haplotypecaller to generate VCF
gatk HaplotypeCaller --input MT.sorted.readgroups.bam --reference MT_reference.fasta --output MT.vcf
