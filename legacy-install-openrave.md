# (Legacy) Install OpenRAVE

This is Legacy documentation regarding YARP installations. Updated YARP installation at: [Install OpenRAVE](install-openrave.md)

## Install OpenRAVE (Ubuntu 16.04 Xenial and 14.04 Trusty)

No official PPA, install from source. Install Dependencies that must be installed for compilation:

- [CMake](install-cmake.md)

Note that you will be prompted for your password upon using `sudo`.

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

### Known Issues (Ubuntu 16.04 Xenial)

- OpenRAVE 0.9.0 with `gcc-7` fails to compile. Recommendation: switch back to `gcc-5 (Ubuntu 5.5.0-12ubuntu1~16.04) 5.5.0 20171010`.

### FCL Known Issues (Ubuntu 16.04 Xenial)

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

## Install OpenRAVE (Ubuntu 12.04 Precise)

To install a precompiled version of OpenRAVE, type:

```bash
sudo add-apt-repository ppa:openrave/release
sudo apt-get update
sudo apt-get install openrave
```

## Install OpenRAVE (Windows)

Long ago, this was easy. Now, installers such as `openrave-0.9.0-5cfc74-win32-vc100-setup` are broken (due to broken Boost 1.44 and Qt links, as well as old Visual Studio version), so we have to go old-school.

References:

- <http://robots.uc3m.es/index.php/OpenRAVE_R1457_Windows_Install>
- <https://www.cs.cmu.edu/~motionplanning/homework/hw1/hw1.html>
- <http://openrave.org/docs/latest_stable/coreapihtml/installation_windows.html>
- <http://sukhoy.public.iastate.edu/openrave/>
- <https://github.com/rdiankov/openrave>
