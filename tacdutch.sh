#!/bin/bash

IMAGE=/home/u26/ariesutiono/coqui-tts.sif
SINGULARITYENV_CUDA_VISIBLE_DEVICES=0
echo "starting tacdutch...."
singularity exec \
        --nv $IMAGE python3 /home/u26/ariesutiono/TTS/tacdutch.py
echo "finished running tacdutch..."