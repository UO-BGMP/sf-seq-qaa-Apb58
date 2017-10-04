#!/bin/bash
#SBATCH --partition=short           ### Partition (like a queue in PBS)
#SBATCH --job-name=ab_Gsnap         ### Job Name
#SBATCH --output=gsnap1.out         ### File in which to store job output
#SBATCH --error=gsnap1.err          ### File in which to store job error messages
#SBATCH --time=0-02:00:00           ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1                   ### Node count required for the job
#SBATCH --ntasks-per-node=20        ### Number of tasks to be launched per Node
#SBATCH --mail-user=abubie@uoregon.edu  ### Email to send notifications to
#SBATCH --mail-type=ALL             ### Type of mail recieved (all start, end)

ml easybuild  icc/2017.1.132-GCC-6.3.0-2.27  impi/2017.1.132
ml GMAP-GSNAP/2017-06-20

cd /home/abubie/Bi624/PS1/SF-Seq_align

gmap_build -d Mus_musculus_rRNA -D /home/abubie/Bi624/PS1/SF-Seq_align/Mus_musculus_rRNA -k 15 /home/abubie/Bi624/PS1/SF-Seq_align/Mus_musculus_rfam_rrna.fa

time gsnap -d Mus_musculus_rRNA -D /home/abubie/Bi624/PS1/SF-Seq_align/Mus_musculus_rRNA --allow-pe-name-mismatch -N 1 -m 0.1 -t 10 -O -A sam --split-output 19_3f_fox_out /home/abubie/Bi624/PS1/19_3F_fox_R1.trimmed.fastq  /home/abubie/Bi624/PS1/19_3F_fox_R2.trimmed.fastq
time gsnap -d Mus_musculus_rRNA -D /home/abubie/Bi624/PS1/SF-Seq_align/Mus_musculus_rRNA --allow-pe-name-mismatch -N 1 -m 0.1 -t 10 -O -A sam --split-output 23_4A_R1_control_out /home/abubie/Bi624/PS1/23_4A_control_R1.trimmed.fastq /home/abubie/Bi624/PS1/23_4A_control_R2.trimmed.fastq

echo "Alignment of 19_3F and 23_4A libraries to rRNA sequences is complete"
