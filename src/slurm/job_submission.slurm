#!/bin/bash

#SBATCH -p cloud,physical

#SBATCH --time=7-00:00:00

#SBATCH --nodes=1

#SBATCH --ntasks=1

#SBATCH --cpus-per-task=1

#SBATCH --mem=10240

#SBATCH --mail-user=phillipsb@unimelb.edu.au
#SBATCH --mail-type=TIME_LIMIT_50,TIME_LIMIT_90

# collect arguments from batch slurm
cc=$1
ee=$2

module purge

module load R/3.5.2-spartan_gcc-6.2.0 


# Specify working directory
cd /data/cephfs/punim1173/natureNurture

Rscript --vanilla src/quoll/quollSensitivityHPC.R "cc<-${cc}" "ee<-${ee}"