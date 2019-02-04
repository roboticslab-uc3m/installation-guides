# Install tensorflow_cc

- [Introduction](#introduction)
- [Requeriments](#requeriments)
- [Install Ubuntu 18.04 requirements](#install-ubuntu-18.04-requirements)
- [Install Ubuntu 14.04 requirements](#install-ubuntu-14.04-requirements)
- [Install tensorflow_cc](#install-tensorflow_cc)
- [Add tensorflow_cc to cmake project](add-tensorflow_cc-to-cmake-project)
- [Original source](#original-source)

## Introduction

Install `tensorflow_cc` to use Tensorflow C++ API without using `bazel`. Use `cmake` to build your project using `tensorflow_cc` as library to use Tensorflow C++ API.

## Requirements

Install your distro requirements.

### Install Ubuntu 18.04 requirements

1. Install `Ubuntu 18.04` requirements:

```bash

sudo apt-get install build-essential curl git cmake unzip autoconf autogen automake libtool mlocate \
                     zlib1g-dev g++-7 python python3-numpy python3-dev python3-pip python3-wheel wget
sudo updatedb

```

### Install Ubuntu 14.04 requirements

1. Install `Ubuntu 14.04` requirements:

```bash

sudo apt-get install build-essential curl git cmake unzip autoconf autogen automake libtool mlocate \
                     zlib1g-dev python python3-numpy python3-dev python3-pip python3-wheel wget
sudo updatedb

```

2. Install `GCC7`:

Ubuntu 14.04 `Trusty` doesn´t support `GCC7` in standard repositories. You´ll need to add externar repository

```bash

sudo apt-get update -y && \
sudo apt-get upgrade -y && \
sudo apt-get dist-upgrade -y && \
sudo apt-get install build-essential software-properties-common -y && \
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
sudo apt-get update -y && \
sudo apt-get install gcc-7 g++-7 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7 && \
sudo update-alternatives --config gcc

```

## Install tensorflow_cc

1. Clone ´tensorflow_cc` repository:

```bash

git clone https://github.com/FloopCZ/tensorflow_cc.git
cd tensorflow_cc

```

2. Build and install ´tensorflow_cc` as a library:

There are two diferent types of libraries, shared and static.

**Static library:**

- Default
- Faster to build
- No GPU support
- Basic functionalities


```bash
cd tensorflow_cc
mkdir build && cd build
cmake ..
make && sudo make install
```
**Shared library:**

- Requires install [bazel](https://github.com/roboticslab-uc3m/installation-guides/blob/master/install-bazel.md)
- Slower to build
- GPU support
- Full Tensorflow C++ API

```bash
cd tensorflow_cc
mkdir build && cd build
# for shared library only (requires Bazel):
cmake -DTENSORFLOW_STATIC=OFF -DTENSORFLOW_SHARED=ON ..
make && sudo make install
```

**WARNING:** Intel CPU older than *[ivybridge](https://ark.intel.com/es-es/products/codename/29902/Ivy-Bridge)*:
```bash

export CC_OPT_FLAGS="-march=native"

``` 

## Add tensorflow_cc to cmake project


Add to your `CMakeLists.txt` as a library
```bash

find_package(TensorflowCC REQUIRED)

# Link the static Tensorflow library.
target_link_libraries(project_name TensorflowCC::Static)

# Altenatively, link the shared Tensorflow library.
# target_link_libraries(project_name TensorflowCC::Shared)

```

If you use `Shared` library `CUDA` is available.

```bash

# For shared library setting, you may also link cuda if it is available.
# find_package(CUDA)
# if(CUDA_FOUND)
#   target_link_libraries(example ${CUDA_LIBRARIES})
# endif()

```
## Original source

[FloopCZ: tensorflow_cc](https://github.com/FloopCZ/tensorflow_cc) project.
