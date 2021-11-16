#!/bin/bash

# Fail on first error
set -e

cd /bak

# Install dependencies
apt-get clean
apt-get update

apt-get -y remove x264 libx264-dev

apt-get -y install unzip wget
apt-get -y install build-essential checkinstall cmake pkg-config yasm
apt-get -y install git gfortran
apt-get -y install libjpeg8-dev libpng-dev

apt-get -y install software-properties-common
add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
apt-get -y update

apt-get -y install libjasper1
apt-get -y install libtiff-dev
apt-get -y install libcurl4-gnutls-dev
apt-get -y install zlib1g-dev

apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
apt-get -y install libxine2-dev libv4l-dev
cd /usr/include/linux
ln -s -f ../libv4l1-videodev.h videodev.h
cd /bak

apt-get -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
apt-get -y install libgtk2.0-dev libtbb-dev qt5-default
apt-get -y install libatlas-base-dev
apt-get -y install libfaac-dev libmp3lame-dev libtheora-dev
apt-get -y install libvorbis-dev libxvidcore-dev
apt-get -y install libopencore-amrnb-dev libopencore-amrwb-dev
apt-get -y install libavresample-dev
apt-get -y install x264 v4l-utils

# Optional dependencies
apt-get -y install libprotobuf-dev protobuf-compiler
apt-get -y install libgoogle-glog-dev libgflags-dev
apt-get -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

# Get OpenCV 3.4.10 source code
# wget https://github.com/opencv/opencv/archive/3.4.10.zip
# wget -O opencv.zip https://github.com/opencv/opencv/archive/3.4.10.zip
# wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.4.10.zip
unzip opencv.zip && unzip opencv_contrib.zip && mv opencv-3.4.10 opencv && mv opencv_contrib-3.4.10 opencv_contrib 

unzip No_boostdesc_bgm.i.zip && cp No_boostdesc_bgm.i/* opencv_contrib/modules/xfeatures2d/src/

echo 'INCLUDE_DIRECTORIES("/bak/opencv_contrib/modules/xfeatures2d/include/opencv2/xfeatures2d")' >> /bak/opencv/modules/stitching/CMakeLists.txt

sed -i 's/opencv2\/xfeatures2d\/cuda.hpp/\/bak\/opencv_contrib\/modules\/xfeatures2d\/include\/opencv2\/xfeatures2d\/cuda.hpp/g' /bak/opencv/modules/stitching/include/opencv2/stitching/detail/matchers.hpp

sed -i 's/opencv2\/xfeatures2d\/cuda.hpp/\/bak\/opencv_contrib\/modules\/xfeatures2d\/include\/opencv2\/xfeatures2d\/cuda.hpp/g' /bak/opencv/modules/stitching/src/precomp.hpp

sed -i 's/opencv2\/core\/cuda.hpp/\/bak\/opencv_contrib\/modules\/xfeatures2d\/include\/opencv2\/xfeatures2d\/cuda.hpp/g' /bak/opencv/modules/stitching/include/opencv2/stitching/detail/blenders.hpp

sed -i 's/opencv2\/core\/cuda.hpp/\/bak\/opencv_contrib\/modules\/xfeatures2d\/include\/opencv2\/xfeatures2d\/cuda.hpp/g' /bak/opencv/modules/stitching/include/opencv2/stitching/detail/warpers.hpp

sed -i 's/opencv2\/xfeatures2d\/cuda.hpp/\/bak\/opencv_contrib\/modules\/xfeatures2d\/include\/opencv2\/xfeatures2d\/cuda.hpp/g' /bak/opencv/modules/stitching/src/matchers.cpp

sed -i 's/opencv2\/xfeatures2d\/cuda.hpp/\/bak\/opencv_contrib\/modules\/xfeatures2d\/include\/opencv2\/xfeatures2d\/cuda.hpp/g' /bak/opencv/modules/stitching/src/matchers.cpp

sed -i 's/opencv2\/xfeatures2d.hpp/\/bak\/opencv_contrib\/modules\/xfeatures2d\/include\/opencv2\/xfeatures2d.hpp/g' /bak/opencv/modules/stitching/src/matchers.cpp

sed -i 's/opencv2\/xfeatures2d\/nonfree.hpp/\/bak\/opencv_contrib\/modules\/xfeatures2d\/include\/opencv2\/xfeatures2d\/nonfree.hpp/g' /bak/opencv_contrib/modules/xfeatures2d/include/opencv2/xfeatures2d.hpp

# opencv_contrib-3.4.10/modules/xfeatures2d/include/opencv2/xfeatures2d

cd opencv
# Compile
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D WITH_CUDA=OFF \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=/bak/opencv_contrib/modules \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D BUILD_EXAMPLES=OFF \
    -D WITH_TBB=ON \
    -D WITH_V4L=ON \
    -D WITH_QT=ON \
    -D WITH_OPENGL=ON \
    ..
make -j8
make install
