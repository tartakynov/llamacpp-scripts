#!/usr/bin/env bash

# Function to display usage information
usage() {
    echo "Usage: $0 [7b|13b]"
    echo "  7b: Download llama2 7B model"
    echo "  13b: Download llama2 13B model"
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    usage
    exit 1
fi

# Depending on the argument, download the appropriate file
case $1 in
    7b)
        echo "Downloading llama2 7B..."
        curl -L -o models/llama-2-7b-chat.Q4_0.gguf https://huggingface.co/monal04/llama-2-7b-chat.Q4_0.gguf-GGML/resolve/main/llama-2-7b-chat.Q4_0.gguf?download=true
        ;;
    13b)
        echo "Downloading llama2 13B..."
        curl -L -o models/llama-2-13b-chat.Q4_0.gguf https://huggingface.co/TheBloke/Llama-2-13B-chat-GGUF/resolve/main/llama-2-13b-chat.Q4_0.gguf?download=true
        ;;
    *)
        echo "Invalid argument: $1"
        usage
        exit 1
        ;;
esac
