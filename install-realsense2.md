# Install realsense2

Official source code repository and binary packages: [IntelRealSense/librealsense](https://github.com/IntelRealSense/librealsense)

## Install realsense2 from binary distribution (Ubuntu 16.04 Xenial, 18.04 Bionic and 20.04 Focal)

We'll just follow the [official docs](https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md) ([perma](https://github.com/IntelRealSense/librealsense/blob/34fc284d537a4b873a37b737a61f1f1da92dbb60/doc/distribution_linux.md)):

1. Register the server's public key:

   ```bash
   sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
   ```

1. Add the server to the list of repositories:

   - Ubuntu 20.04 Focal:

   ```bash
   sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo focal main" -u
   ```

   - Ubuntu 18.04 Bionic:

   ```bash
   sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
   ```

   - Ubuntu 16.04 Xenial:

   ```bash
   sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u
   ```

1. Install packages:

   ```bash
   sudo apt install librealsense2-dkms librealsense2-utils librealsense2-dev
   ```

1. Verify installation:

   - Reconnect the Intel RealSense depth camera and run: `realsense-viewer`
   - Verify that the kernel is updated: `modinfo uvcvideo | grep "version:"` should include the `realsense` string

## Install realsense2 from sources (Ubuntu 14.04 Trusty and 20.04 Bionic)

There is an extensive guide [here](https://github.com/IntelRealSense/librealsense/blob/master/doc/installation.md) ([perma](https://github.com/IntelRealSense/librealsense/blob/34fc284d537a4b873a37b737a61f1f1da92dbb60/doc/installation.md)).
The following steps have been tested on Ubuntu 20.04 (Focal), including a few hints from [this issue](https://github.com/IntelRealSense/librealsense/issues/6436):

```bash
sudo apt install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev libusb-1.0-0-dev
mkdir -p ~/repos && cd ~/repos
git clone https://github.com/IntelRealSense/librealsense
mkdir -p librealsense/build && cd librealsense/build
cmake .. -DFORCE_RSUSB_BACKEND=true -DCMAKE_BUILD_TYPE=release
make -j$(nproc)
sudo make install
```

You'll need to copy or symlink udev rules prior to using the camera:

```bash
sudo ln -s ~/repos/librealsense/config/99-realsense-libusb.rules /etc/udev/rules.d/99-realsense-libusb.rules
```

## Working setups

- Ubuntu 20.04 Focal: Kernel `5.4.0-53-generic`. Via `sudo apt install librealsense2-dkms` got `modinfo uvcvideo | grep "version:"` to return `version: 1.1.2.realsense-1.3.16
srcversion: 7DDF3FE59FEE362F69D0241`. Due to Ubuntu system dependencies (mostly graphical/`libgtk-3-dev`-related), had to compile apart. Used `v2.29.0` to maintain installation close to that of Ubuntu 18.04 Bionic machine (at time of writing, below), got `realsense-viewer` which was compatible with sensor firmware `05.11.15.00`. Again, only recognizes USB 2.1, and have to set 6 fps.

- Ubuntu 18.04 Bionic: Kernel `4.15.0-126-generic` (`linux-image-generic` with `linux-headers-generic`). Via `sudo apt install librealsense2-dkms` got `modinfo uvcvideo | grep "version:"` to return `version: 1.1.2.realsense-1.3.14 srcversion: BE1821F94C3D410077ACD10`. Due to ROS Melodic dependencies (mostly graphical/`libgtk-3-dev`-related), had to compile apart, `v2.29.0`, got `realsense-viewer` which helped upgrade the sensor firmware to `05.11.15.00` and finally get rid of the "recognized as Keyboard" (as well as the `uvcvideo: Failed to query (GET_CUR) UVC control 1 on unit 3`). Aditionally, only recognizes USB 2.1, and have to set 6 fps.
