#!/bin/bash

source models.sh

download_model() {
  local alias=$1
  for key in "${!model_aliases[@]}"; do
    if [ "${model_aliases[$key]}" == "$alias" ]; then
      echo "Downloading ${model_names[$key]}"
      eval ${model_download_commands[$key]}
      return
    fi
  done
  echo "Model not found: $alias"
}

if [ $# -eq 0 ]; then
  usage
  exit 1
fi

download_model $1
