#!/usr/bin/env bash
#SBATCH --ntasks 1
#SBATCH --mem 16G
#SBATCH --time 0-24:00:00
#SBATCH --partition standard
#SBATCH --account biol4585

echo "slurm job ${SLURM_JOB_ID} submitted by ${USER}"

sleep 5

echo "five second elapsed"

sleep 25

echo "thirty seconds elapsed"

sleep 30

echo "one minute elapsed"

echo "all done!"
