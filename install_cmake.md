# Install CMake

We use CMake for project generating.

Official download page: [link](https://cmake.org/download/)

## Install CMake (Ubuntu)

Installing CMake on Ubuntu is quite straightforward. Note that you will be prompted for your password upon using `sudo`. Type:

```bash
sudo apt-get install cmake
sudo apt-get install cmake-curses-gui  # Recommended, as it contains ccmake.
```

## Install CMake 2.8.9 (Debian 6.0.10)

Make sure you have squeeze backports as APT sources set up as indicated on [yarp_devices_install_on_debian_6.md#the-specifics-apt-sources](https://github.com/roboticslab-uc3m/yarp-devices/blob/develop/doc/yarp_devices_install_on_debian_6.md#the-specifics-apt-sources).

Then run the following lines from a terminal. Note that you will be prompted for your password upon using `sudo`.

```bash
sudo apt-get update
sudo apt-get install -t squeeze-backports cmake cmake-curses-gui
```
