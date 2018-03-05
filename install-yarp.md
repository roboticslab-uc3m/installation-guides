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

### Note for Linux Mint 17.3 Rosa
```bash
sudo apt install libqt5opengl5-dev  # avoid error on yarpmanager/builder GUI
```

## Install YARP (Windows)

Binary releases usually work well: http://www.yarp.it/download.html

See bindings section.

# Install Additional Plugins: Carriers

## Install ROS support

Make sure you have installed previously YARP and that the ROS environment is not sourced, as it causes the build to fail.
If you have the line `source /opt/ros/indigo/setup.bash` at the end of ~/.bashrc, comment it, save the file and open a new terminal.

```bash
cd  # go home
cd repos/yarp/build
cmake .. -DCREATE_OPTIONAL_CARRIERS=ON -DENABLE_yarpcar_tcpros_carrier=ON -DENABLE_yarpcar_xmlrpc_carrier=ON
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
```

# Install Additional Plugins: Devices

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
You should now be able to launch `yarpdev --device OpenNI2DeviceServer`. It is a complex device, see options with `yarpdev --device OpenNI2DeviceServer --verbose` (where there is an option to see modes) or example [here](https://github.com/roboticslab-uc3m/teo-configuration-files/blob/ee168eaf61454113b1ac7113fbb24e10af679bc3/share/teoBase/scripts/teoBase.xml#L35-L36).

### Install additional YARP device: OpenNI2DeviceServer (Ubuntu) with NiTE (skeletons)
NiTE only required for skeletons.
```bash
cd  # go home In addition to above steps for OpenNI:
cd repos/yarp/build
cmake .. -DNITE2_INCLUDE_LOCAL=/usr/local/include/NiTE-Linux-x64-2.2 -DNITE2_LIBRARY=/usr/local/lib/libNiTE2.so
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
```
You may need to launch `yarpdev --device OpenNI2DeviceServer` from `/YOUR_PATH_TO/NiTE-Linux-x64-2.2/Redist` if using NiTE.

# Install Bindings

Swig is needed in order to build all language bindings. Refer to [Install SWIG](install-swig.md).

## Install Python bindings

First, install Python development packages.

```bash
sudo apt update
sudo apt install libpython-dev  # not installed by default on clean distros
```

Make sure you have previously installed YARP.

```bash
cd  # go home
cd repos/yarp/build
cmake .. -DYARP_COMPILE_BINDINGS=ON -DCREATE_PYTHON=ON
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
```

Also, extra care should be taken with Python 2 vs 3 (e.g. toggle `t` to see paths 2.7 vs 3.5m).

## Install Java bindings

First, install the Java JDK. There are several versions at hand, so make sure you pick the Java release you are later going to work with in your applications.

```bash
sudo apt update
sudo apt install openjdk-8-jdk  # on Trusty, use openjdk-7-jdk
```

Make sure you have previously installed YARP.

```bash
cd  # go home
cd repos/yarp/build
cmake .. -DYARP_COMPILE_BINDINGS=ON -DCREATE_JAVA=ON
sudo make install; sudo ldconfig; cd  # install and go home
```

In case you run into trouble because of CMake not finding Java paths, we'll define here a variable that may hold different values depending on the system you are working on, and use it later. As a prerequisite, inspect the usual JVM installation path with `ls /usr/lib/jvm`.

On Ubuntu 16.04 64 bits, you should see a `java-1.8.0-openjdk-amd64` directory symlink. Store its location in a new environment variable:

```bash
JAVA_JVM_PATH=/usr/lib/jvm/java-1.8.0-openjdk-amd64
```

On different installations, the path will look differently. Adjust the variable to your needs, or use the following script to handle this for you:

```bash
JAVA_JVM_PATH=$(find /usr/lib/jvm/ -name java-1.*.*-openjdk* -type l | head -n 1)
```

Now, run the CMake command again and proceed with the installation:

```bash
cd ~/repos/yarp/build
cmake .. -DJAVA_AWT_INCLUDE_PATH=$JAVA_JVM_PATH/include -DJAVA_AWT_LIBRARY=$JAVA_JVM_PATH/include/jawt.h -DJAVA_INCLUDE_PATH=$JAVA_JVM_PATH/include -DJAVA_INCLUDE_PATH2=$JAVA_JVM_PATH/include/linux -DJAVA_JVM_LIBRARY=$JAVA_JVM_PATH/include/jni.h
sudo make install; sudo ldconfig; cd  # install and go home
```

You might need to set the `CLASSPATH` and `LD_LIBRARY_PATH` variables prior to calling YARP bindings in your application in order to find the generated `*.jar` and `*.so` files, respectively.

## Install MATLAB bindings

Two options here:
1. Classical way via Java bindings, which is similar to Python, then setting the `classpath.txt` and `librarypath.txt` files contained within MATLAB. Ref: http://wiki.icub.org/wiki/Calling_yarp_from_Matlab Working setups on  Windows 10 (more complex than Ubuntu):
   - Good 64 bit: `MATLAB R2017b (9.3, 64 bit) + yarp_2.3.70_v14_x86_amd64_1.exe	+	cmake 3.9.4	+ VS 15 2017 + jdk-8u162-windows-x64.exe` working nicely, only having to install `things.i` manually (see https://github.com/robotology/yarp/issues/698) and doing `javac -source 1.6 -target 1.6 *.java` (which is the default in code, but must be done manually, and manual says 1.3).
   - Good 64 bit (portable): To avoid installing VS + JDK + CMake, [here]( https://sourceforge.net/projects/roboticslab/files/External/yarp/2.3.70_win_64_java/) we've put together some pre-compiled YARP bindings (note `vc_redist.x64.exe` to compensate the lack of VS, and forced us to compile bindings in `Release` not `Debug`).
    - Ye-oldie 32 bit: `MATLAB R2015b (8.6, 32 bit) + yarp_2.3.70_v14_x86_1.exe	+	cmake 3.9.4	+ VS 15 2017 + jdk-8u152-windows-i586.exe	+ MATLAB R2015b (8.6 32 bit)` working nicely, only having to install `things.i` manually (see https://github.com/robotology/yarp/issues/698) and doing `javac -source 1.3 -target 1.3 *.java` with `1.5` instead.
1. Not recommended yet: New repo directly against MATLAB. Note that it links against MATLAB libs, so you must match compiler in addition to bits (Windows MATLAB 2017b only provides 64-bit mingw version). Ref: https://github.com/robotology-playground/yarp-matlab-bindings
