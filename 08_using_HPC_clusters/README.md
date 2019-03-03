# Batch Processing & HPC Clusters

## Overview

Last week, you performed association tests using `plink`,  a `.vcf` file containing genotypes for 500 individuals, and the phenotypes for the 500 individuals. While this may *seem* like a lot of data, it only included the very small mitochondrial genome, which is ~17000 base pairs. The entire human genome is approximately two billion base pairs--over 100,000 times larger!

These kind of calculations will take more processing power than we've been using so far. If we tried to run a GWAS using a single processing core, it would take far too long. Luckily, *Rivanna* is a **High-Performance Computing** system made up of hundreds of processing cores that can be accessed by users. Today, we'll learn how to access these powerful computing resources.

Specifically, you will learn:
  * Why it's necessary to submit jobs, instead of just running things interactively
  * How *core-hours* represent the 'currency' of HPC systems
  * How to submit and monitor HPC jobs using the *SLURM* job manager
  * How to submit dozens to hundreds of related tasks using *Job Arrays*

## Why do I need to 'submit' jobs anyway?

when you log in, access to limited resources.

For example, 16GB of memory.

Actively monitor usage

## Queues

*SLURM* takes user-provided information to best allocate computing resources. Jobs that request little memory and little time typically have a high priority. Jobs that request a significant amount of resources may need to 'wait in line' if resources are busy. All of these decisions of where and when jobs eventually run is handled behind the scenes. When you submit a job, you specify which queue it is ran in with  `--partition` and one of the following options: `standard`, `parallel`, `largemem` or `dev`.

  * the **standard** queue, the most common option, for typical use.  
  * the **parallel** queue, for jobs that require special architecture for parallel computing.
  * the **largemem** queue, for jobs that need exceptionally large quantities of memory.
  * the **dev** is for developing and testing scripts on a small scale. This queue doesn't cost any core-hours when running, and is intended to be used to make sure code works, not for heavy use. After testing code in the **dev** queue, your tasks can be ran at the full scale on the other queues.


## In-class Questions


## Homework

1. You are planning on submitting a job that processes an extremely large data file. Based on testing on the `dev` queue with a subset of the data, you anticipate the full data set will require 50GB of memory, and to take at most 12 hours. The program you are running does not have any way of using multiple processing. What might your `SLURM` header look like?
