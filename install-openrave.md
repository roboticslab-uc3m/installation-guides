# Install OpenRAVE

We use the OpenRAVE core library for simulations. Note that you will be prompted for your password upon using `sudo`.

- Official links: [[OpenRAVE](http://openrave.org/)]. [[OpenRAVE: Building and Installing page](http://openrave.org/docs/latest_stable/coreapihtml/installation.html)].
- Additional links: [[ref1, trusty, see next link if still in trouble with FCL](http://fsuarez6.github.io/blog/openrave-trusty/)]. [[ref2, xenial](http://fsuarez6.github.io/blog/workstation-setup-xenial/)]. [[ref3, xenial](http://www.aizac.info/installing-openrave0-9-on-ubuntu-trusty-14-04-64bit/)].

## Install OpenRAVE (Most modern Ubuntu, such as 14.04 or 16.04)

No official PPA, install from source.

```bash
sudo apt install git
sudo apt install libboost-all-dev
sudo apt install libqt4-dev qt4-dev-tools libxml2-dev libode-dev
sudo apt install libsoqt4-dev libcoin80-dev
sudo apt install python-sympy python-scipy  # For openravepy
sudo apt install libcollada-dom2.4-dp-dev  # Open .zae files, only Ubuntu 16.04
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone --branch master https://github.com/rdiankov/openrave.git
cd openrave; mkdir build; cd build; cmake ..  # Use -DOPT_VIDEORECORDING=OFF if there are AV errors
make -j$(nproc)
sudo make install; cd  # install and go home
```

Note that you may end up requiring over 2 GB of free space during the installation of `apt` dependencies. To avoid that, use the `--no-install-recommends` option as in:

`sudo apt install --no-install-recommends package`

Thus, `apt` would not try to install non-critical packages marked as *recommended* by the dependencies of OpenRAVE.

## Install OpenRAVE with FCL (Confirmed for Ubuntu 15.04, 15.10, 16.10, 17.04)

```bash
sudo apt install libfcl-dev
cd $HOME/repos/openrave; mkdir build; cd build; cmake .. -DOPENRAVE_PLUGIN_FCLRAVE=ON
make -j$(nproc)
sudo make install; cd  # install and go home
```
For more references regarding FCL from source on other versions, refer to [this issue](https://github.com/roboticslab-uc3m/installation-guides/issues/3).

## Install OpenRAVE (Ubuntu 12.04)

To install a precompiled version of OpenRAVE, type:

```bash
sudo add-apt-repository ppa:openrave/release
sudo apt-get update
sudo apt-get install openrave
```

## Tutorials
- https://scaron.info/teaching/getting-started-with-openrave.html
