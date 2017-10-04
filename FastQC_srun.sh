#!/bin/bash
#SBATCH --partition=short       ### Partition (like a queue in PBS)
#SBATCH --job-name=ABFastQC     ### Job Name
#SBATCH --output=fqc.out        ### File in which to store job output
#SBATCH --error=pfqc.err        ### File in which to store job error messages
#SBATCH --time=0-03:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Node count required for the job
#SBATCH --ntasks-per-node=28    ### Number of tasks to be launched per Node

ml easybuild intel/2017a FastQC
cd /home/abubie/Bi624

fastqc --noextract -o PS1/19_3F /projects/bgmp/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R1_001.fastq.gz /projects/bgmp/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R2_001.fastq.gz &
fastqc --noextract -o PS1/23_4A /projects/bgmp/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R1_001.fastq.gz /projects/bgmp/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R2_001.fastq.gz

echo "FastQC analysis is complete"