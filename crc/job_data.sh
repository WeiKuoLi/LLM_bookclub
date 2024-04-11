#!/bin/bash

#$ -M wli22@nd.edu   # Email address for job notification
#$ -m abe             # Send mail when job begins, ends and aborts
##$ -pe mpi-24 1    # Specify parallel environment and legal core size
#$ -q long@@theta_lab  # Specify queue
#$ -N theta           # Specify job name

#free -h > mem.txt
source ~/.bashrc
#conda activate pmp
module load cuda cudnn
conda activate SD2
pip install bitsandbytes
#conda install -c huggingface -c conda-forge datasets
#conda install -c huggingface -c conda-forge transformers
python3 script.py>out
