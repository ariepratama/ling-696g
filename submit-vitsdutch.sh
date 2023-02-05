#!/bin/bash

sbatch \
  --job-name=vitsdutch-arie \
  --time="50:00:00" \
  --partition=standard \
  --account=clu-ling \
  --output=%x-%j.out \
  --mail-type=ALL \
  --mail-user=ariesutiono@arizona.edu \
  --ntasks=10 \
  --cpus-per-task=1 \
  --gres=gpu:1 \
  --mem=8GB \
  vitsdutch.sh