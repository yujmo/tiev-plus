#!/bin/bash

# Fail on first error
set -e

# CMake
apt-get -y install cmake
# google-glog + gflags
apt-get -y install libgoogle-glog-dev
# BLAS & LAPACK
apt-get -y install libatlas-base-dev
# Eigen3
apt-get -y install libeigen3-dev
# SuiteSparse and CXSparse (optional)
# - If you want to build Ceres as a *static* library (the default)
#   you can use the SuiteSparse package in the main Ubuntu package
#   repository:

apt-get -y install libsuitesparse-dev
# - However, if you want to build Ceres as a *shared* library, you must
#   add the following PPA:
#add-apt-repository ppa:bzindovic/suitesparse-bugfix-1319687
#apt-get -y update
#apt-get -y install libsuitesparse-dev

mkdir /tmp/ceres && cd /tmp/ceres
wget https://github.com/ceres-solver/ceres-solver/archive/1.14.0.tar.gz -O ceres-solver-1.14.0.tar.gz
tar zxf ceres-solver-1.14.0.tar.gz
mkdir ceres-bin
cd ceres-bin
cmake ../ceres-solver-1.14.0
make -j16
make test
# Optionally install Ceres, it can also be exported using CMake which
# allows Ceres to be used without requiring installation, see the documentation
# for the EXPORT_BUILD_DIR option for more information.
make install
cd /tmp && rm -rf /tmp/ceres
