#!/bin/bash

for cc in {1..11}
do
for ee in {1..11}
do
JOB_NAME="natNurt_${cc}_${ee}"
output="/data/cephfs/punim1173/natureNurture/out/slurm/$JOB_NAME"
sbatch --job-name=$JOB_NAME --output=$output /data/cephfs/punim1173/natureNurture/src/slurm/job_submission.slurm $cc $ee
#echo $cc $ee
done
done
