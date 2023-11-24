#!/usr/bin/env bash

# Function to display usage information
usage() {
    echo "Usage: $0 [7b|13b|X]"
    echo "  7b: Run server with Llama 2 7B model"
    echo "  13b: Run server with Llama 2 13B model"
    echo "  zephyr7b: Run server with Zephyr 7B Beta model"
    echo "  bakllava: Run server with BakLLaVa-1 model"
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    usage
    exit 1
fi

case $1 in
    7b)
        echo "Running server with LLama 2 7B..."
        MODEL_ARGS="-m models/llama-2/llama-2-7b-chat.Q4_K_M.gguf"
        ;;
    13b)
        echo "Running server with LLama 2 13B..."
        MODEL_ARGS="-m models/llama-2/llama-2-13b-chat.Q4_K_M.gguf"
        ;;
    zephyr7b)
        echo "Running server with Zephyr 7B Beta..."
        MODEL_ARGS="-m models/zephyr/zephyr-7b-beta.Q4_K_M.gguf"
        ;;
    bakllava)
        echo "Running server with BakLLaVa-1..."
        MODEL_ARGS="-m models/bakllava/ggml-model-q4_k.gguf --mmproj models/bakllava/mmproj-model-f16.gguf"
        ;;
    neural7b)
        echo "Running server with Intel Neural 7B v3 1..."
        MODEL_ARGS="-m models/neural/neural-chat-7b-v3-1.Q6_K.gguf"
        ;;
    *)
        echo "Invalid argument: $1"
        usage
        exit 1
        ;;
esac

open http://localhost:8080

./llama.cpp/server \
  $MODEL_ARGS \
  --ctx-size 2048 \
  --threads 8
