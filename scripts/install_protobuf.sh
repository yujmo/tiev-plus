#!/bin/bash
# refs: https://github.com/protocolbuffers/protobuf/blob/master/src/README.md

apt-get -y install autoconf automake libtool curl make g++ unzip
mkdir /bak/protobuf 
cd /bak/protobuf
#wget https://github.com/protocolbuffers/protobuf/releases/download/v3.11.4/protobuf-cpp-3.11.4.tar.gz
wget -O /bak/protobuf/protobuf-cpp-3.11.4.tar.gz https://gitlab.com/tjiv/nn_weights/-/raw/master/protobuf-cpp-3.11.4.tar.gz
cd /bak/protobuf
tar xzf protobuf-cpp-3.11.4.tar.gz
cd protobuf-3.11.4
./configure
make -j16
#make check
make install
ldconfig # refresh shared library cache.
