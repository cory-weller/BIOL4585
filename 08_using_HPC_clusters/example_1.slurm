#!/usr/bin/env bash
#SBATCH --ntasks _____
#SBATCH --mem _____
#SBATCH --time 0-00:01:00
#SBATCH --partition _____
#SBATCH --account _____

echo "slurm job ${SLURM_JOB_ID} submitted by ${USER}"

sleep 5

echo "five second elapsed"

sleep 25

echo "thirty seconds elapsed"

sleep 30

echo "one minute elapsed"

echo "all done!"
