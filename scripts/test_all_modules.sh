#!/bin/bash
script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root_path="${script_path}/.."
source_path=${root_path}/modules
build_path=${source_path}/build

if [ ! -d ${build_path} ]; then
    ${script_path}/build_all_modules.sh
fi

echo "================================== Testing C++ Files ==========================================="
${script_path}/test_cxx_modules.sh
cpp_test_ret=$?

# test python files
echo "================================== Testing Python Files ==========================================="
${script_path}/test_py_modules.sh
py_test_ret=$?

if [ ${cpp_test_ret} -eq 0 ] && [ ${py_test_ret} -eq 0 ]
then
  echo "The script ran ok"
  exit 0
else
  echo "The script failed" >&2
  exit 1
fi
