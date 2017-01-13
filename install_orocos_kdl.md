# Install OROCOS KDL

We use Orocos KDL for robot kinematics. Official page: [link](http://www.orocos.org/kdl)

# Install OROCOS KDL (Ubuntu)

```bash
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/orocos/orocos_kinematics_dynamics.git
cd orocos_kinematics_dynamics/orocos_kdl
mkdir -p build; cd build
cmake ..
make
sudo make install
```
