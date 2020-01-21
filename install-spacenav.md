# Install Spacenav

We use Spacenav for interfacing with [3Dconnexion's](https://www.3dconnexion.com/) input devices (like the SpaceNavigator 6 DOF mouse).

Official page: [link](http://spacenav.sourceforge.net/).

## Install Spacenav (Ubuntu)

You'll get the development files from:

```bash
sudo apt install libspnav-dev spacenavd
```

Omit the `spacenavd` package in case you don't want to install the daemon (e.g. you won't connect the device to your PC).
