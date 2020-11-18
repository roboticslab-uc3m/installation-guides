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

The latest CMake release per distro (cmake 3.18.4 as of 2020/11/18) is available via Kitware's PPA:

```bash
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
```

```bash
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt-get update
```

Then, download and install CMake:

```bash
sudo apt install cmake
sudo apt install cmake-curses-gui  # Recommended, includes ccmake.
```

### Other providers

CMake has been traditionally available via the Canonical PPA. Note, however, that these packages may contain versions that are older (cmake 3.10.2 as of 2020/11/18) than those published in the Kitware PPA and thus break builds with recent software. Skip adding other repositories and simply:

```bash
sudo apt install cmake
sudo apt install cmake-curses-gui  # Recommended, includes ccmake.
```

In addition, a pip wheels release exists: [ref](https://pypi.org/project/cmake/).
