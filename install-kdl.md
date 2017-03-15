# Install KDL

We use Orocos KDL for robot kinematics. Official download page: [link](http://www.orocos.org/kdl).

Make sure you have previously installed [Eigen3](install-eigen.md).

Installing KDL on Ubuntu is quite straightforward. Note that you will be prompted for your password upon using '''sudo''' a couple of times:

## Install KDL (Ubuntu)

```bash
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/orocos/orocos_kinematics_dynamics.git
cd orocos_kinematics_dynamics/orocos_kdl; mkdir build; cd build
cmake ..
make -j3;  sudo make install; sudo ldconfig; cd  # go home
```
