#!/bin/bash

model_aliases=()
model_names=()
model_download_commands=()
model_run_args=()

model_aliases+=("7b")
model_names+=("Llama2 7B Q4_K_M")
model_download_commands+=("
  mkdir -p models/llama-2 && cd models/llama-2 && curl -LO https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/resolve/main/llama-2-7b-chat.Q4_K_M.gguf?download=true
")
model_run_args+=("-m models/llama-2/llama-2-7b-chat.Q4_K_M.gguf")

model_aliases+=("13b")
model_names+=("Llama2 13B Q4_K_M")
model_download_commands+=("
  mkdir -p models/llama-2 && cd models/llama-2 && curl -LO https://huggingface.co/TheBloke/Llama-2-13B-chat-GGUF/resolve/main/llama-2-13b-chat.Q4_K_M.gguf?download=true
")
model_run_args+=("-m models/llama-2/llama-2-13b-chat.Q4_K_M.gguf")

model_aliases+=("zephyr7b")
model_names+=("Zephyr 7B Beta Q4_K_M")
model_download_commands+=("
  mkdir -p models/zephyr && cd models/zephyr && curl -LO https://huggingface.co/TheBloke/zephyr-7B-beta-GGUF/resolve/main/zephyr-7b-beta.Q4_K_M.gguf?download=true
")
model_run_args+=("-m models/zephyr/zephyr-7b-beta.Q4_K_M.gguf")

model_aliases+=("neural7b")
model_names+=("Intel Neural 7B v3 Q6_K")
model_download_commands+=("
  mkdir -p models/neural && cd models/neural && curl -LO https://huggingface.co/TheBloke/neural-chat-7B-v3-1-GGUF/resolve/main/neural-chat-7b-v3-1.Q6_K.gguf?download=true
")
model_run_args+=("-m models/neural/neural-chat-7b-v3-1.Q6_K.gguf ")

model_aliases+=("bakllava")
model_names+=("BakLLaVa-1 Q4_K")
model_download_commands+=("
  mkdir -p models/bakllava && cd models/bakllava && curl -LO https://huggingface.co/mys/ggml_bakllava-1/resolve/main/ggml-model-q4_k.gguf?download=true && curl -LO https://huggingface.co/mys/ggml_bakllava-1/resolve/main/mmproj-model-f16.gguf?download=true
")
model_run_args+=("-m models/bakllava/ggml-model-q4_k.gguf --mmproj models/bakllava/mmproj-model-f16.gguf")

model_aliases+=("mistral7b")
model_names+=("Mistral 7B v0.1 Q6_K")
model_download_commands+=("
  mkdir -p models/mistral && cd models/mistral && curl -LO https://huggingface.co/TheBloke/Mistral-7B-v0.1-GGUF/resolve/main/mistral-7b-v0.1.Q6_K.gguf?download=true
")
model_run_args+=("-m models/mistral/mistral-7b-v0.1.Q6_K.gguf")

usage() {
    echo "Usage: $0 [model]"
    echo "Available models:"
    for i in "${!model_aliases[@]}"; do
        echo "  - ${model_aliases[$i]}: ${model_names[$i]}"
    done
}
