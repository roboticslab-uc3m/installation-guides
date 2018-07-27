# Install CMake

We use CMake for project generating.

Official download page: [link](https://cmake.org/download/)

## Install CMake (Ubuntu)

Installing CMake on Ubuntu is quite straightforward. Note that you will be prompted for your password upon using `sudo`. Type:

```bash
sudo apt install cmake
sudo apt install cmake-curses-gui  # Recommended, as it contains ccmake.
```

### Ubuntu 14.04 backports

CMake packages up to release 2.8.12 are distributed on Ubuntu Trusty (14.04). However, a CMake 3.5 backport is also included in the oficial repositories.

```bash
sudo apt update
sudo apt install cmake3
sudo apt install cmake3-curses-gui  # Recommended, includes ccmake
```

### Ubuntu 12.04 backports

CMake packages up to release 2.8.7 are distributed on Ubuntu precise (12.04). However, you can pull and install CMake 2.8.11.2 from an additional repository:

```bash
sudo add-apt-repository ppa:kalakris/cmake
sudo apt-get update
sudo apt-get install cmake
```

### OpenSSL support

OpenSSL support is required to download external data through the `file(DOWNLOAD)` command when a secure protocol is requested (e.g. `https://`). *Unsupported protocol* errors as described in [this issue](https://github.com/roboticslab-uc3m/installation-guides/issues/49) may arise when CMake was built from scratch without having set the appropriate options, also apt packages for older distros (such as Ubuntu 12.04) could lack this feature. For CMake 2.8.9 on Ubuntu 12.04:

```bash
sudo apt install cmake # get CMake 2.8.7 first
sudo apt install libcurl4-openssl-dev
cd && mkdir -p repos && cd repos
git clone https://github.com/kitware/cmake
cd cmake
git checkout tags/v2.8.9
mkdir build && cd build
cmake .. -DCMAKE_USE_SYSTEM_CURL:BOOL=ON -DCMAKE_USE_OPENSSL:BOOL=ON
make -j$(nproc)
sudo make install
hash -r # rebuild executable cache to use new 'cmake' (2.8.9) command
```
