#!/bin/bash
 
IMAGE=/home/u26/ariesutiono/speechbrain.sif

echo "starting wav2vec-arie"
cd /home/u26/ariesutiono/speechbrain/recipes/CommonVoice/ASR/CTC
singularity exec --nv $IMAGE python3 train_with_wav2vec.py hparams/train_id_with_wav2vec.yaml
echo "finished wav2vec-arie"