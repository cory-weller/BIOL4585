#!/usr/bin/env bash

accessionID=${1}
outFileName="MT_reference.fasta"

wget -O ${outFileName} "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=${accessionID}&rettype=fasta"
