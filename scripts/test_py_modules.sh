#!/bin/bash

if [[ ! -z "${TIEV_PLUS_CONTAINER}" ]]; then
    source /home/docker/.bashrc
fi

script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root_path="${script_path}/.."
source_path=${root_path}/modules
build_path=${source_path}/build

python3 -m pytest ${source_path}/test/ --junitxml ${build_path}/test/python-all-tests-report.xml -vvv

#python3 ${source_path}/test/common/test_cv2.py
#python3 ${source_path}/test/vision/vision_parking_slot/test_vision_parking_slot.py
#py.test ${source_path}/test/ --junitxml ${build_path}/test/python-all-tests-report.xml -vvv
