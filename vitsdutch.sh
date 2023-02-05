#!/bin/bash

IMAGE=/home/u26/ariesutiono/coqui-tts.sif
SINGULARITYENV_CUDA_VISIBLE_DEVICES=0
echo "starting vitsdutch...."
singularity exec \
        --nv $IMAGE python3 /home/u26/ariesutiono/TTS/vitsdutch.py
echo "finished running vitsdutch..."