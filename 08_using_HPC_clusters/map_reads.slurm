#!/usr/bin/env bash
#
# insert your SLURM header here!
#
#
#


accessionID="ERR2704803"
subfolder="testing"

# Load modules
module load bwa
module load samtools
module load gatk
module load sratoolkit/2.8.0

# Ensure we're in the proper directory and have necessary files
mkdir -p /scratch/$USER/BIOL4585/08_using_HPC_clusters/${subfolder} && cd /scratch/$USER/BIOL4585/08_using_HPC_clusters/${subfolder}
cp ../MT_reference.FASTA . || { echo "could not copy MT_reference.fasta to working directory"; exit 1; }

# Download the required files
# -X <integer> downloads a subset of the first <integer> sequencing reads
echo "retrieving sequencing reads for accessionID ${accessionID}"
fastq-dump -X 100000 ${accessionID}

# Index the reference genome
echo "indexing reference genome"
bwa index MT_reference.fasta

# Align reads to reference genome
echo "aligning reads to reference"
bwa mem -t 1 MT_reference.fasta ${accessionID}.fastq > MT.sam

# Convert to .bam format
echo "converting .sam to .bam"
samtools view -b MT.sam > MT.bam

# Sort .bam file
echo "sorting .bam"
samtools sort MT.bam > MT.sorted.bam

# Generate fasta index (faidx) and sequence dictionary for reference genome
echo "preparing reference index"
samtools faidx MT_reference.fasta
gatk CreateSequenceDictionary --REFERENCE MT_reference.fasta

# Add read groupsand index .bam file
echo "adding read groups"
gatk AddOrReplaceReadGroups --INPUT MT.sorted.bam --OUTPUT MT.sorted.readgroups.bam --RGLB library1 --RGPL illumina --RGPU platform1 --RGSM ${accessionID}
samtools index MT.sorted.readgroups.bam

# Validate the file
echo "validating sam file"
gatk ValidateSamFile --INPUT MT.sorted.readgroups.bam

# Run haplotypecaller to generate VCF
echo "running haplotypecaller"
gatk HaplotypeCaller --input MT.sorted.readgroups.bam --reference MT_reference.fasta --output MT.vcf
