# get training data
# curl -L -o data/shakespeare.txt https://raw.githubusercontent.com/brunoklein99/deep-learning-notes/master/shakespeare.txt

# warning: using a lora adapter with a quantized model may result in poor quality, use a f16 or f32 base model with --lora-base

# finetune LORA adapter
# ./llama.cpp/finetune \
#     --model-base models/llama-2/llama-2-7b-chat.Q4_K_M.gguf \
#     --checkpoint-in data/chk-lora-open-llama-2-7b-Q4_K_M-shakespeare-LATEST.gguf \
#     --checkpoint-out data/chk-lora-open-llama-2-7b-Q4_K_M-shakespeare-ITERATION.gguf \
#     --lora-out data/lora-open-llama-2-7b-Q4_K_M-shakespeare-ITERATION.bin \
#     --train-data data/shakespeare.txt \
#     --save-every 10 \
#     --threads 8 --adam-iter 30 --batch 4 --ctx 64 \
#     --use-checkpointing \
#     -ngl 1

./llama.cpp/server \
  -m models/llama-2/llama-2-7b-chat.Q4_K_M.gguf \
  --lora data/lora-open-llama-2-7b-Q4_K_M-shakespeare-LATEST.bin \
  --ctx-size 2048 \
  --threads 8
