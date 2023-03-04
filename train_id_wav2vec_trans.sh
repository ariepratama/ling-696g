#!/bin/bash
 
IMAGE=/home/u26/ariesutiono/speechbrain.sif

echo "starting wav2vec-trans-arie"
cd /home/u26/ariesutiono/speechbrain/recipes/CommonVoice/ASR/CTC
singularity exec --nv $IMAGE python3 train_with_wav2vec_trans.py $1
echo "finished wav2vec-trans-arie"