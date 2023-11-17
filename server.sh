#!/usr/bin/env bash

# Function to display usage information
usage() {
    echo "Usage: $0 [7b|13b|X]"
    echo "  7b: Run server with path of file A in models folder"
    echo "  13b: Run server with path of file B in models folder"
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    usage
    exit 1
fi

case $1 in
    7b)
        echo "Running server with File A..."
        MODEL="models/llama-2-7b-chat.Q4_0.gguf"
        ;;
    13b)
        echo "Running server with File B..."
        MODEL="models/llama-2-13b-chat.Q4_0.gguf"
        ;;
    *)
        echo "Invalid argument: $1"
        usage
        exit 1
        ;;
esac

LLAMA_CPP_FOLDER=~/src/llama.cpp

open http://localhost:8080

"$LLAMA_CPP_FOLDER"/server \
  -m "$MODEL" \
  --ctx-size 2048 \
  --threads 8



