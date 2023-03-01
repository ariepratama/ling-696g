#!/bin/bash

sbatch \
  --job-name=wav2vec-arie-531 \
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
  train_id_wav2vec_specaug.sh hparams/stt_experiments/train_id_with_wav2vec_531.yaml

sbatch \
  --job-name=wav2vec-arie-532 \
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
  train_id_wav2vec_specaug.sh hparams/stt_experiments/train_id_with_wav2vec_532.yaml


sbatch \
  --job-name=wav2vec-arie-533 \
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
  train_id_wav2vec_specaug.sh hparams/stt_experiments/train_id_with_wav2vec_533.yaml

sbatch \
  --job-name=wav2vec-arie-534 \
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
  train_id_wav2vec_specaug.sh hparams/stt_experiments/train_id_with_wav2vec_534.yaml

