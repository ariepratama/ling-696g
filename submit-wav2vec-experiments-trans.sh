#!/bin/bash

sbatch \
  --job-name=wav2vec-arie-700 \
  --time="10:00:00" \
  --partition=standard \
  --account=clu-ling \
  --output=%x-%j.out \
  --mail-type=ALL \
  --mail-user=ariesutiono@arizona.edu \
  --ntasks=1 \
  --cpus-per-task=1 \
  --gres=gpu:1 \
  --mem=8GB \
  train_id_wav2vec_trans.sh hparams/stt_experiments/train_id_with_wav2vec_trans_700.yaml
