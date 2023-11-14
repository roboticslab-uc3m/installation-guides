# (Legacy) Install YARP

This is Legacy documentation regarding YARP installations. Updated YARP installation at: [Install YARP](../install-yarp.md)

## Install YARP (Ubuntu 16.04 Xenial)

Install Dependencies that must be installed for compilation:

- [Install CMake 3.12+](../install-cmake.md)

Then, installing YARP on Ubuntu is quite straightforward.

Note that you will be prompted for your password upon using `sudo` a couple of times.

As can be seen, here we are accounting for YARP GUIs and `mjpeg` carrier.

```bash
sudo apt install build-essential git
sudo apt install libeigen3-dev # Needed for creating YARP lib_math used for kinematics, etc.
sudo apt install qtbase5-dev qtdeclarative5-dev qtmultimedia5-dev \
  qml-module-qtquick2 qml-module-qtquick-window2 \
  qml-module-qtmultimedia qml-module-qtquick-dialogs \
  qml-module-qtquick-controls qml-module-qt-labs-folderlistmodel \
  qml-module-qt-labs-settings # GUI stuff, Ubuntu 16.04+ (Xenial)
sudo apt install libjpeg8-dev # Needed for mjpeg carrier
sudo apt install libedit-dev # Enables keyboard arrow keys within an RPC communication channel via terminal
mkdir -p ~/repos; cd ~/repos # Create $HOME/repos if it doesn't exist; then, enter it
git clone --branch=yarp-3.3 https://github.com/robotology/yarp
cd yarp && mkdir build && cd build
cmake .. -DSKIP_ACE=ON -DCREATE_GUIS=ON -DENABLE_yarpcar_mjpeg=ON -DENABLE_yarpcar_depthimage=ON -DENABLE_yarpcar_depthimage2=ON
make -j$(nproc) # Compile
sudo make install && sudo ldconfig && cd # Install and go home
```

For additional options use `ccmake` instead of `cmake`.

To enable yarp auto-completion (**do not** do this for YARP 3.4+, as it has been moved to `data/bash-completion/yarp` and installed by default):

```bash
source ~/repos/yarp/scripts/yarp_completion # Activate in current bash session
echo "source ~/repos/yarp/scripts/yarp_completion" >> ~/.bashrc # Activate in future bash sessions
```

### Note regarding YARP 3.4+

YARP 3.4+ (July '20) requires a modern GCC compiler. We found that GCC 5.4/5.5 leads to compilation issues. Please follow [this guide](https://gist.github.com/jlblancoc/99521194aba975286c80f93e47966dc5) to install and use GCC 7 instead. In case you are building on top of previously generated YARP files, make sure to either delete *build/CMakeCache.txt* or remove the *build* directory entirely.

## Install YARP (Ubuntu 14.04 Trusty)

Install Dependencies that must be installed for compilation:

- [CMake >3.12](../install-cmake.md)

Then:

```bash
sudo apt install build-essential git
sudo apt install libeigen3-dev # Needed for creating YARP lib_math used for kinematics, etc.
sudo apt install qtbase5-dev qtdeclarative5-dev qtmultimedia5-dev \
  qtdeclarative5-qtquick2-plugin qtdeclarative5-window-plugin \
  qtdeclarative5-qtmultimedia-plugin qtdeclarative5-controls-plugin \
  qtdeclarative5-dialogs-plugin libqt5svg5 # GUI stuff, Ubuntu 14.04-
sudo apt install libjpeg8-dev # Needed for mjpeg carrier
sudo apt install libedit-dev # Enables keyboard arrow keys within an RPC communication channel via terminal
mkdir -p ~/repos; cd ~/repos # Create $HOME/repos if it doesn't exist; then, enter it
git clone --branch=yarp-3.3 https://github.com/robotology/yarp
cd yarp && mkdir build && cd build
cmake .. -DSKIP_ACE=ON -DCREATE_GUIS=ON -DENABLE_yarpcar_mjpeg=ON -DENABLE_yarpcar_depthimage=ON -DENABLE_yarpcar_depthimage=ON
make -j$(nproc) # Compile
sudo make install && sudo ldconfig && cd # Install and go home
```

For additional options use `ccmake` instead of `cmake`.

To enable yarp auto-completion (**do not** do this for YARP 3.4+, as it has been moved to `data/bash-completion/yarp` and installed by default):

```bash
source ~/repos/yarp/scripts/yarp_completion # Activate in current bash session
echo "source ~/repos/yarp/scripts/yarp_completion" >> ~/.bashrc # Activate in future bash sessions
```

## Note for Linux Mint 17.3 Rosa

```bash
sudo apt install libqt5opengl5-dev # Avoid error on yarpmanager/builder GUI
```

## Install Additional Plugins: Devices

### Install additional YARP device: OpenNI2DeviceServer (Ubuntu)

- **Note:** tested on YARP `2.3.68.x` and YARP `2.3.72.1`, not compatible with YARP `3.x.*`

```bash
cd ~/repos/yarp/build
cmake .. -DCREATE_DEVICE_LIBRARY_MODULES=ON -DENABLE_yarpmod_OpenNI2DeviceServer=ON -DENABLE_yarpmod_OpenNI2DeviceClient=ON -DOpenNI2_INCLUDE_DIR=/usr/local/include/OpenNI2/ -DOpenNI2_LIBRARY=/usr/local/lib/libOpenNI2.so
make -j$(nproc) # Compile
sudo make install && sudo ldconfig && cd # Install and go home
```

You should now be able to launch `yarpdev --device OpenNI2DeviceServer`. It is a complex device, see options with `yarpdev --device OpenNI2DeviceServer --verbose` (where there is an option to see modes) or example [here](https://github.com/roboticslab-uc3m/teo-configuration-files/blob/ee168eaf61454113b1ac7113fbb24e10af679bc3/share/teoBase/scripts/teoBase.xml#L35-L36).

### Install additional YARP device: OpenNI2DeviceServer (Ubuntu) with NiTE (skeletons)

- **Note:** not compatible with YARP `3.x.*`

NiTE only required for skeletons. In addition to above steps for OpenNI:

- [Install NiTE2.2 (Ubuntu)](../install-openni-nite.md#install-nite22-ubuntu)

```bash
cd ~/repos/yarp/build
cmake .. -DNITE2_INCLUDE_LOCAL=/usr/local/include/NiTE-Linux-x64-2.2 -DNITE2_LIBRARY=/usr/local/lib/libNiTE2.so
make -j$(nproc) # Compile
sudo make install && sudo ldconfig && cd # Install and go home
```

You may need to launch `yarpdev --device OpenNI2DeviceServer` from `/YOUR_PATH_TO/NiTE-Linux-x64-2.2/Redist` if using NiTE.
