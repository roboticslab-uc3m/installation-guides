# Install YARP

We use YARP for communications. Official pages:

- [http://www.yarp.it](http://www.yarp.it)
- [http://www.yarp.it/install.html](http://www.yarp.it/install.html)
- [YARP Supported Distributions](http://wiki.icub.org/wiki/YARP_Supported_Distributions)
- Also check out issue that tracks external devices: <https://github.com/robotology/yarp/issues/2372>

Legacy documentation regarding YARP installations can be found at: [(Legacy) Install YARP](legacy-install-yarp.md)

## Install YARP 3.4 (Ubuntu 20.04 Focal)

Install Dependencies that must be installed for compilation:

- [Install CMake 3.12+](install-cmake.md)
- [Install YCM 0.11+](install-ycm.md)

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
git clone --branch=yarp-3.4 https://github.com/robotology/yarp
cd yarp && mkdir build && cd build
cmake .. -DSKIP_ACE=ON -DCREATE_GUIS=ON -DENABLE_yarpcar_mjpeg=ON -DENABLE_yarpcar_depthimage=ON -DENABLE_yarpcar_depthimage2=ON
make -j$(nproc) # Compile
sudo make install && sudo ldconfig && cd # Install and go home
```

For additional options use `ccmake` instead of `cmake`.

## Install YARP 3.3 (Ubuntu 18.04 Bionic)

Install Dependencies that must be installed for compilation:

- [Install CMake 3.12+](install-cmake.md)

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

## Note for Linux Mint 18.3 Sylvia

(tested on 64-bit XFCE desktop)

```bash
sudo apt install libqt5opengl5-dev # Avoid error on yarpmanager/builder GUI
sudo apt-get install qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel # Fix QQmlApplicationEngine failed to load component
```

## Install YARP (Windows)

Binary releases usually work well: <http://www.yarp.it/download.html>

## Install Additional Plugins: Carriers

### Install ROS support

**Note:** these carriers are now installed by default, ignore this if you are using YARP 3.x.x

Make sure you have installed previously YARP and that the ROS environment is not sourced, as it causes the build to fail.
If you have the line `source /opt/ros/indigo/setup.bash` at the end of ~/.bashrc, comment it, save the file and open a new terminal.

```bash
cd ~/repos/yarp/build
cmake .. -DCREATE_OPTIONAL_CARRIERS=ON -DENABLE_yarpcar_tcpros=ON -DENABLE_yarpcar_xmlrpc=ON
make -j$(nproc) # Compile
sudo make install && sudo ldconfig && cd # Install and go home
```

## Install Additional Plugins: Devices

### Install additional YARP device: depthCamera (Ubuntu)

Make sure you have previously installed YARP and:

- [Install OpenNI2 (Ubuntu)](install-openni-nite.md#install-openni2-ubuntu)

```bash
cd ~/repos/yarp/build
cmake .. -DOpenNI2_INCLUDE_DIR=/usr/local/include/OpenNI2/ -DOpenNI2_LIBRARY=/usr/local/lib/libOpenNI2.so -DENABLE_yarpmod_depthCamera=ON
make -j$(nproc) # Compile
sudo make install && sudo ldconfig && cd # Install and go home
```

You'll need a configuration file in order to launch this device. For instance, we use this command with an ASUS camera: `yarpdev --context sensors --from asus-xtion.ini` ([ref](https://github.com/roboticslab-uc3m/vision/blob/fc60ad9aed7dfbca647d9d4154ffb0e9b68edeaa/share/sensors/conf/asus-xtion.ini)).

Note ([ref](https://github.com/roboticslab-uc3m/vision/issues/83#issuecomment-390326913)): installation of *depthCamera* is broken at YARP 2.3.72 (and probably at 2.3.70.x, too). Did work at 2.3.68.x, fixed upstream at 2.3.72.1. Workaround: do `cmake . -DYARP_HAS_OpenNI2=ON` and configure again.

## Install Bindings

Swig is needed in order to build all language bindings. Refer to [Install SWIG](install-swig.md).

### Install Python bindings

Make sure you have previously [installed YARP](install-yarp.md#install-yarp) and:

```bash
sudo apt update
sudo apt install libpython-dev # Python development package are not installed by default on clean distros
cd ~/repos/yarp/build
cmake .. -DYARP_COMPILE_BINDINGS=ON -DCREATE_PYTHON=ON
make -j$(nproc)  # compile
sudo make install && sudo ldconfig && cd # Install and go home
```

#### Install Python bindings (checking)

Check your installation via (should output nothing; if bad you will see a ModuleNotFoundError):

```
python -c "import yarp"
```

Depending on your configuration, you might need to use `python3` (or `python2`) instead of `python`.

#### Install Python bindings (troubleshooting)

Mind that, **starting from YARP 3.4, support for Python 2.x has been dropped**.

You can use the CMake variable `CMAKE_INSTALL_PYTHON3DIR` to select the most adequate location for the installed module (in YARP 3.3 and earlier, use `CMAKE_INSTALL_PYTHONDIR` along with `YARP_USE_PYTHON_VERSION`, more details below). This is useful in case the interpreter is unable to find it (see previous section). For instance, you can end up with the YARP module installed in `lib/python3/`, whereas standard Python module path might be `lib/python3.6/` (this has been observed on Ubuntu Bionic and Focal). For this specific scenario:

```bash
cmake -DYARP_COMPILE_BINDINGS=ON -DCREATE_PYTHON=ON -DCMAKE_INSTALL_PYTHON3DIR:PATH=lib/python3.6/dist-packages ..
```

Don't omit the `:PATH`!

Extra care should be taken with multiple Python versions (e.g. 2.x vs 3.x) in earlier YARP releases. Use `YARP_USE_PYTHON_VERSION` to select the desired version. The following command has been tested on Ubuntu Xenial to force Python 3.5m (note distro version is 3.5m, where `m` is `--with-pymalloc`; [ref](https://www.python.org/dev/peps/pep-3149/#proposal)):

```bash
sudo apt install libpython3-dev
cmake -DYARP_COMPILE_BINDINGS=ON -DCREATE_PYTHON=ON -DYARP_USE_PYTHON_VERSION=3.5 -DPYTHON_INCLUDE_DIR=/usr/include/python3.5m -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.5m.so -DCMAKE_INSTALL_PYTHONDIR:PATH=lib/python3.5/dist-packages -DPYTHON_EXECUTABLE=/usr/bin/python3 ..
```

Prior to YARP 3.4 the `CMAKE_INSTALL_PYTHONDIR` option might be ignored, therefore we suggest to create symlinks. Use `python -c "import site; print(site.getsitepackages()[0])"` to retrieve a list of possible destinations of Python modules, ideally the first element would be good enough for your needs. Then:

```bash
sudo ln -s /usr/local/lib/python3/dist-packages/_yarp.so `python -c "import site; print(site.getsitepackages()[0])"`
sudo ln -s /usr/local/lib/python3/dist-packages/yarp.py `python -c "import site; print(site.getsitepackages()[0])"`
```

Specifically for Python 3.5m, this may expand to:

```bash
sudo ln -s /usr/local/lib/python3/dist-packages/_yarp.so /usr/local/lib/python3.5/dist-packages/
sudo ln -s /usr/local/lib/python3/dist-packages/yarp.py /usr/local/lib/python3.5/dist-packages/
```

### Install Java bindings

First, install the Java JDK. There are several versions at hand, so make sure you pick the Java release you are later going to work with in your applications.

Make sure you have previously installed YARP and:

```bash
sudo apt update
sudo apt install openjdk-8-jdk  # on Trusty, use openjdk-7-jdk
cd ~/repos/yarp/build
cmake .. -DYARP_COMPILE_BINDINGS=ON -DCREATE_JAVA=ON
sudo make install; sudo ldconfig; cd  # install and go home
```

#### Install Java bindings (troubleshooting)

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
sudo make install && sudo ldconfig && cd  # Install and go home
```

You might need to set the `CLASSPATH` and `LD_LIBRARY_PATH` variables prior to calling YARP bindings in your application in order to find the generated `*.jar` and `*.so` files, respectively.

### Install MATLAB bindings

Two options here:

1. Classical way via Java bindings, which is similar to Python, then setting the `classpath.txt` and `librarypath.txt` files contained within MATLAB. Ref: <http://wiki.icub.org/wiki/Calling_yarp_from_Matlab> Working setups on  Windows 10 (more complex than Ubuntu):
   - Good 64 bit: `MATLAB R2017b (9.3, 64 bit)` + `yarp_2.3.70_v14_x86_amd64_1.exe` + `cmake 3.9.4` + `VS 15 2017` + `jdk-8u162-windows-x64.exe` working nicely, only having to install `things.i` manually (see <https://github.com/robotology/yarp/issues/698>) and doing `javac -source 1.6 -target 1.6 *.java` (which is the default in code, but must be done manually, and manual says 1.3).
   - Good 64 bit (portable): To avoid installing VS + JDK + CMake, [here](https://sourceforge.net/projects/roboticslab/files/External/yarp/2.3.70_win_64_java/) we've put together some pre-compiled YARP bindings (note `vc_redist.x64.exe` to compensate the lack of VS, and forced us to compile bindings in `Release` not `Debug`).
   - Ye-oldie 32 bit: `MATLAB R2015b (8.6, 32 bit) + yarp_2.3.70_v14_x86_1.exe + cmake 3.9.4 + VS 15 2017 + jdk-8u152-windows-i586.exe + MATLAB R2015b (8.6 32 bit)` working nicely, only having to install `things.i` manually (see <https://github.com/robotology/yarp/issues/698>) and doing `javac -source 1.3 -target 1.3 *.java` with `1.5` instead.
1. A different method: New repo directly against MATLAB: [yarp-matlab-bindings](https://github.com/robotology-playground/yarp-matlab-bindings). Some issues:
   - Requires setting variables such as `YARP_DIR` and even `YCM_DIR`.
   - This seems to imply a separately built YCM, but see [this issue](https://github.com/robotology/yarp/issues/1552#issuecomment-366449572).
   - It links against MATLAB libs, so you must match compiler in addition to bits (Windows MATLAB 2017b only provides 64-bit mingw version).

## Additional Information

### Tutorials and Examples

- Tutorials
  - [YARP Tutorial (Spanish)](https://asrob.uc3m.es/tutoriales/software/programming/yarp.html) ([perma](https://github.com/asrob-uc3m/tutoriales/blob/694b1bf6efeb716493272b9553cc9561812c7960/software/programming/yarp.md))
  - [YARP Devices Tutorial (Spanish)](http://wiki.asrob.uc3m.es/index.php/Tutorial_yarp_devices)
- Recommendations
  - [Programming with YARP](https://robots.uc3m.es/developer-manual/programming-with-yarp.html) ([perma](https://github.com/roboticslab-uc3m/developer-manual/blob/c0cb6952e14079b3fcf9d36e1830b92c07bf8bde/programming-with-yarp.md))
- Hacks and tricks
  - [YARP Tricks](https://robots.uc3m.es/developer-manual/appendix/yarp-tricks.html) ([perma](https://github.com/roboticslab-uc3m/developer-manual/blob/9c11c75d4ef5de8ac43a90ab3184fdf8e85a3290/appendix/yarp-tricks.md))
  - <http://wiki.icub.org/wiki/YarpTricks>
- Examples
  - <https://github.com/robotology/yarp/tree/master/example> ([perma](https://github.com/robotology/yarp/tree/fcbd455603e13a5ddc439f9d4592bf000b8dcdff/example)) (official, C++)
  - <https://github.com/robotology/yarp/tree/master/bindings> ([perma](https://github.com/robotology/yarp/tree/fcbd455603e13a5ddc439f9d4592bf000b8dcdff/bindings)) (official)
  - <https://github.com/roboticslab-uc3m/yarp-devices/tree/master/examples> ([perma](https://github.com/roboticslab-uc3m/yarp-devices/tree/97771c958f493aa91ad1bc592444b3626efdaf55/examples)) (roboticslab-uc3m)

### Similar and Related

- <https://github.com/robotology?q=yarp> (org of official repo)
- <https://github.com/roboticslab-uc3m?q=yarp> (roboticslab-uc3m)
- <https://github.com/inria-larsen?q=yarp>

## External Installation Tutorial/Script Links

- Docker
  - <https://hub.docker.com/search?q=yarp&type=image> (avoid `yarpc` which is unrelated)
  - <https://hub.docker.com/r/h2020infuse/yarpmonitor-ubuntu-prod>
