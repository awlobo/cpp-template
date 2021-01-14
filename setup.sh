#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    brew install clang-format
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt install clang-format
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under 32 bits Windows NT platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Do something under 64 bits Windows NT platform
fi

git config --local core.hooksPath .hooks/
