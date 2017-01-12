## Install OROCOS KDL

We use orocos_kdl for robot kinematics. Official page: [link](http://www.orocos.org/kdl)

```bash
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/orocos/orocos_kinematics_dynamics.git
cd orocos_kinematics_dynamics/orocos_kdl
mkdir -p build; cd build
cmake ..
make
sudo make install
```
