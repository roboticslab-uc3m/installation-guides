# Install ROS
ROS is used to communicate with a wide variety of robots. Specifically, we use it to communicate with TIAGo, a robot from PAL Robotics.

## Install ROS Kinetic Kame (Ubuntu 16.04)

Add the ros repository to apt sources and setup the repository keys
```bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
```

Download and install ROS
```bash
sudo apt update
sudo apt-get install ros-kinetic-desktop-full
```

## Install ROS Indigo Igloo (Ubuntu 13.10 and 14.04)
Add the ros repository to apt sources and setup the repository keys
```bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
```

Download and install ROS
```bash
sudo apt update
sudo apt install git python-rosinstall ros-indigo-desktop-full python-catkin-tools ros-indigo-joint-state-controller ros-indigo-twist-mux ros-indigo-ompl ros-indigo-controller-manager ros-indigo-moveit-core ros-indigo-moveit-ros-perception ros-indigo-moveit-ros-move-group ros-indigo-moveit-kinematics ros-indigo-moveit-ros-planning-interface ros-indigo-moveit-simple-controller-manager ros-indigo-moveit-planners-ompl ros-indigo-joy ros-indigo-joy-teleop ros-indigo-teleop-tools ros-indigo-control-toolbox ros-indigo-sound-play ros-indigo-navigation ros-indigo-eband-local-planner ros-indigo-depthimage-to-laserscan  ros-indigo-openslam-gmapping ros-indigo-gmapping ros-indigo-moveit-commander ros-indigo-geometry-experimental
```

extend the environment to include the catkin commands in any new opened console
```bash
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
```

### Extend the installation
To look for more ROS packages available for installation, execute
```bash
apt-cache search ros-indigo
```
