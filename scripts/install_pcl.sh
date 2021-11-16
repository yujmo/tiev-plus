#!/bin/bash
mkdir /tmp/pcl && cd /tmp/pcl
wget https://github.com/PointCloudLibrary/pcl/archive/pcl-1.8.1.tar.gz -O pcl-1.8.1.tar.gz
tar zxf pcl-1.8.1.tar.gz
mkdir build
cd build
cmake ../pcl-pcl-1.8.1
make -j16
make test
make install
cd /tmp && rm -rf /tmp/pcl
