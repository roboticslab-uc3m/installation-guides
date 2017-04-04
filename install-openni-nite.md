# Install OpenNI2 & NiTE2

We use OpenNI2 for ASUS and Kinect support.

## Install Xtion Pro Live OpenNI driver (Ubuntu)

```bash
sudo apt-get install libopenni-sensor-primesense0 
```

## Install OpenNI2 (Ubuntu)

```bash
sudo apt-get install git libusb-1.0-0-dev libudev-dev  # libpcl-dev & pcl-tools instead of libpcl-all-dev as of Dic/2015
sudo apt-get install openjdk-6-jdk  # if not using other java version
sudo apt-get install freeglut3-dev
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/occipital/OpenNI2.git  # We used to have a fork off 6857677beee08e264fc5aeecb1adf647a7d616ab with working copy of Xtion Pro Live OpenNI2 driver.
cd OpenNI2 && make
sudo ln -s $PWD/Bin/x64-Release/libOpenNI2.so /usr/local/lib/  # $PWD should be /yourPathTo/OpenNI2
sudo ln -s $PWD/Bin/x64-Release/OpenNI2/ /usr/local/lib/  # $PWD should be /yourPathTo/OpenNI2
sudo ln -s $PWD/Include /usr/local/include/OpenNI2  # $PWD should be /yourPathTo/OpenNI2
sudo ldconfig
```

## Install NiTE2.2 (Ubuntu)

```bash
cd  # go home
mkdir -p src; cd src  # create $HOME/src if it doesn't exist; then, enter it
wget https://sourceforge.net/projects/roboticslab/files/External/nite/NiTE-Linux-x64-2.2.tar.bz2
tar xvf NiTE-Linux-x64-2.2.tar.bz2
sudo ln -s $PWD/NiTE-Linux-x64-2.2/Redist/libNiTE2.so /usr/local/lib/  # $PWD should be /yourPathTo/NiTE-Linux-x64-2.2/..
sudo ln -s $PWD/NiTE-Linux-x64-2.2/Include /usr/local/include/NiTE-Linux-x64-2.2  # $PWD should be /yourPathTo/NiTE-Linux-x64-2.2/..
sudo ldconfig
```
