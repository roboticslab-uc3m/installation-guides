# Install YARP

We use YARP for communications. Official page: [link](http://www.yarp.it/) 

## Install YARP (Ubuntu)

Installing YARP on Ubuntu is quite straightforward.

Note that you will be prompted for your password upon using `sudo` a couple of times. 

As can be seen, here we are accounting for: YARP `lib_math`, the GUIs and `mjpeg` carrier.

```bash
sudo apt install build-essential libace-dev subversion git
sudo apt install libeigen3-dev  # Needed for creating YARP lib_math used for kinematics, etc.
sudo apt install qtbase5-dev qtdeclarative5-dev qtmultimedia5-dev qtdeclarative5-qtquick2-plugin qtdeclarative5-window-plugin qtdeclarative5-qtmultimedia-plugin qtdeclarative5-controls-plugin qtdeclarative5-dialogs-plugin libqt5svg5
sudo apt install libjpeg8-dev   # Needed for mjpeg carrier
sudo apt install libedit-dev  # Enables keyboard arrow keys within an RPC communication channel via terminal
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/yarp
cd yarp; mkdir build; cd build
cmake .. -DCREATE_LIB_MATH=ON -DCREATE_GUIS=ON -DCREATE_OPTIONAL_CARRIERS=ON -DENABLE_yarpcar_mjpeg=ON # configure
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
```

For additional options use `ccmake` instead of `cmake`.

## Install ROS support

Make sure you have installed previously YARP and that the ROS environment is not sourced, as it causes the build to fail.
If you have the line `source /opt/ros/indigo/setup.bash` at the end of ~/.bashrc, comment it, save the file and open a new terminal.

```bash
cd  # go home
cd repos/yarp/build
cmake .. -DCREATE_OPTIONAL_CARRIERS=ON -DENABLE_yarpcar_mjpeg_carrier=ON -DENABLE_yarpcar_tcpros_carrier=ON -DENABLE_yarpcar_xmlrpc_carrier=ON
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
```


## Install Python bindings

Swig is needed in order to build the python bindings. It is normally installed with
```bash
sudo apt update
sudo apt install swig
sudo apt install libpython-dev  # not installed by default on clean distros
```

**Note:** If you are on Ubuntu Trusty (14.04), you have to install swig3.0 instead of swig
```bash
sudo apt install swig3.0
```

Make sure you have installed previously YARP.
```bash
cd  # go home
cd repos/yarp/build
cmake .. -DYARP_COMPILE_BINDINGS=ON -DCREATE_PYTHON=ON
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
```

## Install additional YARP device: OpenNI2DeviceServer (Ubuntu)

Make sure you have previously installed YARP and:
 
- [Install OpenNI2 & NiTE2](install-openni-nite.md)

```bash
cd  # go home
cd repos/yarp/build
cmake .. -DCREATE_DEVICE_LIBRARY_MODULES=ON -DENABLE_yarpmod_OpenNI2DeviceServer=ON -DENABLE_yarpmod_OpenNI2DeviceClient=ON -DOpenNI2_INCLUDE_DIR=/usr/local/include/OpenNI2/ -DOpenNI2_LIBRARY=/usr/local/lib/libOpenNI2.so
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
```
You should now be able to launch `yarpdev --device OpenNI2DeviceServer`. It is a complex device, see options with `yarpdev --device OpenNI2DeviceServer` or example [here](https://github.com/roboticslab-uc3m/teo-configuration-files/blob/ee168eaf61454113b1ac7113fbb24e10af679bc3/share/teoBase/scripts/teoBase.xml#L35-L36).

### Install additional YARP device: OpenNI2DeviceServer (Ubuntu) with NiTE (skeletons)
NiTE only required for skeletons.
```bash
cd  # go home
cd repos/yarp/build
cmake .. -DNITE2_INCLUDE_LOCAL=/usr/local/include/NiTE-Linux-x64-2.2 -DNITE2_LIBRARY=/usr/local/lib/libNiTE2.so
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
```
You may need to launch `yarpdev --device OpenNI2DeviceServer` from `/YOUR_PATH_TO/NiTE-Linux-x64-2.2/Redist` if using NiTE.

## Note for Linux Mint 17.3 Rosa
```bash
sudo apt install libqt5opengl5-dev  # avoid error on yarpmanager/builder GUI
```

## Install YARP (Windows)

Binary releases usually work well: http://www.yarp.it/download.html

For instance `yarp_2.3.70_v14_x86_1.exe	` has been tested on Windows 10, and we even got a nice: `Windows 10	+	cmake 3.9.4	+ VS 15 2017 + jdk-8u152-windows-i586.exe	+ MATLAB R2015b (8.6 32 bit)` setup working nicely, only having to install `things.i` manually (see https://github.com/robotology/yarp/issues/698) and doing `javac -source 1.3 -target 1.3 *.java` with 1.5 instead. Note that binsings have been improved, so should expect better results with `yarp_2.3.72`.
