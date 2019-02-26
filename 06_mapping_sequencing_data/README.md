# Retrieving data and aligning to a reference genome

## Overview

Before, you downloaded a pre-generated VCF file containing genetic information of multiple
individuals' mitochondrial genome. Now, you will be generating your own VCF file starting
from raw DNA sequencing data. We will pretend that we have already conducted the necessary
DNA extraction, purification, and preparation for sequencing. The sample was sent to the
sequencing facility, a few weeks have passed, and now the data is ready for us.

The general workflow will consist of:
1. Retrieving sequencing data using the command-line
2. Retrieving a reference genome, which the sequencing reads are mapped onto
3. Generating accessory index files prior to aligning to the reference
4. Using a suite of genomic command-line tools to generate the alignment
5. Using a final genomic tool to create the VCF file

## A quick note on Rivanna directories

Thus far, we've been working in your home directory for doing computational work.
However, the home directory is a lower-performance disk with limited disk space and slower
speed. Using the home directory for extensive computing work can result in slowed performance,
accidentally filling up your allotted disk space, and failed tasks.

Aside from your home directory, you have a personal high-performance directory located at
`/scratch/${USER}` where the variable ${USER} corresponds to your computing ID. Simply change
to your /scratch/ directory using `cd` to access it. For example, if your computing ID is
mst3k, then you would use `cd /scratch/mst3k`.

