# Install YARP

We use YARP for communications. Installing YARP on Ubuntu is quite straightforward. </br> 
Note that you will be prompted for your password upon using '''sudo''' a couple of times. </br>
For additional options use ccmake instead of cmake.
Official download page: [link](http://www.yarp.it/) 

## Install YARP (Debian 6.0)

```bash
sudo apt-get install build-essential libace-dev subversion git
sudo apt-get install libgsl0-dev  # Needed for creating YARP lib_math we use for kinematics
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/yarp
cd yarp; mkdir build; cd build
cmake .. -DCREATE_LIB_MATH=ON -DYARP_USE_QT5=OFF  # YARP_USE_QT5 can induce errors as of 02/2016.
make -j3;  sudo make install; sudo ldconfig; cd  # go home
```

## Install YARP (Ubuntu 14.10)

```bash
sudo apt-get install build-essential libace-dev subversion git
sudo apt-get install libgsl0-dev  # Needed for creating YARP lib_math we use for kinematics
sudo apt-get install libgtkmm-2.4-dev  # Needed for YARP GUIs: yarpview, gyarpmanager
sudo apt-get install libjpeg8-dev   # Needed for mjpeg_carrier for ravebot cam on web
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/yarp
cd yarp; mkdir build; cd build
cmake .. -DCREATE_LIB_MATH=ON -DCREATE_GUIS=ON -DCREATE_OPTIONAL_CARRIERS=ON -DENABLE_yarpcar_mjpeg_carrier=ON -DYARP_USE_QT5=OFF  # YARP_USE_QT5 can induce errors as of 02/2016.
make -j3;  sudo make install; sudo ldconfig; cd  # go home
```

## Install YARP (Ubuntu 15.04)

```bash
# YARP
sudo apt-get install build-essential cmake cmake-curses-gui libace-dev
sudo apt-get install libgsl0-dev  # Needed for creating YARP lib_math
sudo apt-get install libgtkmm-2.4-dev  # Needed for YARP GUIs, e.g. yarpview
sudo apt-get install libjpeg8-dev   # Needed for mjpeg_carrier
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/yarp
cd yarp && mkdir build && cd build
cmake .. -DCREATE_SHARED_LIBRARY=OFF -DCREATE_LIB_MATH=ON -DCREATE_GUIS=ON -DCREATE_OPTIONAL_CARRIERS=ON -DENABLE_yarpcar_mjpeg_carrier=ON -DCREATE_DEVICE_LIBRARY_MODULES=ON -DENABLE_yarpmod_OpenNI2DeviceServer=ON -DOPENNI2_INCLUDE_LOCAL=/usr/local/include/OpenNI2/ -DOPENNI2_LIBRARY=/usr/local/lib/libOpenNI2.so -DNITE2_INCLUDE_LOCAL=/usr/local/include/NiTE-Linux-x64-2.2 -DNITE2_LIBRARY=/usr/local/lib/libNiTE2.so -DYARP_USE_QT5=OFF  # YARP_USE_QT5 can induce errors as of 02/2016. Force it off fixes #15.
make
sudo make install
sudo ldconfig
# you can now launch "yarpdev --device OpenNI2DeviceServer" from /YOUR_PATH_TO/NiTE-Linux-x64-2.2/Redist
```
