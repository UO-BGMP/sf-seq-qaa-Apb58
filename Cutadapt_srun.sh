#!/bin/bash
#SBATCH --partition=fat       ### Partition (like a queue in PBS)
#SBATCH --job-name=ab_CutAdapt  ### Job Name
#SBATCH --output=cut.out        ### File in which to store job output
#SBATCH --error=cut.err         ### File in which to store job error messages
#SBATCH --time=0-04:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Node count required for the job
#SBATCH --ntasks-per-node=28    ### Number of tasks to be launched per Node
#SBATCH --mail-user=abubie@uoregon.edu  ## Email to send notifications to
#SBATCH --mail-type=ALL         ### Type of mail recieved (all start, end)

ml easybuild  icc/2017.1.132-GCC-6.3.0-2.27  impi/2017.1.132
ml cutadapt/1.14-Python-2.7.13
cd /home/abubie/Bi624/PS1

time cutadapt -a GATCGGAAGAGCACACGTCTGAACTCCAGTCAC -A GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -f fastq -o 19_3F_fox_R1.trimmed.fastq -p 19_3F_fox_R2.trimmed.fastq 19_3F_fox_S14_L008_R1_001.fastq 19_3F_fox_S14_L008_R2_001.fastq
time cutadapt -a GATCGGAAGAGCACACGTCTGAACTCCAGTCAC -A GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -f fastq -o 23_4A_control_R1.trimmed.fastq -p 23_4A_control_R2.trimmed.fastq 23_4A_control_S17_L008_R1_001.fastq 23_4A_control_S17_L008_R2_001.fastq


echo $"trial cutadapt is complete for 19_3F_fox and 23_4A_control libraries"