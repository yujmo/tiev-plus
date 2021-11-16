#!/bin/bash
script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root_path="${script_path}/.."
source_path=${root_path}/modules
build_path=${source_path}/build

if [ ! -d ${build_path} ]; then
    ${script_path}/build_all_modules.sh
fi

cd ${build_path} && make test
