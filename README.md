# llama.cpp scripts

In this repo I openly store my scripts I use with [llama.cpp](https://github.com/ggerganov/llama.cpp). The idea is to have a handy, easy-to-follow reference for those times when I need to circle back to using llama.cpp after a while.

## Getting Started

Clone the llama.cpp repository and build it by following its provided instructions.

## Download models

**`download.sh`**

This script downloads models compatible with llama.cpp into `models` folder.

Usage:
- Execute the script with one argument: the name of the model.
- For example: `./extract_audio.sh 7b` will download Llama 2 7B chat model

## Running a model as HTTP server

**`server.sh`**

This script runs models as HTTP server.

Before usage, update the script with the location of your llama.cpp installation.

Usage:
- Execute the script with one argument: the name of the model.
- For example: `./server.sh 7b` will run Llama 2 7B chat model
