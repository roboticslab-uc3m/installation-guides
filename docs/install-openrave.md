# Install OpenRAVE

We use the OpenRAVE core library for simulations. Official links:

- [http://openrave.org](http://openrave.org)
- [OpenRAVE: Building and Installing](http://openrave.org/docs/latest_stable/coreapihtml/installation.html)

Legacy documentation regarding OpenRAVE installations can be found at: [(Legacy) Install OpenRAVE](legacy/legacy-install-openrave.md)

## Install OpenRAVE via scripts (Ubuntu 18.04 Bionic and Ubuntu 20.04 Focal)

Tested and works on fresh installs. Easy, but not guaranteed to work, nor to be the fastest mechanism (e.g. fcl not mandatory, and osg could alternatively be installed via `apt` in 20.04 Focal). Provides:

- Ubuntu 20.04 Focal: OpenRAVE 0.54.0 with Python 2 bindings, FCL, and OpenSceneGraph viewer.
- Ubuntu 18.04 Bionic: OpenRAVE 0.9.0 with Python 2 bindings, FCL, and Qtcoin viewer.

```bash
sudo apt install git lsb-release # probably already installed
```

On a fresh 20.04 Focal had to configure git email and user, even dummy okay:

```bash
git config --global user.name "FIRST_NAME LAST_NAME"
git config --global user.email "MY_NAME@example.com"
```

Always pay attention to prompts for `sudo` (and insert password):

```bash
cd  # go home
git clone https://github.com/crigroup/openrave-installation
cd openrave-installation
./install-dependencies.sh
./install-osg.sh
./install-fcl.sh
./install-openrave.sh
```

### Troubleshooting OpenRAVE via scripts (Ubuntu 18.04 Bionic and Ubuntu 20.04 Focal)

Also on 20.04 Focal had to run the [`pip install ipython h5py numpy scipy wheel`](https://github.com/crigroup/openrave-installation/blob/b2766bd789e2432c4485dff189e75cf328f243ec/install-dependencies.sh#L44) line manually, and `rm -rf ~/openrave` to run `./install-openrave.sh` again.

Moreover, if Ubuntu installation not fresh, beware of Python 2 vs 3 issues. Troubleshooting, make sure `python --version` gives you Python 2, else `update-alternatives` is your friend. Finally, in line with this, make sure you have the Python 2 development headers, which should be at `/usr/include/python2.7`.

## Install OpenRAVE 0.54.0 (Ubuntu 20.04 Focal)

No official PPA, install from source. Install Dependencies that must be installed for compilation:

- [Install CMake](install-cmake.md)
- [Install RapidJSON](install-rapidjson.md)

Note that you will be prompted for your password upon using `sudo`.

```bash
sudo apt install git # probably already installed
sudo apt install libboost-filesystem-dev libboost-system-dev libboost-python-dev libboost-thread-dev libboost-iostreams-dev libboost-numpy-dev
sudo apt install libxml2-dev libode-dev
sudo apt install liblapack-dev
sudo apt install libcollada-dom2.4-dp-dev
sudo apt install libopenscenegraph-dev # OSG 3.6.4 ok with OR 4c43d49895934b61cc286a6b41a10d3661fde465
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone --branch master https://github.com/rdiankov/openrave.git
cd openrave; mkdir build; cd build
cmake .. -DOPT_VIDEORECORDING=OFF -DOPT_PYTHON=OFF
make -j$(nproc)
sudo make install; cd  # install and go home
```

## Install OpenRAVE 0.54.0 (Ubuntu 18.04 Bionic)

No official PPA, install from source. Install Dependencies that must be installed for compilation:

- [Install CMake](install-cmake.md)
- [Install RapidJSON](install-rapidjson.md)

Note that you will be prompted for your password upon using `sudo`.

```bash
sudo apt install git # probably already installed
sudo apt install libboost-filesystem-dev libboost-system-dev libboost-python-dev libboost-thread-dev libboost-iostreams-dev libboost-numpy-dev
sudo apt install libqt4-dev qt4-dev-tools libxml2-dev libode-dev
sudo apt install libsoqt4-dev libcoin80-dev
sudo apt install liblapack-dev
sudo apt install libcollada-dom2.4-dp-dev  # Open .zae files, avoid cmake 3.19 error on 18.04 Bionic
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone --branch master https://github.com/rdiankov/openrave.git
cd openrave; mkdir build; cd build
cmake .. -DOPT_VIDEORECORDING=OFF -DOPT_PYTHON=OFF
make -j$(nproc)
sudo make install; cd  # install and go home
```

## Install OpenRAVE 0.9.0 (Ubuntu 18.04 Bionic)

No official PPA, install from source. Install Dependencies that must be installed for compilation:

- [Install CMake](install-cmake.md)

Note that you will be prompted for your password upon using `sudo`.

```bash
sudo apt install git # probably already installed
sudo apt install libboost-filesystem-dev libboost-system-dev libboost-python-dev libboost-thread-dev libboost-iostreams-dev libboost-numpy-dev
sudo apt install libqt4-dev qt4-dev-tools libxml2-dev libode-dev
sudo apt install libsoqt4-dev libcoin80-dev
sudo apt install rapidjson-dev liblapack-dev
# sudo apt install python-scipy  # For openravepy. Note that 16.04 Xenial sympy is 0.7.6, see next line
# pip install --upgrade --user sympy==0.7.1 # OpenRAVE ikfast needs sympy 0.7.1, https://github.com/rdiankov/openrave/pull/407
sudo apt install libcollada-dom2.4-dp-dev  # Open .zae files, avoid cmake 3.19 error on 18.04 Bionic
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone --branch boost-1.6x-forcompile https://github.com/roboticslab-uc3m/openrave.git # git clone --branch master https://github.com/rdiankov/openrave.git
cd openrave; mkdir build; cd build
cmake .. -DOPT_VIDEORECORDING=OFF  # Avoids AV errors
make -j$(nproc)
sudo make install; cd  # install and go home
```

### Known Issues (Ubuntu 18.04 Bionic)

- In case you run into `non-constant-expression cannot be narrowed from type 'double' to 'float' in initializer list [-Wc++11-narrowing]` errors (happened on OpenRAVE 0.15 and a Clang 6.0.0/7.0.0 compiler), reconfigure CMake with the following option: `cmake .. -DOPT_IKFAST_FLOAT32=OFF`

## Extra Tips

Note that you may end up requiring over 2 GB of free space during the installation of `apt` dependencies. To avoid that, use the `--no-install-recommends` option as in:

```bash
sudo apt install --no-install-recommends package
```

Thus, `apt` would not try to install non-critical packages marked as *recommended* by the dependencies of OpenRAVE.

## Install Additional Plugins: Flexible Collision Library (FCL)

The following is the Cannonical PPA way, which may not work for you.

```bash
sudo apt install libfcl-dev
cd $HOME/repos/openrave; mkdir build; cd build; cmake .. -DOPENRAVE_PLUGIN_FCLRAVE=ON
make -j$(nproc)
sudo make install; cd  # install and go home
```

The CMakes options when recompiling OpenRAVE are `OPT_FCL_COLLISION` / `OPENRAVE_PLUGIN_FCLRAVE`.

## Install Additional Plugins: OpenSceneGraph (OSG)

To get OSG to compile against OpenRAVE, first, you must download a specific version (`OpenSceneGraph-3.4.1` for OpenRAVE `v0.9.0`) and set a CMake flag to use a specific Qt version (`-DDESIRED_QT_VERSION=4` for OpenRAVE `v0.9.0`):

```bash
sudo apt-get install libcairo2-dev libjasper-dev libpoppler-glib-dev libsdl2-dev libtiff5-dev libxrandr-dev
git clone --branch OpenSceneGraph-3.4.1 https://github.com/openscenegraph/OpenSceneGraph
cd OpenSceneGraph && mkdir build && cd build
cmake .. -DDESIRED_QT_VERSION=4
make -j4
sudo make install
```

Then you must fix a set of environmental variables for OpenRAVE to actually detect OSG (else, error such as `Required > 3.4, failed because detected 3.4.2`):

```bash
export LD_LIBRARY_PATH="/usr/local/lib64:/usr/local/lib:$LD_LIBRARY_PATH"
export OPENTHREADS_INC_DIR="/usr/local/include"
export OPENTHREADS_LIB_DIR="/usr/local/lib64:/usr/local/lib"
export PATH="$OPENTHREADS_LIB_DIR:$PATH"
```

The CMakes options when recompiling OpenRAVE are `OPT_QTOSG_VIEWER` / `OPENRAVE_PLUGIN_QTOSGRAVE` (and the viewer is called "qtosg" in contrast to "qtcoin").

## Additional Information

### Offscreen Rendering (OpenRAVE RGB Cameras)

OpenRAVE requires "Offscreen Rendering" (more specifically called "indirect GLX rendering") to enable virtual RGB cameras in simulated environments. This section summarizes the conclusions from [openrave-yarp-plugins#48](https://github.com/roboticslab-uc3m/openrave-yarp-plugins/issues/48).

#### Symptoms that you have no "Offscreen Rendering"

1. An `offscreen renderer failed (check video driver), disabling` message, then constant `cannot render offscreen` messages.
1. The OpenRAVE `showsensors` examples open the main environment window, but no separate window is open displaying the RGB camera output:
    - OpenRAVE [src/cppexamples/orshowsensors.cpp](https://github.com/rdiankov/openrave/blob/v0.9.0/src/cppexamples/orshowsensors.cpp)
    - OpenRAVE [python/examples/showsensors.py](https://github.com/rdiankov/openrave/blob/v0.9.0/python/examples/showsensors.py) (requires Python `openravepy` module)
1. Cannot publish RGB camera output via [YarpOpenraveGrabber](https://github.com/roboticslab-uc3m/openrave-yarp-plugins/tree/master/libraries/YarpPlugins/YarpOpenraveGrabber) ([perma](https://github.com/roboticslab-uc3m/openrave-yarp-plugins/tree/489470911f59d236d86ca2f09da7b2ca544d990e/libraries/YarpPlugins/YarpOpenraveGrabber)) nor [YarpOpenraveRGBDSensor](https://github.com/roboticslab-uc3m/openrave-yarp-plugins/tree/master/libraries/YarpPlugins/YarpOpenraveRGBDSensor) ([perma](https://github.com/roboticslab-uc3m/openrave-yarp-plugins/tree/489470911f59d236d86ca2f09da7b2ca544d990e/libraries/YarpPlugins/YarpOpenraveRGBDSensor)).
1. You cannot generate `.jpg` files with the following snippet:
    - jgvictores [snippets/coin3d](https://github.com/jgvictores/snippets/tree/master/coin3d) ([perma](https://github.com/jgvictores/snippets/tree/385f31bb130cf8373e64a8234fb91222e4a9dddd/coin3d)) (requires `libsimage-dev`)

#### Solution (as of OpenRAVE `v0.9.0`, all requirements must be met)

1. Install working NVIDIA drivers
1. Create a custom `/usr/share/X11/xorg.conf.d/80-custom-glx.conf` file (in old Ubuntu distros, this would be part of `/etc/X11/xorg.conf`) with the following contents:
  ```text
  Section "ServerFlags"
      Option "AllowIndirectGLX" "on"
      Option "IndirectGLX" "on"
  EndSection
  ```

1. Forget about environmental variables `COIN_FULL_INDIRECT_RENDERING=1` or `COIN_DONT_INFORM_INDIRECT_RENDERING=1` unless you're concerned with warnings: no real effect.
1. Reboot (resarting the desktop environment should suffice)
1. For OpenRAVE, use `qtcoin` as viewer (and not `qtosg`): `openrave --viewer qtcoin` (parameter works in several other contexts as well)

If you have no NVIDIA, probably the most interesting read is at [openrave-yarp-plugins#48](https://github.com/roboticslab-uc3m/openrave-yarp-plugins/issues/48#issuecomment-439866471) on DRI and AiGLX, but no results here yet.

### Generate Databases

- <https://github.com/roboticslab-uc3m/teo-openrave-models/tree/master/scripts> ([permalink](https://github.com/roboticslab-uc3m/teo-openrave-models/tree/358ddcc067dec62d0034b5a3b5e27926168651bd/scripts))
- <https://github.com/roboticslab-uc3m/teo-openrave-models/issues/3>
- <https://github.com/roboticslab-uc3m/openrave-tools>
- <https://github.com/roboticslab-uc3m/openrave-yarp-plugins>

### Source Code Hacks

Here's a small patch tested on OpenRAVE `v0.9.0` to enhance console output on joint limits (provides joint name, and angles in degrees):

```bash
cd $HOME/repos/openrave
wget https://github.com/roboticslab-uc3m/openrave-yarp-plugins/files/3896779/98-limit-output.patch.log
git apply 98-limit-output.patch.log # modifies `plugins/basecontrollers/idealcontroller.cpp`
wget https://github.com/roboticslab-uc3m/openrave-yarp-plugins/files/3898656/98-limit-output-2.patch.log
git apply 98-limit-output-2.patch.log # modifies `src/libopenrave/kinbody.cpp`
cd build; cmake ..
make -j$(nproc)
sudo make install; cd  # install and go home
```

### Tutorials and Examples

- <http://openrave.org/docs/latest_stable/examples>
- <http://openrave.org/docs/latest_stable/coreapihtml/cpp_examples.html>
- <https://scaron.info/teaching/getting-started-with-openrave.html>
- <https://legacy.gitbook.com/book/crigroup/osrobotics> ([gitbook](https://crigroup.gitbooks.io/osrobotics))

### Similar and Related Projects

- <https://github.com/roboticslab-uc3m?q=openrave> (roboticslab-uc3m)
- <https://github.com/personalrobotics?q=openrave>
- <https://github.com/stephane-caron?tab=repositories&q=openrave>
- <https://github.com/crigroup?q=openrave>
- <https://github.com/roboticsleeds?q=openrave>
- <https://github.com/jsk-ros-pkg/openrave_planning>
- <https://github.com/BerkeleyAutomation/OpenRAVE-motion-planner>
- <https://github.com/gtrll/orgpmp2>
- <http://opengrasp.sourceforge.net> (<https://sourceforge.net/p/opengrasp/code/HEAD/tree/>)
- <http://www.iearobotics.com/wiki/index.php?title=OpenRave_y_robots_modulares>
- <http://openrave.programmingvision.com/wiki/index.php/Projects>
- <https://github.com/MichalXh/debug_ikfast>

## External Installation Tutorial/Script Links

- <https://scaron.info/teaching/installing-openrave-on-ubuntu-16.04.html>
- <https://github.com/crigroup/openrave-installation>
    - Older by same user: [[ref1, trusty, see next link if still in trouble with FCL](http://fsuarez6.github.io/blog/openrave-trusty/)].
    - Older by same user: [[ref2, xenial](http://fsuarez6.github.io/blog/workstation-setup-xenial/)].
- [[ref3, xenial](http://www.aizac.info/installing-openrave0-9-on-ubuntu-trusty-14-04-64bit/)].
- Not tested: ROS packages such as [`ros-indigo-openrave`/`ros-kinetic-openrave`](http://wiki.ros.org/openrave). According to [this](https://answers.ros.org/question/243441/how-to-install-openrave/), should be fine but perhaps missing components such as `openravepy`. According to [http://docs.ros.org/melodic/api/moveit_tutorials/html/doc/ikfast/ikfast_tutorial.html](http://docs.ros.org/melodic/api/moveit_tutorials/html/doc/ikfast/ikfast_tutorial.html#openrave-installation), may be as easy as:
  ```bash
  sudo apt install ros-indigo-openrave
  export PYTHONPATH=$PYTHONPATH:`openrave-config --python-dir`
  ```

## Docker

- <https://github.com/roboticslab-uc3m/teo-demos-misc/pkgs/container/teo-demos-misc> -> `ghcr.io/roboticslab-uc3m/teo-demos-misc:latest`
- <https://hub.docker.com/r/cielavenir/openrave>: [jammy](https://hub.docker.com/layers/cielavenir/openrave/jammy/images/sha256-fd7bf35e740a300b716a1f2d40a972f9d7bde62d499e9cecf02d7a310c25ec61?context=explore) tag works (including graphics and python)
- <https://hub.docker.com/search?q=openrave&type=image>
- <https://hub.docker.com/r/hamzamerzic/openrave>
- <https://hub.docker.com/r/personalrobotics/ros-openrave>
