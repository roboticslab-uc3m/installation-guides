# Install OpenRAVE

We use the OpenRAVE core library for simulations. Note that you will be prompted for your password upon using `sudo`.

Official page: [link](http://openrave.org/). [Building and Installing](http://openrave.org/docs/latest_stable/coreapihtml/installation.html). [Additional resource](http://www.aizac.info/installing-openrave0-9-on-ubuntu-trusty-14-04-64bit/).

## Install OpenRAVE (Ubuntu 12.04)

To install a precompiled version of OpenRAVE, type:

```bash
sudo add-apt-repository ppa:openrave/release
sudo apt-get update
sudo apt-get install openrave
```

## Install OpenRAVE (Most modern Ubuntu, such as 14.04 or 16.04)

No official PPA, install from source.

```bash
sudo apt-get install git-core
sudo apt-get install libboost-all-dev
sudo apt-get install libqt4-dev qt4-dev-tools libxml2-dev libode-dev
sudo apt-get install libsoqt4-dev libcoin80-dev
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone --branch latest_stable https://github.com/rdiankov/openrave.git
cd openrave; mkdir build; cd build; cmake .. -DOPENRAVE_PLUGIN_FCLRAVE=OFF  # Use -DOPT_VIDEORECORDING=OFF if there are AV errors
make -j3; sudo make install; cd  # go home
```

## Install OpenRAVE with FCL (Confirmed for Ubuntu 15.04, 15.10, 16.10, 17.04)

```bash
sudo apt-get install libfcl-dev
cd $HOME/repos/openrave; mkdir build; cd build; cmake .. -DOPENRAVE_PLUGIN_FCLRAVE=ON
make -j3; sudo make install; cd  # go home
```
For more references regarding FCL from source on other versions, refer to [this issue](https://github.com/roboticslab-uc3m/installation-guides/issues/3).
