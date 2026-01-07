# Install Gazebo (Gazebo Sim)

This page refers to the current versions of Gazebo (Gazebo Sim). Legacy documentation regarding Gazebo Classic installations can be found at: [(Legacy) Install Gazebo Classic](legacy/legacy-install-gazebo-classic.md)

- Official page: <https://gazebosim.org>
- Official installations page: <https://gazebosim.org/docs/all/getstarted/>

## Install Gazebo Harmonic (Ubuntu)

Follow the steps on <https://gazebosim.org/docs/harmonic/install_ubuntu/>

### Gazebo Harmonic + ROS 2 Jazzy (Ubuntu 24.04 Noble)

```bash
sudo apt install ros-jazzy-ros-gz
sudo apt install ros-jazzy-gz-ros2-control*
```

More info:

- <https://github.com/gazebosim/ros_gz/tree/jazzy/ros_gz_sim_demos>
- <https://gazebosim.org/docs/harmonic/ros2_integration/>

## Install Gazebo Fortress (Ubuntu)

Follow the steps on <https://gazebosim.org/docs/fortress/install_ubuntu/>

### Gazebo Fortress + ROS 2 Humble (Ubuntu 22.04 Jammy)

```bash
sudo apt install ros-humble-ros-gz
sudo apt install ros-humble-gz-ros2-control*
```

More info:

- <https://github.com/gazebosim/ros_gz/tree/humble/ros_gz_sim_demos>
- <https://gazebosim.org/docs/fortress/ros2_integration/>

## Troubleshooting

Also see [(Legacy) Install Gazebo Classic: Troubleshooting](legacy/legacy-install-gazebo-classic.md#troubleshooting)

### terminate called after throwing an instance of 'Ogre::UnimplementedException'

Problem: Gazebo Fortress + Ubuntu 22.04 Jammy (via WSL where Windows uses GPU NVIDIA), opening a 3D environment, Gazebo shuts down with the following error:

```bash
terminate called after throwing an instance of 'Ogre::UnimplementedException'
  what():  OGRE EXCEPTION(9:UnimplementedException):  in GL3PlusTextureGpu::copyTo at /build/ogre-next-UFfg83/ogre-next-2.2.5+dfsg3/RenderSystems/GL3Plus/src/OgreGL3PlusTextureGpu.cpp (line 677)
Stack trace (most recent call last) in thread 516:
#10   Object "[0xffffffffffffffff]", at 0xffffffffffffffff, in
#9    Object "/lib/x86_64-linux-gnu/libc.so.6", at 0x72ebc9f268bf, in
#8    Object "/lib/x86_64-linux-gnu/libc.so.6", at 0x72ebc9e94ac2, in
#7    Object "/lib/x86_64-linux-gnu/libQt5Core.so.5", at 0x72ebc409199d, in
#6    Object "/lib/x86_64-linux-gnu/libQt5Core.so.5", at 0x72ebc408ff90, in qTerminate()
#5    Object "/lib/x86_64-linux-gnu/libstdc++.so.6", at 0x72ebc62ae276, in std::terminate()
#4    Object "/lib/x86_64-linux-gnu/libstdc++.so.6", at 0x72ebc62ae20b, in
#3    Object "/lib/x86_64-linux-gnu/libstdc++.so.6", at 0x72ebc62a2b9d, in
#2    Object "/lib/x86_64-linux-gnu/libc.so.6", at 0x72ebc9e287f2, in abort
#1    Object "/lib/x86_64-linux-gnu/libc.so.6", at 0x72ebc9e42475, in raise
#0    Object "/lib/x86_64-linux-gnu/libc.so.6", at 0x72ebc9e969fc, in pthread_kill
Aborted (Signal sent by tkill() 408 1000)
```

Solution: Disable 3D graphics hardware acceleration via (before launching Gazebo, e.g. can be incorporated into `~/.bashrc`):

```bash
export LIBGL_ALWAYS_SOFTWARE=1
```
