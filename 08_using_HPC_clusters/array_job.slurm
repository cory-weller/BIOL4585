#!/usr/bin/env bash

# Insert SLURM header here!

# in a job array, the job's number is automatically saved as the variable ${SLURM_ARRAY_TASK_ID}
# If you run an array of 10 jobs, this variable will take on values 1 through 10, one for each job in the array

echo "slurm job submitted by ${USER}"

sleep 3

echo "this job's number in the array is ${SLURM_ARRAY_TASK_ID}"

sleep 3

echo "the ID for the entire job array is ${SLURM_ARRAY_JOB_ID}"

sleep 3

echo "the unique ID for this job array is ${SLURM_JOB_ID}"

sleep 3
