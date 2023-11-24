#!/bin/bash

source models.sh

run_model() {
  local alias=$1
  for key in "${!model_aliases[@]}"; do
    if [ "${model_aliases[$key]}" == "$alias" ]; then
      local model_args=${model_run_args[$key]}
      echo "Running model: ${model_names[$key]}"
      open http://localhost:8080
      eval "./llama.cpp/server $model_args --ctx-size 2048 --threads 8"
      return
    fi
  done
  echo "Model not found: $alias"
}

if [ $# -eq 0 ]; then
  usage
  exit 1
fi

run_model $1
