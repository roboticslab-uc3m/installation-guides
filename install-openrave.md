# Install OpenRAVE

We use the OpenRAVE core library for simulations. Official links: [http://openrave.org](http://openrave.org), [OpenRAVE: Building and Installing](http://openrave.org/docs/latest_stable/coreapihtml/installation.html).

* [Install OpenRAVE (Ubuntu 18.04)](#install-openrave-ubuntu-1804)
    * [Known Issues (Ubuntu 18.04)](#known-issues-ubuntu-1804)
* [Install OpenRAVE (Ubuntu 16.04 and 14.04)](#install-openrave-ubuntu-1604-and-1404)
    * [Known Issues (Ubuntu 16.04)](#known-issues-ubuntu-1604)
* [Install OpenRAVE (Ubuntu 12.04)](#install-openrave-ubuntu-1204)
* [Install OpenRAVE (Windows)](#install-openrave-windows)
* [Install Additional Plugins: Flexible Collision Library (FCL)](#install-additional-plugins-flexible-collision-library-fcl)
* [Install Additional Plugins: OpenSceneGraph (OSG)](#install-additional-plugins-openscenegraph-osg)
* [Additional Information](#additional-information)
    * [Source Code Hacks](#source-code-hacks)
    * [Generate Databases](#generate-databases)
    * [External Tutorials](#external-tutorials)
* [External Installation Tutorial/Script Links](#external-installation-tutorialscript-links)

## Install OpenRAVE (Ubuntu 18.04)

No official PPA, install from source. Note that you will be prompted for your password upon using `sudo`.

```bash
sudo apt install git
sudo apt install libboost-filesystem-dev libboost-system-dev libboost-python-dev libboost-thread-dev libboost-iostreams-dev
sudo apt install libqt4-dev qt4-dev-tools libxml2-dev libode-dev
sudo apt install libsoqt4-dev libcoin80-dev
sudo apt install python-scipy  # For openravepy. Note that Xenial sympy is 0.7.6, see next line
pip install --upgrade --user sympy==0.7.1 # OpenRAVE ikfast needs sympy 0.7.1, https://github.com/rdiankov/openrave/pull/407
sudo apt install libcollada-dom2.4-dp-dev  # Open .zae files, only Ubuntu 16.04
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone --branch master https://github.com/rdiankov/openrave.git
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
sudo apt install libboost-filesystem-dev libboost-system-dev libboost-python-dev libboost-thread-dev libboost-iostreams-dev
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

## Install OpenRAVE (Ubuntu 12.04)

To install a precompiled version of OpenRAVE, type:

```bash
sudo add-apt-repository ppa:openrave/release
sudo apt-get update
sudo apt-get install openrave
```

## Install OpenRAVE (Windows)

Long ago, this was easy. Now, installers such as `openrave-0.9.0-5cfc74-win32-vc100-setup` are broken (break do to broken Boost 1.44 and Qt links, not to mention old VS version), so we have to go old-school.

References:
- http://robots.uc3m.es/index.php/OpenRAVE_R1457_Windows_Install
- https://www.cs.cmu.edu/~motionplanning/homework/hw1/hw1.html
- http://openrave.org/docs/latest_stable/coreapihtml/installation_windows.html
- http://sukhoy.public.iastate.edu/openrave/
- https://github.com/rdiankov/openrave

## Install Additional Plugins: Flexible Collision Library (FCL)

The following is the Cannonical PPA way, which may not work for you. For more references regarding FCL from source on other/older versions, refer to these issues: [#3](https://github.com/roboticslab-uc3m/installation-guides/issues/3), [#45](https://github.com/roboticslab-uc3m/installation-guides/issues/45).

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

### Generate Databases

- https://github.com/roboticslab-uc3m/teo-openrave-models/tree/develop/scripts ([permalink](https://github.com/roboticslab-uc3m/teo-openrave-models/tree/358ddcc067dec62d0034b5a3b5e27926168651bd/scripts))
- https://github.com/roboticslab-uc3m/openrave-tools
- https://github.com/roboticslab-uc3m/openrave-yarp-plugins

### External Tutorials
- https://scaron.info/teaching/getting-started-with-openrave.html

## External Installation Tutorial/Script Links
- https://github.com/crigroup/openrave-installation
   - Older by same user: [[ref1, trusty, see next link if still in trouble with FCL](http://fsuarez6.github.io/blog/openrave-trusty/)].
   - Older by same user: [[ref2, xenial](http://fsuarez6.github.io/blog/workstation-setup-xenial/)].
- [[ref3, xenial](http://www.aizac.info/installing-openrave0-9-on-ubuntu-trusty-14-04-64bit/)].
- https://hub.docker.com/r/hamzamerzic/openrave
