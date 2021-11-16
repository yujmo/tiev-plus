#!/bin/bash

root_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
source_path=${root_path}/modules
build_path=${source_path}/build

mkdir -p ${build_path} && cd ${build_path} && cmake ${source_path} && make -j16
