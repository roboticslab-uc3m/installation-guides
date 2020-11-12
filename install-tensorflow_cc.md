# Install tensorflow_cc

We use `tensorflow_cc` for Tensorflow C++ API. Use `cmake` to build your project using `tensorflow_cc` as library. Official page: [FloopCZ/tensorflow_cc](https://github.com/FloopCZ/tensorflow_cc)

Also see [install-tensorflow](install-tensorflow.md) for the official alternative (less prepared for use with CMake).

## Install dependencies (Ubuntu 18.04)

Download and install requirements.

```bash
sudo apt-get install build-essential curl git cmake unzip autoconf autogen automake libtool mlocate zlib1g-dev g++-7 python python3-numpy python3-dev python3-pip python3-wheel wget realpath
```

## Install dependencies (Ubuntu 14.04 and 16.04)
Download and install requirements.
```bash
sudo apt-get install build-essential curl git cmake unzip autoconf autogen automake libtool mlocate zlib1g-dev python python3-numpy python3-dev python3-pip python3-wheel wget realpath
```
Ubuntu 14.04 and 16.04 doesn´t allow GCC7 installation direcly, you should add `ubuntu-toolchain-r/test` repository to install.

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

## Install tensorflow_cc (Ubuntu)
You can create two diferent types of libraries: Shared (recommended) or Static.

### Shared library
Will create CMake target `tensorflow_cc::Shared`, which we use in [roboticslab-uc3m/vision](https://github.com/roboticslab-uc3m/vision) (recommended).
- Requires install [bazel](install-bazel.md)
- Slower to build
- GPU support
- Full Tensorflow C++ API

Download and install:
```bash
git clone https://github.com/FloopCZ/tensorflow_cc.git
cd tensorflow_cc/tensorflow_cc
mkdir build && cd build
cmake -DTENSORFLOW_STATIC=OFF -DTENSORFLOW_SHARED=ON ..
make # No need for -j$(nproc), bazel will use all CPUs anyway
sudo make install
```

### Static library
Will create CMake target `tensorflow_cc::Static`.
- Default
- Faster to build
- No GPU support
- Basic functionalities

Download and install:
```bash
git clone https://github.com/FloopCZ/tensorflow_cc.git
cd tensorflow_cc/tensorflow_cc
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
```

## Troubleshooting

### Note for Intel CPU older than ivybridge
Intel CPU older than [ivybridge](https://ark.intel.com/content/www/es/es/ark/products/codename/29902/ivy-bridge.html):
```bash
export CC_OPT_FLAGS="-march=native"
```

## Working setups
Related: [install-tensorflow#working-setups](install-tensorflow.md#working-setups)

### tiago-entrenamiento
- <https://github.com/FloopCZ/tensorflow_cc/commit/18af480b99a9b5d07333fc7b6dfd4d3313fb6d0f>

## Non-working setups
Related: [install-tensorflow#non-working-setups](install-tensorflow.md#non-working-setups)

- Careful with Bazel versions, e.g. [Oct 23 2019 commit 4338525](https://github.com/FloopCZ/tensorflow_cc/commit/4338525e47d3aedd5e8c7e546f85ee06de97270a) specifies `0.26.1`.
