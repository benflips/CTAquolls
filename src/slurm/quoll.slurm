#!/bin/bash

# To give your job a name, replace "MyJob" with an appropriate name
#SBATCH --job-name=quollMod
#SBATCH -p cloud

# For R need to run on single CPU
#SBATCH --ntasks=1

# set your minimum acceptable walltime=hours:minutes:seconds
#SBATCH -t 20:00:00

# Specify your email address to be notified of progress.
# SBATCH --mail-user=phillipsb@unimelb.edu.au
# SBATCH --mail-type=ALL

# purge any other loaded modules
module purge

# Load the environment variables for R
module load R/3.5.2-spartan_gcc-6.2.0 

# Specify working directory
cd /data/cephfs/punim1173/natureNurture

# The command to actually run the job
R CMD BATCH src/quoll/quollSensitivity.R