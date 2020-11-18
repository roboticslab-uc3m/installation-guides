# (Legacy) Install CMake

This is Legacy documentation regarding CMake installations. Updated CMake installation at: [Install CMake](install-cmake.md)

### Install CMake backports (Ubuntu 14.04)

CMake packages up to release 2.8.12 are distributed on Ubuntu Trusty (14.04). However, a CMake 3.5 backport is also included in the oficial repositories.

```bash
sudo apt update
sudo apt install cmake3
sudo apt install cmake3-curses-gui  # Recommended, includes ccmake
```

## Install CMake backports (Ubuntu 12.04)

CMake packages up to release 2.8.7 are distributed on Ubuntu precise (12.04). However, you can pull and install CMake 2.8.11.2 from an additional repository:

```bash
sudo add-apt-repository ppa:kalakris/cmake
sudo apt-get update
sudo apt-get install cmake
```
