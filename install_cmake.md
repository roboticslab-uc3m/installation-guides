# Install CMake

We use CMake for project generating.

Official download page: [link](https://cmake.org/download/)

## Install CMake (Ubuntu)

Installing CMake on Ubuntu is quite straightforward. Note that you will be prompted for your password upon using `sudo`. Type:

```bash
sudo apt-get install cmake
sudo apt-get install cmake-curses-gui  # Recommended, as it contains ccmake.
```

## Install CMake (Debian 6.0)

```bash
deb http://backports.debian.org/debian-backports/ squeeze-backports main
```

to your /etc/apt/sources.list file. Then run the following lines from a terminal. Note that you will be prompted for your password upon using `sudo`.

```bash
sudo apt-get update
sudo apt-get install -t squeeze-backports cmake cmake-curses-gui
```