While you have substantially more disk space and faster read/write speeds on `/scratch/`,
the storage there is technically not guaranteed to be backed up (hence the name, it's like
a scratch pad where you do work and test things out, but it isn't intended for permenant
long-term storage. For our class's purposes, that's fine because we aren't worried about
storing out results for a long period.

Once you are in your personal directory on /scratch/ you can re-download the course's
github repository via `git clone https://github.com/cory-weller/BIOL4585` and then `cd`
into this week's directory, named 06_mapping_sequencing_data.

## Retrieving sequencing data

DNA sequencing data is typically stored in a standardized format called FASTQ. As such,
files containing sequencing data will typically have the `.fastq` extension. Basically,
the format contains a string of sequenced nucleotides, and their corresponding quality scores.
You can see https://en.wikipedia.org/wiki/FASTQ_format for information on the format.

We'll be retrieving data from the Sequence Read Archive (SRA) of the National Center
for Biotechnology Information (NCBI).
  * NCBI website: https://www.ncbi.nlm.nih.gov/
  * SRA portion of website: https://www.ncbi.nlm.nih.gov/sra

The SRA allows researchers to share their sequencing data with others, allowing for their
research to be checked for reproducibility, for collaborative work, for archival purposes,
and for allowing data to be repurposed for novel studies. There is a convenient tool for
retrieving sequencing data from the SRA, directly from the command-line, called the sra-toolkit.

First, you'll need to download the sra-toolkit from NCBI. Luckily, it's hosted on their
FTP server, so you can download it directly using commands like `wget` so long as you have
the link: https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.4/sratoolkit.2.9.4-centos_linux64.tar.gz

1. Download the sra-toolkit to your directory in `/scratch/${USER}/BIOL4585/06_mapping_sequencing_data/`

Note that this file is a `.tar.gz` archive. This is different from a simple `.gz` file.
A `.tar` archive can contain multiple directories and files, and are not innately compressed.
Because this file is `.tar.gz`, that means it first bundled multiple files together into
a `.tar` file, and was subsequently compressed using `gzip`.

2. Fully extract the contents of the sra-toolkit file you downloaded. You can search online
resources, or consult the manual page for `tar` by entering `man tar` on the command line.

You can then `cd` into the fully extracted sra-toolkit directory. List all of the contents of this
directory. You'll notice a directory  named `bin` which is a common naming convention. The
`bin` directory indicates executable binary applications. The tool we want to use is named
`fastq-dump` and is contained within the `bin` directory.

3. Execute `fastq-dump` without any arguments to see directions for using the tool. Note that
you will need to either give an explicit full path to the file (e.g. `/scratch/$USER/BIOL4585/06_mapping_sequencing_data/sratoolkit.2.9.4-centos_linux64/bin/fastq-dump`)
or a relative path starting with `./`

4. Use `fastq-dump` using the flag `--gzip` to download compressed sequence data for accessionID SRR8203771.
This should take a minute or two, and afterwards you can use `ls` to verify you have a .fastq.gz file.

## Aligning to the reference sequence

In order to actually put the sequencing reads into the places we think they 'belong' in the
genome, we need to actually have a reference for what the genome looks like. This is what the
reference genome is: a long string of nucleotide characters. A sequence read mapper then compares
individual sequencing reads to the reference, and determines optimum placement based on character
matches. The output of this process is a sequence alignment map (SAM) file.

5. Retrieve the mitochondrial genome reference sequence from NCBI using the `retrieve_SRA.sh` script
conveniently located in your `alignment` directory of the class repository. Read through the
script to get an idea of how you expect it to work. Then, retrieve accession NC_012920.1 using the script.

In order for the reference to be used, we need to generate accessory index files using a tool called `bwa`.
Luckily, this tool is pre-installed on Rivanna, through a module that we can turn on using a set of
commands called `module load`.

6. First, try using `bwa` by entering it by itself in the command-line. Then, Activate the `bwa` module
by entering `module load bwa`. Then, enter `bwa` by itself in the command-line again. What happens?

Note: Different software often runs in different ways, e.g. one might run such as
` <SoftwareName> <ToolName> --Option argument inputFile > outputFile`
and another might run such as:
` <SoftwareName> <ToolName> --Option argument -o outputFile inputFile`
If you aren't sure which it will be, try running it without any additional parameters and it may prompt you
for how it should be ran.

7. We want to use `bwa index`. With most tools, entering it with no arguments or commands will give
an error, and tell us how to use it. Enter `bwa index` to see how it wants to be ran. Then, use it
to generate the index files for our reference fasta file (MT_reference.fasta).

8. Next, we want to use `bwa mem` to align the sequencing reads to the reference. Run `bwa mem` to be
prompted with how the program wants to be ran. The expected output is our sequence alignment map, or
`.sam` file. In this case, you can either specify an output file name using `-o MT.sam` or by directing
the output using ` > MT.sam` at the end of your command (but don't do both). Note that options like
`-o MT.sam` need to come before the fastq input.

## Preparing the alignment with Samtools

While the `MT.sam` file you generated contains the right information we need to create a VCF file,
it need some preparation before it's fully ready. These steps include converting to a binary format,
sorting the file for faster processing, and creating another index file for the reference sequence.

9. Load the `samtools` module similar to how you loaded the `bwa` module

10. Use the `samtools view` command to convert it to a binary format with the `.bam` suffix. Run
`samtools view` without any other commands to get a list of options, and use the option that
indicates you want a `.bam` output. For an output file name, use `MT.bam`.

11. Use the `samtools sort` command to output a sorted BAM file. Your input will be `MT.bam` and the
output file name can be `MT.sorted.bam`.

12. Use the `samtools faidx` command to generate another necessary index file for the reference sequence.

## Calling variants with the Genome Analysis ToolKit (GATK)

GATK is a commonly-used toolkit with many tools packed into it. We will use it to validate our file
(making sure it's properly formatted) and for generating our final VCF output.

13. Load the `gatk` module

14. Use the `gatk CreateSequenceDictionary` command to generate a sequence dictionary for the reference sequence.
Successful completion should print Tool returned: 0.

15. Use the `gatk AddOrReplaceReadGroups` command for our sorted `.bam` file. There are many arguments here:
  * the input will be `MT.sorted.bam`
  * the output will be `MT.sorted.readgroups.bam`
  * the read group library (`--RGLB`) will be `library1`
  * the read group platform (`--RGPL`) will be `illumina`
  * the read group platform unit (`--RGPU`) will be `platform1`
  * the read group sample (`--RGSM`) will be `sample1`

16. Index our final `.bam.` file by running `samtools index` for `MT.sorted.readgroups.bam`

17. Validate `MT.sorted.readgroups.bam` using the command `gatk ValidateSamFile`

If the validation returns with no errors, you're ready for the final step of generating the VCF output!

18. Use the `gatk HaplotypeCaller` command using our sorted `.bam` file with added readgroups. You will
need to specify the reference sequence file, and an output file name, such as `MT.vcf`. This may take a
few minutes to run to completion, but the end result should be a fully-formed VCF file! Look at the file contents
(e.g. using `less`) and scroll down. You should see a bunch of metadata starting with ##, followed
by a header starting with `#CHROM  POS  ID` etc. Below that should be rows of data. If not, something
went wrong. See: Troubleshooting.


## Troubleshooting

If you get through the final step and data rows are not present, you can check at which step things
went wrong. Your `.sam` and each of your `.bam` files should be relatively large (hundreds of MB),
so if any of them is unusually small, then something went wrong building that file.

You can check a file's size with `du -h filename` (du stands for for disk usage). The `-h` option reports file size
in human-readible units of kilobytes, megabytes or gigabytes. For example, if the `.sam` file you generated is
very small, you'll need to start over generating that file.

## Homework

For this week, you have 5 questions related to the pipeline you worked through, as well
as the final output that was generated. Once you are confident that you've successfully
finished the pipeline and generated the VCF file, proceed to the "Tests & Quizzes" tab
of the course collab page.

The "early" deadline is this Friday night at 11:59 PM. The "final" deadline is the start
of next class (4:00 PM Monday Feb 25). You get one chance to submit online. If you submit
prior to the early deadline, you will be able to check if your solutions were correct on
12:00 AM Saturday morning and later. Also, you will have the opportunity to resubmit your
answers, along with explanations of why your previous answer was wrong and how you fixed it,
 via email. If you decide not to submit until after the early deadline, that's your only
submission. The choice is yours!
