# Install tensorflow_cc

We use `tensorflow_cc` for Tensorflow C++ API without using Bazel. Official page: [link](https://github.com/FloopCZ/tensorflow_cc)

- [Install tensorflow_cc (Ubuntu)](#install-tensorflow_cc-(Ubuntu))


# Install tensorflow_cc (Ubuntu)

Installing `tensorflow_cc` on Ubuntu to use Tensorflow C++ API without using `bazel`. Use `cmake` to build your project using `tensorflow_cc` as library to access Tensorflow C++ API.

Installing `tensorflow_cc` requeriments.

```bash

sudo apt-get install build-essential curl git cmake unzip autoconf autogen automake libtool mlocate \
                     zlib1g-dev g++-7 python python3-numpy python3-dev python3-pip python3-wheel wget
sudo updatedb
git clone https://github.com/FloopCZ/tensorflow_cc.git
cd tensorflow_cc

```
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
cmake -DTENSORFLOW_STATIC=OFF -DTENSORFLOW_SHARED=ON ..
make && sudo make install
```

## Note for Ubuntu 14.04 & 16.04

Ubuntu 14.04 & 16.04 doesn´t allow GCC7 installation direcly, you should add `ubuntu-toolchain-r/test` repository to install.


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


## Note for Intel CPU oldet than ivybridge

Intel CPU older than *[ivybridge](https://ark.intel.com/es-es/products/codename/29902/Ivy-Bridge)*:
```bash

export CC_OPT_FLAGS="-march=native"

```
