#!/bin/bash

if [[ "$1" == "r" ]];then
    rm -rf build
fi
mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE="Release" ..
cmake --build .
bin/cpp-template