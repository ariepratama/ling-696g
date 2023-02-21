#!/bin/bash

sbatch \
  --job-name=wav2vec-arie \
  --time="90:00:00" \
  --partition=standard \
  --account=clu-ling \
  --output=%x-%j.out \
  --mail-type=ALL \
  --mail-user=ariesutiono@arizona.edu \
  --ntasks=10 \
  --cpus-per-task=1 \
  --gres=gpu:1 \
  --mem=8GB \
  train_id_wav2vec.sh