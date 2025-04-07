#!/bin/bash

# 引数でディレクトリを渡されていたら移動

if [ $# -gt 0 ]; then
    cd "$1" 2>/dev/null || {
        echo "Failure CD command."
        echo "The directory passed as an argument is not valid."
        echo "Running in the script's current directory."
    }
fi
