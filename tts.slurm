#!/bin/bash
#SBATCH --job-name=buildimage-arie
#SBATCH --account=ariesutiono
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB
#SBATCH --time=01:00:00
#SBATCH --output=buildimage-arie.log
DOCKER_IMAGE="hammond3/coqui-tts:latest"
OUTPUT=/home/ariesutiono/coqui-tts.sif
echo Starting
singularity build $OUTPUT docker://$DOCKER_IMAGE
echo "Job ended: $(date)"