#!/bin/bash

###OCELOTE
 
#SBATCH --job-name=tacwelshone-arie
#SBATCH --output=%x-%j.out
#SBATCH --account=clu-ling
#SBATCH --partition=standard
#SBATCH --ntasks=28
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=6gb
#SBATCH --gres=gpu:1
#SBATCH --time=90:00:00
 
IMAGE=/home/u26/ariesutiono/coqui-tts.sif

echo "starting"
SINGULARITYENV_CUDA_VISIBLE_DEVICES=0 singularity exec \
	--nv $IMAGE python3 /home/u26/ariesutiono/TTS/tacwelshone.py
echo "finished"

