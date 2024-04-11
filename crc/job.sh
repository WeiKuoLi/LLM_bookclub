#!/bin/bash

#$ -M wli22@nd.edu   # Email address for job notification
#$ -m ae             # Send mail when job begins, ends and aborts
#$ -pe smp 1    # Specify parallel environment and legal core size
#$ -q gpu  # Specify queue
#$ -l gpu_card=1
#$ -N gpu_test           # Specify job name

#module load pytorch        # Required modules

source ~/.bashrc
module load cuda cudnn
conda activate SD2
nvidia-smi>log
mpirun -np $NSLOTS python3 train.py >> out  # Application to execute
