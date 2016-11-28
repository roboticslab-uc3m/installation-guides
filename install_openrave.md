## Install OpenRAVE

We use the OpenRAVE core library for simulations. Note that you will be prompted for your password upon using '''sudo'''. 
Official download page: [link](http://openrave.org/). To install a precompiled version of OpenRAVE, type:

```bash
sudo add-apt-repository ppa:openrave/release
sudo apt-get update
sudo apt-get install openrave
```

If nothing happens (e.g. Ubuntu 14.10 as of Dic/2014), a precompiled version of OpenRAVE might not be available on your specific Ubuntu distribution. To compile from source, type:

```bash
sudo apt-get install git-core
sudo apt-get install libboost-all-dev
sudo apt-get install libqt4-dev qt4-dev-tools libxml2-dev libode-dev libfcl-dev  # libfcl-dev recent as of Oct 2016
sudo apt-get install libsoqt4-dev libcoin80-dev
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone --branch latest_stable https://github.com/rdiankov/openrave.git
cd openrave; mkdir build; cd build; cmake ..  # Use -DOPT_VIDEORECORDING=OFF if there are AV errors, -DOPENRAVE_PLUGIN_FCLRAVE=OFF if fcl errors.
make -j3; sudo make install; cd  # go home
```
