# Install YARP

We use YARP for communications. Installing YARP on Ubuntu is quite straightforward.

Note that you will be prompted for your password upon using `sudo` a couple of times. 

For additional options use ccmake instead of cmake.

Official download page: [link](http://www.yarp.it/) 

## Install YARP 2.3.68+ (Debian 6.0.10)

```bash
sudo apt-get install build-essential libace-dev subversion git
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/yarp
git checkout e1221283abb1abc77619429bb4d9408cbb1cf6c8  # Corresponds to 2.3.68+181-20170203.11+gite122128
cd yarp; mkdir build; cd build
cmake .. -DYARP_NO_DEPRECATED_WARNINGS=ON  # YARP_DEPRECATED_MSG happened on 2.3.66.2 -> 2.3.68
make -j3;  sudo make install; sudo ldconfig; cd  # go home
```

## Install YARP (Ubuntu 14.04)

```bash
sudo apt-get install build-essential libace-dev subversion git
sudo apt-get install libeigen3-dev  # Needed for creating YARP lib_math we use for kinematics
sudo apt-get install libgtkmm-2.4-dev  # Needed for YARP GUIs: yarpview, gyarpmanager
sudo apt-get install qtbase5-dev qtdeclarative5-dev qtmultimedia5-dev qtdeclarative5-qtquick2-plugin qtdeclarative5-window-plugin qtdeclarative5-qtmultimedia-plugin qtdeclarative5-controls-plugin qtdeclarative5-dialogs-plugin libqt5svg5
sudo apt-get install libjpeg8-dev   # Needed for mjpeg_carrier for ravebot cam on web
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/yarp
cd yarp; mkdir build; cd build
cmake .. -DCREATE_LIB_MATH=ON -DCREATE_GUIS=ON -DCREATE_OPTIONAL_CARRIERS=ON -DENABLE_yarpcar_mjpeg_carrier=ON
make -j3;  sudo make install; sudo ldconfig; cd  # go home
```

## Install YARP (Ubuntu 14.10)

```bash
sudo apt-get install build-essential libace-dev subversion git
sudo apt-get install libeigen3-dev  # Needed for creating YARP lib_math we use for kinematics
sudo apt-get install libgtkmm-2.4-dev  # Needed for YARP GUIs: yarpview, gyarpmanager
sudo apt-get install qtbase5-dev qtdeclarative5-dev qtmultimedia5-dev qtdeclarative5-qtquick2-plugin qtdeclarative5-window-plugin qtdeclarative5-qtmultimedia-plugin qtdeclarative5-controls-plugin qtdeclarative5-dialogs-plugin libqt5svg5
sudo apt-get install libjpeg8-dev   # Needed for mjpeg_carrier for ravebot cam on web
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/yarp
cd yarp; mkdir build; cd build
cmake .. -DCREATE_LIB_MATH=ON -DCREATE_GUIS=ON -DCREATE_OPTIONAL_CARRIERS=ON -DENABLE_yarpcar_mjpeg_carrier=ON
make -j3;  sudo make install; sudo ldconfig; cd  # go home
```

## Install YARP with OpenNI2DeviceServer (Ubuntu 15.04)

Note: NiTE only required for skeletons.

```bash
sudo apt-get install build-essential cmake cmake-curses-gui libace-dev
sudo apt-get install libeigen3-dev  # Needed for creating YARP lib_math
sudo apt-get install libgtkmm-2.4-dev  # Needed for YARP GUIs, e.g. yarpview
sudo apt-get install qtbase5-dev qtdeclarative5-dev qtmultimedia5-dev qtdeclarative5-qtquick2-plugin qtdeclarative5-window-plugin qtdeclarative5-qtmultimedia-plugin qtdeclarative5-controls-plugin qtdeclarative5-dialogs-plugin libqt5svg5
sudo apt-get install libjpeg8-dev   # Needed for mjpeg_carrier
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/yarp
cd yarp && mkdir build && cd build
cmake .. -DCREATE_SHARED_LIBRARY=OFF -DCREATE_LIB_MATH=ON -DCREATE_GUIS=ON -DCREATE_OPTIONAL_CARRIERS=ON -DENABLE_yarpcar_mjpeg_carrier=ON -DCREATE_DEVICE_LIBRARY_MODULES=ON -DENABLE_yarpmod_OpenNI2DeviceServer=ON -DOPENNI2_INCLUDE_LOCAL=/usr/local/include/OpenNI2/ -DOPENNI2_LIBRARY=/usr/local/lib/libOpenNI2.so -DNITE2_INCLUDE_LOCAL=/usr/local/include/NiTE-Linux-x64-2.2 -DNITE2_LIBRARY=/usr/local/lib/libNiTE2.so
make
sudo make install
sudo ldconfig
```

You may need to launch `yarpdev --device OpenNI2DeviceServer` from /YOUR_PATH_TO/NiTE-Linux-x64-2.2/Redist if using NiTE.

## Note for Linux Mint 17.3 Rosa
```bash
sudo apt-get install libqt5opengl5-dev  # avoid error on yarpmanager/builder GUI
```
