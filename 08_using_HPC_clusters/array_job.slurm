#!/usr/bin/env bash
#SBATCH --ntasks _____
#SBATCH --mem _____
#SBATCH --time 0-00:00:05
#SBATCH --partition _____
#SBATCH --account _____

# in a job array, the job's number is automatically saved as the variable ${SLURM_ARRAY_TASK_ID}
# If you run an array of 10 jobs, this variable will take on values 1 through 10, one for each job in the array

echo "slurm job submitted by ${USER}"

sleep 5

echo "this job's number in the array is ${SLURM_ARRAY_TASK_ID}"

sleep 5

echo "the ID for the entire job array is ${SLURM_ARRAY_JOB_ID}"

sleep 5

echo "the unique ID for this job array is ${SLURM_JOB_ID}"

sleep 5
