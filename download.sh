#!/usr/bin/env bash

# Function to display usage information
usage() {
    echo "Usage: $0 [7b|13b|bakllava]"
    echo "  7b: Download llama2 7B model"
    echo "  13b: Download llama2 13B model"
    echo "  zephyr7b: Download Zephyr 7B beta"
    echo "  bakllava: Download BakLLaVa-1 model"
    echo "  neural7b: Download Intel Neural 7B v3 1 model"
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    usage
    exit 1
fi

# Depending on the argument, download the appropriate file
case $1 in
    7b)
        echo "Downloading LLama 7B..."
        mkdir -p models/llama-2/
        curl -L -o models/llama-2/llama-2-7b-chat.Q4_K_M.gguf https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/resolve/main/llama-2-7b-chat.Q4_K_M.gguf?download=true
        ;;
    13b)
        echo "Downloading LLama 13B..."
        mkdir -p models/llama-2/
        curl -L -o models/llama-2/llama-2-13b-chat.Q4_K_M.gguf https://huggingface.co/TheBloke/Llama-2-13B-chat-GGUF/resolve/main/llama-2-13b-chat.Q4_K_M.gguf?download=true
        ;;
    zephyr7b)
        echo "Downloading Zephyr 7B Beta..."
        mkdir -p models/zephyr/
        curl -L -o models/zephyr/zephyr-7b-beta.Q4_K_M.gguf https://huggingface.co/TheBloke/zephyr-7B-beta-GGUF/resolve/main/zephyr-7b-beta.Q4_K_M.gguf?download=true
        ;;
    neural7b)
        echo "Downloading Intel Neural 7B v3 1..."
        mkdir -p models/neural/
        curl -L -o models/neural/neural-chat-7b-v3-1.Q6_K.gguf https://huggingface.co/TheBloke/neural-chat-7B-v3-1-GGUF/resolve/main/neural-chat-7b-v3-1.Q6_K.gguf?download=true
        ;;
    bakllava)
        echo "Downloading BakLLaVa-1"
        mkdir -p models/bakllava/
        curl -L -o models/bakllava/ggml-model-q4_k.gguf https://huggingface.co/mys/ggml_bakllava-1/resolve/main/ggml-model-q4_k.gguf?download=true
        curl -L -o models/bakllava/mmproj-model-f16.gguf https://huggingface.co/mys/ggml_bakllava-1/resolve/main/mmproj-model-f16.gguf?download=true
        ;;
    *)
        echo "Invalid argument: $1"
        usage
        exit 1
        ;;
esac
