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

Older versions were reported to lack OpenSSL support needed for downloading external data through `file(DOWNLOAD)` commands. In that case, you'll need to install any required dependencies and compile CMake by yourself. E.g. for CMake 2.8.9 on Ubuntu 12.04:

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

## Install CMake 2.8.9 (Debian 6.0.10)

Make sure you have squeeze backports as APT sources set up as indicated on [yarp_devices_install_on_debian_6.md#the-specifics-apt-sources](https://github.com/roboticslab-uc3m/yarp-devices/blob/develop/doc/yarp_devices_install_on_debian_6.md#the-specifics-apt-sources).

Then run the following lines from a terminal. Note that you will be prompted for your password upon using `sudo`.

```bash
sudo apt-get update
sudo apt-get install -t squeeze-backports cmake cmake-curses-gui
```
