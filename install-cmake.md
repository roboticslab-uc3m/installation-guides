# Install CMake

We use CMake for project generating.

Official download page: <https://cmake.org/download/>.

Legacy documentation regarding CMake installations can be found at: [(Legacy) Install CMake](legacy-install-cmake.md)

## Install CMake (Ubuntu 20.04 Focal)

```bash
sudo apt install cmake
sudo apt install cmake-curses-gui  # Recommended, includes ccmake.
```

## Install CMake (Ubuntu 18.04 Bionic)

The latest CMake release is available via Kitware's PPA:

```bash
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
```

```bash
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt-get update
```

Then, download and install CMake:

```bash
sudo apt install cmake # ubuntu 18.04: cmake 3.18.4
sudo apt install cmake-curses-gui  # Recommended, includes ccmake.
```

## Install CMake (Ubuntu 16.04 Xenial)

The latest CMake release is available via Kitware's PPA:

```bash
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
```

```bash
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
sudo apt-get update
```

Then, download and install CMake:

```bash
sudo apt install cmake
sudo apt install cmake-curses-gui  # Recommended, includes ccmake.
```

## Other providers

CMake has been traditionally available via the Canonical PPA. Note, however, that these packages may contain versions that are older than those published in the Kitware PPA and thus break builds with recent software.

```bash
sudo apt install cmake # ubuntu 18.04: cmake 3.10.2.
sudo apt install cmake-curses-gui  # Recommended, includes ccmake.
```

In addition, a pip wheels release exists: [ref](https://pypi.org/project/cmake/).

### OpenSSL support (older distros and building from sources)

OpenSSL support is required to download external data through the `file(DOWNLOAD)` command when a secure protocol is requested (e.g. `https://`). *Unsupported protocol* errors as described in [this issue](https://github.com/roboticslab-uc3m/installation-guides/issues/49) may arise when CMake was built from source without having set the appropriate options, also apt packages for older distros (such as Ubuntu 12.04) could lack this feature. For CMake 2.8.9 on Ubuntu 12.04:

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
