#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y software-properties-common
add-apt-repository -y ppa:ubuntu-toolchain-r/test 2>&1
apt-get update
apt-get install -y gcc-8 g++-8 gfortran-8
which gcc 2>/dev/null || update-alternatives --remove-all gcc 2>/dev/null
which g++ 2>/dev/null || update-alternatives --remove-all g++ 2>/dev/null
which gfortran 2>/dev/null || update-alternatives --remove-all gfortran 2>/dev/null
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 20
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 20
update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-8 20
update-alternatives --config gcc
update-alternatives --config g++
update-alternatives --config gfortran

gcc --version
g++ --version
gfortran --version
