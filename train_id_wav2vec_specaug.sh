#!/bin/bash
 
IMAGE=/home/u26/ariesutiono/speechbrain.sif

echo "starting wav2vec-specaug-arie"
cd /home/u26/ariesutiono/speechbrain/recipes/CommonVoice/ASR/CTC
singularity exec --nv $IMAGE python3 train_with_wav2vec_specaug.py $1
echo "finished wav2vec-specaug-arie"