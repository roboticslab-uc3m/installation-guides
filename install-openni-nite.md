# Install OpenNI2 & NiTE2

We use OpenNI2 for ASUS and Kinect support.

# Set rules to avoid needing sudo

In order to allow a non-sudoer to read data from the sensors connected via USB port, you need to add a rule for udev system. 

Similar to the advice from [debian udev documentation](https://wiki.debian.org/udev), create `/etc/udev/rules.d/80-persistent-local-usb.rules` with the following contents:
```
KERNEL == "ttyUSB0", MODE = "0777"
```

## Install Xtion Pro Live OpenNI driver (Ubuntu)

```bash
sudo apt install libopenni-sensor-primesense0 
```

## Install OpenNI2 (Ubuntu)

```bash
sudo apt install git libusb-1.0-0-dev libudev-dev  # libpcl-dev & pcl-tools instead of libpcl-all-dev as of Dic/2015
sudo apt install openjdk-8-jdk  # for xenial; openjdk-6-jdk for trusty; if not using other java version.
sudo apt install freeglut3-dev
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/occipital/OpenNI2.git  # We used to have a fork off 6857677beee08e264fc5aeecb1adf647a7d616ab with working copy of Xtion Pro Live OpenNI2 driver.
cd OpenNI2
make -j$(nproc)  # compile
sudo ln -s $PWD/Bin/x64-Release/libOpenNI2.so /usr/local/lib/  # $PWD should be /yourPathTo/OpenNI2
sudo ln -s $PWD/Bin/x64-Release/OpenNI2/ /usr/local/lib/  # $PWD should be /yourPathTo/OpenNI2
sudo ln -s $PWD/Include /usr/local/include/OpenNI2  # $PWD should be /yourPathTo/OpenNI2
sudo ldconfig
```

## Install Kinect OpenNI2 driver (Ubuntu)

Yes! Support for ye-oldie Kinect v1, via compiling OpenNI2 support as documented [here](https://github.com/OpenKinect/libfreenect/tree/master/OpenNI2-FreenectDriver). Approximate commands:

```bash
sudo apt install libxmu-dev
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/OpenKinect/libfreenect
cd libfreenect && mkdir -p build
cmake .. -DBUILD_OPENNI2_DRIVER=ON
sudo make install
sudo ldconfig
sudo ln -s /usr/local/lib/OpenNI2-FreenectDriver/libFreenectDriver.so /usr/local/lib/OpenNI2/Drivers
```

## Install NiTE2.2 (Ubuntu)

For detecting skeletons, not mandatory for YARP since long ago.

```bash
cd  # go home
mkdir -p src; cd src  # create $HOME/src if it doesn't exist; then, enter it
wget https://sourceforge.net/projects/roboticslab/files/External/nite/NiTE-Linux-x64-2.2.tar.bz2
tar xvf NiTE-Linux-x64-2.2.tar.bz2
sudo ln -s $PWD/NiTE-Linux-x64-2.2/Redist/libNiTE2.so /usr/local/lib/  # $PWD should be /yourPathTo/NiTE-Linux-x64-2.2/..
sudo ln -s $PWD/NiTE-Linux-x64-2.2/Include /usr/local/include/NiTE-Linux-x64-2.2  # $PWD should be /yourPathTo/NiTE-Linux-x64-2.2/..
sudo ldconfig
```
