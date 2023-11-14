# Install Eigen

This package contains the Eigen C++ template library and development files.

## Install Eigen3 (Ubuntu)

Installing Eigen3 on Ubuntu is quite straightforward. Note that you will be prompted for your password upon using `sudo`. Type:

```bash
sudo apt install libeigen3-dev
```

## Install Eigen3 (Windows)

* Download the desired release from http://eigen.tuxfamily.org.
* Unzip in the location of your choice, preferrably at `C:\` or `C:\Program files` for better discoverability by CMake find-modules (remember to extract the inner folder and rename it to `Eigen3` or `Eigen`).
