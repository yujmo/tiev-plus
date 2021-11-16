# Install the required libraries that are available as debs.
apt-get install -y \
    clang \
    g++ \
    git \
    libboost-all-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libeigen3-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    liblua5.2-dev
#    python-sphinx
#    google-mock \
#    ninja-build \

#
#VERSION="1.13.0"
#
## Build and install Ceres.
#cd /tmp
#git clone https://ceres-solver.googlesource.com/ceres-solver
#cd ceres-solver
#git checkout tags/${VERSION}
#mkdir build
#cd build
#cmake .. -G Ninja -DCXX11=ON
#ninja
#CTEST_OUTPUT_ON_FAILURE=1 ninja test
#sudo ninja install
#
#VERSION="v3.4.1"
#
## Build and install proto3.
#cd ../../
#git clone https://github.com/google/protobuf.git
#cd protobuf
#git checkout tags/${VERSION}
#mkdir build
#cd build
#cmake -G Ninja \
#  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
#  -DCMAKE_BUILD_TYPE=Release \
#  -Dprotobuf_BUILD_TESTS=OFF \
#  ../cmake
#ninja
#sudo ninja install
