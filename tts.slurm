#!/bin/bash
#SBATCH --job-name=buildimage
#SBATCH --account=hammond
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB
#SBATCH --time=01:00:00
#SBATCH --output=buildimage.log
DOCKER_IMAGE="hammond3/coqui-tts:latest"
OUTPUT=/groups/hammond/mike/coqui-tts.sif
echo Starting
singularity build $OUTPUT docker://$DOCKER_IMAGE
echo "Job ended: $(date)"