# Install OpenNI2 & NiTE2

```bash
# Xtion Pro Live OpenNI driver
sudo apt-get install libopenni-sensor-primesense0 
```

```bash
# OpenNI2
sudo apt-get install git libusb-1.0-0-dev libudev-dev  # libpcl-dev & pcl-tools instead of libpcl-all-dev as of Dic/2015
sudo apt-get install openjdk-6-jdk  # if not using other java version
sudo apt-get install freeglut3-dev
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/roboticslab-uc3m/OpenNI2.git  # Fork with working copy of Xtion Pro Live OpenNI2 driver.
cd OpenNI2 && make
sudo ln -s $PWD/Bin/x64-Release/libOpenNI2.so /usr/local/lib/  # $PWD should be /yourPathTo/OpenNI2
sudo ln -s $PWD/Bin/x64-Release/OpenNI2/ /usr/local/lib/  # $PWD should be /yourPathTo/OpenNI2
sudo ln -s $PWD/Include /usr/local/include/OpenNI2  # $PWD should be /yourPathTo/OpenNI2
sudo ldconfig
```

```bash
# NiTE2.2
cd  # go home
mkdir -p src; cd src  # make $HOME/src if it doesn't exist; then, enter it
wget https://sourceforge.net/projects/roboticslab/files/External/nite/NiTE-Linux-x64-2.2.tar.bz2
tar xvf NiTE-Linux-x64-2.2.tar.bz2
sudo ln -s $PWD/NiTE-Linux-x64-2.2/Redist/libNiTE2.so /usr/local/lib/  # $PWD should be /yourPathTo/NiTE-Linux-x64-2.2/..
sudo ln -s $PWD/NiTE-Linux-x64-2.2/Include /usr/local/include/NiTE-Linux-x64-2.2  # $PWD should be /yourPathTo/NiTE-Linux-x64-2.2/..
sudo ldconfig
```
