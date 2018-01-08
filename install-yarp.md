# Install YARP

We use YARP for communications. Installing YARP on Ubuntu is quite straightforward.

Note that you will be prompted for your password upon using `sudo` a couple of times. 

For additional options use ccmake instead of cmake.

Official download page: [link](http://www.yarp.it/) 

## Install YARP (Ubuntu)

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

### Install Python bindings with IFrameGrabberControls2 support

The only difference with respect to the previous instructions is that you will need to use [David-Estevez's fork, branch feature-framegrabbercontrols-bindings](https://github.com/David-Estevez/yarp/tree/feature-framegrabbercontrols-bindings) instead of the official yarp.

```bash
git clone https://github.com/David-Estevez/yarp
git checkout feature-framegrabbercontrols-bindings
```

## Install additional YARP device: OpenNI2DeviceServer (Ubuntu)

Note: NiTE only required for skeletons.

Make sure you have previously installed YARP and:
 
- [Install OpenNI2 & NiTE2](install-openni-nite.md)

```bash
cd  # go home
cd repos/yarp/build
cmake .. -DCREATE_DEVICE_LIBRARY_MODULES=ON -DENABLE_yarpmod_OpenNI2DeviceServer=ON -DENABLE_yarpmod_OpenNI2DeviceClient=ON -DOPENNI2_INCLUDE_LOCAL=/usr/local/include/OpenNI2/ -DOPENNI2_LIBRARY=/usr/local/lib/libOpenNI2.so -DNITE2_INCLUDE_LOCAL=/usr/local/include/NiTE-Linux-x64-2.2 -DNITE2_LIBRARY=/usr/local/lib/libNiTE2.so
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
```

You may need to launch `yarpdev --device OpenNI2DeviceServer` from /YOUR_PATH_TO/NiTE-Linux-x64-2.2/Redist if using NiTE.


## Note for Linux Mint 17.3 Rosa
```bash
sudo apt install libqt5opengl5-dev  # avoid error on yarpmanager/builder GUI
```


## Install YARP 2.3.68+ (Debian 6.0.10)

```bash
sudo apt-get install build-essential libace-dev subversion git
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/yarp
git checkout e1221283abb1abc77619429bb4d9408cbb1cf6c8  # Corresponds to 2.3.68+181-20170203.11+gite122128
cd yarp; mkdir build; cd build
cmake .. -DYARP_NO_DEPRECATED_WARNINGS=ON  # YARP_DEPRECATED_MSG happened on 2.3.66.2 -> 2.3.68
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
```
