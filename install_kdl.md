# Install KDL

We use KDL for kinematics. Official download page: [link](http://www.orocos.org/kdl). </br>
Installing KDL on Ubuntu is quite straightforward. Note that you will be prompted for your password upon using '''sudo''' a couple of times:

## Install KDL (Ubuntu)

```bash
sudo apt-get install libeigen3-dev
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/orocos/orocos_kinematics_dynamics.git
cd orocos_kinematics_dynamics/orocos_kdl; mkdir build; cd build
cmake ..
make -j3;  sudo make install; sudo ldconfig; cd  # go home
```

Starting from <b>Ubuntu 16.04</b>, KDL is conveniently distributed as a package:

```bash
sudo apt-get install liborocos-kdl-dev
```
