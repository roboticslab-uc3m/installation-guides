# Install JR3

Download, compile and install JR3 kernel driver.
```bash
cd  # go $HOME
cd repos
git clone https://github.com/roboticslab-uc3m/jr3pci-linux
cd jr3pci-linux
make
cd /lib/modules/$(uname -r)/kernel/drivers
sudo mkdir jr3
sudo cp $HOME/repos/jr3pci-linux/jr3pci-driver.ko jr3/
sudo depmod
```

To load the compiled driver, add the following lines to `/etc/rc.local` (lines before the exit) to automatically run the jr3 module in the PC switching on (may require `sudo` if run manually):

```bash
modprobe jr3pci-driver # Replaces: insmod jr3pci-driver.ko
mknod /dev/jr3 c 39 0
chmod 777 /dev/jr3
```

## View JR3 data

In order to  run the acquisition program for all sensors data acquisition:
1. Install https://github.com/roboticslab-uc3m/yarp-devices
1. Go to manipulation PC:
   ```
   yarpdev --device Jr3 --period 20 --name /jr3  --ports "(ch0:o ch1:o ch2:o ch3:o)" --channels 24 --ch0:o 0 5 0 5 --ch1:o 6 11 0 5 --ch2:o 12 17 0 5 --ch3:o 18 23 0 5
   ```
1. Data can be vizualized via classic `yarp read ... /jr3/ch0:o` or like in [teoTools.xml](https://github.com/roboticslab-uc3m/teo-configuration-files/blob/762ebe5079e05da38602e21e2feccd9901d8513d/share/teoTools/scripts/teoTools.xml#L44-L71).

## Troubleshooting JR3

Green LEDs should be ON after `jr3pci_driver` module is loaded (see `lsmod`). Check `/etc/rc.local` to see if this is the default upon switching on the PC. Possible fixes if not working:

1. Type `lspci` to see PCI devices connected to the computer. It should be there `PCI bridge: Pericom Semiconductor PI7C9X110 PCI Express to PCI bridge` which is the PCI card Adapter.

1. Try in the jr3 directory (on manipulation PC: `/home/teo/repos/LoliRepo/jr3/jr3pci-linux-0.5/`) and see README_loli.

1. If it is due to a kernel upgrade, sometimes this works:

```bash 
sudo make clean
sudo make
sudo insmod jr3pci-driver.ko
sudo make node
```

1. If nothing works, shutdown and revise connections!! (Revise: PCI adapter connections, power and PCI slots).
