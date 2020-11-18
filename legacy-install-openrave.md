# (Legacy) Install OpenRAVE

This is Legacy documentation regarding YARP installations. Updated YARP installation at: [Install OpenRAVE](install-openrave.md)

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
- http://robots.uc3m.es/index.php/OpenRAVE_R1457_Windows_Install
- https://www.cs.cmu.edu/~motionplanning/homework/hw1/hw1.html
- http://openrave.org/docs/latest_stable/coreapihtml/installation_windows.html
- http://sukhoy.public.iastate.edu/openrave/
- https://github.com/rdiankov/openrave
