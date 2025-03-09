#!/bin/bash

# List of models to download
###########   Edit here with the models you want to download  ###########
models=("llama3.2:3b" "deepseek-r1:1.5b")

# Loop through each model
for MODEL in "${models[@]}"; do
    while true; do
        echo "Starting download for model: $MODEL"
        # Run the download command with a 3-minute timeout.
        # If the command doesn’t finish in 180 seconds, timeout kills it.
        timeout 180 ollama pull "$MODEL"
        
        EXITCODE=$?
        if [ $EXITCODE -eq 0 ]; then
            echo "Download completed successfully for model: $MODEL."
            break
        else
            echo "Download did not complete within 3 minutes (or was killed) for model: $MODEL. Restarting in 5 seconds..."
            sleep 5
        fi
    done
done
