# Install JR3

Download and compile JR3 kernel driver:
```bash
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/roboticslab-uc3m/jr3pci-linux
cd jr3pci-linux
make
```

In order to install and load the driver in kernel, at this point you may go away with a simple `sudo make install`. This will also install the IOCTL header for use by dependent project (such as our YARP device). To achieve the latter in an isolated manner, use `sudo make install-header`.

The traditional way we used to do this instead is detailed below (beware: the header will need to be installed manually):

```bash
cd /lib/modules/$(uname -r)/kernel/drivers
sudo mkdir -p jr3
sudo cp $HOME/repos/jr3pci-linux/jr3pci-driver.ko jr3/
sudo depmod
```

In case the compiled driver is not regitered and loaded automatically, add the following lines to `/etc/rc.local` (lines before the exit) to load the jr3 kernel module on startup (may require `sudo` if run manually):

```bash
modprobe jr3pci-driver  # Replaces: insmod jr3pci-driver.ko
mknod /dev/jr3 c 39 0  # Equivalent to (in code dir): make node
chmod 777 /dev/jr3
```
Note: the `/etc/rc.local` file on Ubuntu and Debian systems are used to execute commands at system startup. But there's no such file in **Ubuntu 18.04**. So, we need to create it adding this lines:

```bash
#!/bin/bash
modprobe jr3pci-driver
mknod /dev/jr3 c 39 0 
chmod 777 /dev/jr3
exit 0
```
Now make it executable with:

```bash
chmod +x /etc/rc.local
```

## View JR3 data

There is a handy ncurses utility included in the driver repository. Make sure you have installed the Ncurses library and then compile the application:

```bash
sudo apt install libncurses-dev
cd repos/jr3pci-linux
make jr3mon
```

If you want to go the YARP way, then you can use our acquisition device:
1. Install https://github.com/roboticslab-uc3m/yarp-devices
1. Go to manipulation PC:
   ```
   yarpdev --device Jr3 --period 20 --name /jr3  --ports "(ch0:o ch1:o ch2:o ch3:o)" --channels 24 --ch0:o 0 5 0 5 --ch1:o 6 11 0 5 --ch2:o 12 17 0 5 --ch3:o 18 23 0 5
   ```
1. Data can be vizualized via classic `yarp read ... /jr3/ch0:o` or like in [teoTools.xml](https://github.com/roboticslab-uc3m/teo-configuration-files/blob/762ebe5079e05da38602e21e2feccd9901d8513d/share/teoTools/scripts/teoTools.xml#L44-L71).

## Troubleshooting JR3

Green LEDs should be ON after `jr3pci_driver` module is loaded (see `lsmod | grep jr3`). Check `/etc/rc.local` to see if this is the default upon switching on the PC. Possible fixes if not working:

1. Type `lspci` to see PCI devices connected to the computer. The PCI card Adapter `PCI bridge: Pericom Semiconductor PI7C9X110 PCI Express to PCI bridge` should be there.

1. Shutdown and review connections!! (review: PCI adapter connections, power and PCI slots).

1. If it is due to a kernel upgrade, sometimes cleaning and installing again works:
   ```bash 
   cd $HOME/repos/jr3pci-linux
   sudo make clean
   make
   cd /lib/modules/$(uname -r)/kernel/drivers
   sudo mkdir -p jr3
   sudo cp $HOME/repos/jr3pci-linux/jr3pci-driver.ko jr3/
   sudo depmod
   ```

## Unclassified
The following repo contains a driver described as suitable for jr3 for Xenomai using RTDM: https://github.com/wdomski/jr3
