#!/bin/bash
#SBATCH --job-name=buildimagesb-arie
#SBATCH --account=clu-ling
#SBATCH --partition=standard
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ariesutiono@arizona.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB
#SBATCH --time=01:00:00
#SBATCH --output=buildimagesb-arie.log

DOCKER_IMAGE="hammond3/speechbrain:latest"
OUTPUT=/home/u26/ariesutiono/speechbrain.sif

echo "Starting build image speechbrain"
singularity build $OUTPUT docker://$DOCKER_IMAGE
echo "Job ended: $(date)"