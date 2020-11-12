# Install OpenRAVE

We use the OpenRAVE core library for simulations. Official links: 

- [http://openrave.org](http://openrave.org)
- [OpenRAVE: Building and Installing](http://openrave.org/docs/latest_stable/coreapihtml/installation.html)

Legacy documentation regarding OpenRAVE installations can be found at: [(Legacy) Install OpenRAVE](legacy-install-openrave.md)

## Install dependencies

* [Install RapidJSON](install-rapidjson.md)

## Install OpenRAVE (Ubuntu 18.04)

No official PPA, install from source. Note that you will be prompted for your password upon using `sudo`.

```bash
sudo apt install git # probably already installed
sudo apt install cmake # probably already installed, do not duplicate if installed from source
sudo apt install libboost-filesystem-dev libboost-system-dev libboost-python-dev libboost-thread-dev libboost-iostreams-dev libboost-numpy-dev
sudo apt install libqt4-dev qt4-dev-tools libxml2-dev libode-dev
sudo apt install libsoqt4-dev libcoin80-dev
sudo apt install rapidjson-dev liblapack-dev
sudo apt install python-scipy  # For openravepy. Note that Xenial sympy is 0.7.6, see next line
pip install --upgrade --user sympy==0.7.1 # OpenRAVE ikfast needs sympy 0.7.1, https://github.com/rdiankov/openrave/pull/407
sudo apt install libcollada-dom2.4-dp-dev  # Open .zae files, only Ubuntu 16.04
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone --branch boost-1.6x-forcompile https://github.com/roboticslab-uc3m/openrave.git # git clone --branch master https://github.com/rdiankov/openrave.git
cd openrave; mkdir build; cd build
cmake .. -DOPT_VIDEORECORDING=OFF  # Avoids AV errors
make -j$(nproc)
sudo make install; cd  # install and go home
```

Note that you may end up requiring over 2 GB of free space during the installation of `apt` dependencies. To avoid that, use the `--no-install-recommends` option as in:

`sudo apt install --no-install-recommends package`

Thus, `apt` would not try to install non-critical packages marked as *recommended* by the dependencies of OpenRAVE.

### Known Issues (Ubuntu 18.04)
- In case you run into `non-constant-expression cannot be narrowed from type 'double' to 'float' in initializer list [-Wc++11-narrowing]` errors (happened on OpenRAVE 0.15 and a Clang 6.0.0/7.0.0 compiler), reconfigure CMake with the following option: `cmake .. -DOPT_IKFAST_FLOAT32=OFF`

## Install OpenRAVE (Ubuntu 16.04 and 14.04)

No official PPA, install from source. Note that you will be prompted for your password upon using `sudo`.

```bash
sudo apt install git
sudo apt install libboost-filesystem-dev libboost-system-dev libboost-python-dev libboost-thread-dev libboost-iostreams-dev libboost-date-time-dev
sudo apt install libqt4-dev qt4-dev-tools libxml2-dev libode-dev
sudo apt install libsoqt4-dev libcoin80-dev
sudo apt install python-scipy  # For openravepy. Note that Xenial sympy is 0.7.6, see next line
pip install --upgrade --user sympy==0.7.1 # OpenRAVE ikfast needs sympy 0.7.1, https://github.com/rdiankov/openrave/pull/407
sudo apt install libcollada-dom2.4-dp-dev  # Open .zae files, only Ubuntu 16.04
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone --branch v0.9.0 https://github.com/rdiankov/openrave.git
cd openrave; mkdir build; cd build
cmake .. -DOPT_VIDEORECORDING=OFF  # Avoids AV errors
make -j$(nproc)
sudo make install; cd  # install and go home
```

Note that you may end up requiring over 2 GB of free space during the installation of `apt` dependencies. To avoid that, use the `--no-install-recommends` option as in:

`sudo apt install --no-install-recommends package`

Thus, `apt` would not try to install non-critical packages marked as *recommended* by the dependencies of OpenRAVE.

### Known Issues (Ubuntu 16.04)
- OpenRAVE `v0.9.0` with `gcc-7` fails to compile. Recommendation: switch back to `gcc-5 (Ubuntu 5.5.0-12ubuntu1~16.04) 5.5.0 20171010`.

## Install Additional Plugins: Flexible Collision Library (FCL)

The following is the Cannonical PPA way, which may not work for you.

```bash
sudo apt install libfcl-dev
cd $HOME/repos/openrave; mkdir build; cd build; cmake .. -DOPENRAVE_PLUGIN_FCLRAVE=ON
make -j$(nproc)
sudo make install; cd  # install and go home
```

The CMakes options when recompiling OpenRAVE are `OPT_FCL_COLLISION` / `OPENRAVE_PLUGIN_FCLRAVE`.

### FCL Known Issues (Ubuntu 16.04)
With the Cannonical PPA way, you'll run into:
```
-- Checking for module 'fcl'
--   Found fcl, version 0.3.2
-- Could not find FCL. Please install FCL (https://github.com/flexible-collision-library/fcl)
```
FCL `0.5.0` has been identified as working. Compile and install it via:
```bash
mkdir -p repos; cd repos # create $HOME/repos if it doesn't exist; then, enter it
git clone --branch 0.5.0 https://github.com/flexible-collision-library/fcl
cd fcl; mkdir build; cd build
cmake ..
make -j$(nproc)
sudo make install; cd  # install and go home
```

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
    ```
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

- https://github.com/roboticslab-uc3m/teo-openrave-models/tree/master/scripts ([permalink](https://github.com/roboticslab-uc3m/teo-openrave-models/tree/358ddcc067dec62d0034b5a3b5e27926168651bd/scripts))
- https://github.com/roboticslab-uc3m/teo-openrave-models/issues/3
- https://github.com/roboticslab-uc3m/openrave-tools
- https://github.com/roboticslab-uc3m/openrave-yarp-plugins

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
- http://openrave.org/docs/latest_stable/examples
- http://openrave.org/docs/latest_stable/coreapihtml/cpp_examples.html
- https://scaron.info/teaching/getting-started-with-openrave.html
- https://legacy.gitbook.com/book/crigroup/osrobotics ([gitbook](https://crigroup.gitbooks.io/osrobotics))

### Similar and Related Projects
- https://github.com/roboticslab-uc3m?q=openrave (roboticslab-uc3m)
- https://github.com/personalrobotics?q=openrave
- https://github.com/stephane-caron?tab=repositories&q=openrave
- https://github.com/crigroup?q=openrave
- https://github.com/roboticsleeds?q=openrave
- https://github.com/jsk-ros-pkg/openrave_planning
- https://github.com/BerkeleyAutomation/OpenRAVE-motion-planner
- https://github.com/gtrll/orgpmp2
- http://opengrasp.sourceforge.net (https://sourceforge.net/p/opengrasp/code/HEAD/tree/)
- http://www.iearobotics.com/wiki/index.php?title=OpenRave_y_robots_modulares
- http://openrave.programmingvision.com/wiki/index.php/Projects
- https://github.com/MichalXh/debug_ikfast

## External Installation Tutorial/Script Links
- https://scaron.info/teaching/installing-openrave-on-ubuntu-16.04.html
- https://github.com/crigroup/openrave-installation
   - Older by same user: [[ref1, trusty, see next link if still in trouble with FCL](http://fsuarez6.github.io/blog/openrave-trusty/)].
   - Older by same user: [[ref2, xenial](http://fsuarez6.github.io/blog/workstation-setup-xenial/)].
- [[ref3, xenial](http://www.aizac.info/installing-openrave0-9-on-ubuntu-trusty-14-04-64bit/)].
- Not tested: ROS packages such as [`ros-indigo-openrave`/`ros-kinetic-openrave`](http://wiki.ros.org/openrave). According to [this](https://answers.ros.org/question/243441/how-to-install-openrave/), should be fine but perhaps missing components such as `openravepy`. According to [http://docs.ros.org/melodic/api/moveit_tutorials/html/doc/ikfast/ikfast_tutorial.html](http://docs.ros.org/melodic/api/moveit_tutorials/html/doc/ikfast/ikfast_tutorial.html#openrave-installation), may be as easy as:
    ```bash
    sudo apt install ros-indigo-openrave
    export PYTHONPATH=$PYTHONPATH:`openrave-config --python-dir`
    ```
- Docker
    - https://hub.docker.com/search?q=openrave&type=image
    - https://hub.docker.com/r/hamzamerzic/openrave
    - https://hub.docker.com/r/personalrobotics/ros-openrave
