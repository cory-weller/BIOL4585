# Practicing Regular Expressions

## Introduction

You are a new student at Xavier's School for Gifted Youngsters, beginning a new research project using genetic data from the 1000 Genomes Project. The new hot question at Xavier's School is how to uncover the genetic basis of superpowers. You've been told that if we can collect enough genetic data about people with superpower and people without, we might be able to find the parts of the genome that are responsible for those superpowers. The statistics of how this is done can be fuzzy for now--we'll explain it later.

## Getting acquainted with the data

Genetic data for a population is often stored in specific kind of file you've never seen before. Visit wikipedia's entry for "Variant Call Format" (VCF) file specifications. Read through the description of the format, focusing on the column name and descriptions. Ignore the Common INFO fields section.

1. Along which dimension (rows or columns) is genetic data (for all individuals) at a specific site stored?
2. Which dimension represents an individual's genetic data specific to them?
3. Why is data stored in this manner, instead of including every nucleotide position for every individual?

## What do those words mean?

Your professor, Xavier, tells you that the data needs to be cleaned up to make analysis easier. He says that that the data should have indels removed so that only SNPs remain. Further, multiallelic SNPs can be problematic, so the data should be pruned to only contain biallelic SNPs. You recognize these words and nod, even though you may not be 100% sure what these words mean together. You open your trusty web browser to quickly look up the differences.

4. What's the difference between a a SNP and an indel?
5. What is the difference between a biallelic site and a multiallelic site?
6. What kind of feature (within the text of the file itself) do you use to identify multiallelic sites?

## Cleaning up some practice data

Unfortunately there's a backlog at the DNA sequencing facility, so you can't do your full data cleanup yet. To make good use of your time, you decide to begin testing the cleanup steps on a set of practice data, compressed into the file `tinyMT.vcf.gz`. After decompressing the file, you set off to remove any multiallelic sites using regular expressions.

7. As a group, find a command to remove multiallelic sites, saving the remaining sites to a new file called `tiny.biallelic.vcf`
8. Then, as a group, find a command to identify rows with indels from tinyMT.biallelic.vcf and save the output to `tinyMT.biallelic.indel.vcf`
9. Similarly, as a group, find a command to identify rows WITHOUT indels (i.e., rows containing SNPs) from `tinyMT.biallelic.vcf` and save the output to `tinyMT.biallelic.SNP.vcf`


## Applying the workflow to a bigger data set

It's a few days later, and your larger data set has (finally) arrived, called `fullMT.vcf.gz`. You decompress the file and apply the same workflow to this new, larger data set, but are unsure where to go from here. In the lounge that week, you happen to overhear a fellow student mention that Dr. Otto Octavius (Doc OcK for short) believes that A-to-G transitions might have something to do with mutant superpowers. You set off to subset your data to only include these kind of sites.

10. Write up a command to print only rows which contain A-to-G (or G-to-A) variants. That is, the REF and ALT columns will indicate A and G (or G and A), but no other characters.

## Homework
See the `at_home_practice` folder for instructions.
