#!/bin/sh

llama-server -hf unsloth/Qwen3.6-35B-A3B-GGUF:UD-IQ4_NL_XL \
  -c 16000 --load-mode mmap --no-mmproj \
  --cors-origins localhost
#  --jinja -b 2048 -ub 512 \
#  --temperature 0.6 --top-p 0.95 --top-k 20 --min-p 0.0
