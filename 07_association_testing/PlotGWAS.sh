#!/usr/bin/env bash

filename=${1}

module load gcc
module load R/3.5.1

Rscript ./PlotGWAS.Rscript ${filename}
