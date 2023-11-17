#!/usr/bin/env bash

LLAMA_CPP_FOLDER=~/src/llama.cpp
MODEL=models/llama-2-7b-chat.Q4_0.gguf

open http://localhost:8080

"$LLAMA_CPP_FOLDER"/server \
  -m "$MODEL" \
  --ctx-size 2048 \
  --threads 8
