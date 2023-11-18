# llama.cpp scripts

In this repo I openly store my scripts I use with [llama.cpp](https://github.com/ggerganov/llama.cpp). The idea is to have a handy, easy-to-follow reference for those times when I need to circle back to using llama.cpp after a while.

## Getting Started

Run the following commands to clone [llama.cpp](https://github.com/ggerganov/llama.cpp)

```
git submodule init
git submodule update
```

Then build it by following its provided instructions.

## Models

The `download.sh` and `server.sh` support the following models at the moment
- **`7b`**: Llama2 7B
- **`13b`**: Llama2 13B
- **`zephyr7b`**: Zephyr 7B Beta
- **`bakllava`**: BakLLaVa-1

## Download models

**`download.sh`**

This script downloads models compatible with llama.cpp into `models` folder.

Usage:
- Execute the script with one argument: the name of the model.
- For example: `./download.sh 7b` will download Llama 2 7B chat model

## Running a model as HTTP server

**`server.sh`**

This script runs models as HTTP server.

Usage:
- Execute the script with one argument: the name of the model.
- For example: `./server.sh 7b` will run Llama 2 7B chat model

## Running BakLLaVa-1 with webcam live stream

1. First, download the model `./download.sh bakllava`
2. Second, configure local Python environment with virtualenv
    ```
    python3 -m venv venv
    source venv/bin/activate
    pip3 install -r requirements.txt
    ```
3. Start the llama.cpp server with bakllava `./server.sh bakllava`
4. Start streaming from webcam `./bakllava-webcam.py`
