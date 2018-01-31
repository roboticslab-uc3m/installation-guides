# Install JR3

```bash
cd  # go $HOME
cd repos
git clone https://github.com/roboticslab-uc3m/LoliRepo
cd /home/teo/repos/LoliRepo/jr3/jr3pci-linux-0.5
make
```

Now add the following lines to `/etc/rc.local` (lines before the exit) to automatically run the jr3 module in the PC switching on (may require `sudo` if run manually):

```bash
insmod /home/teo/repos/LoliRepo/jr3/jr3pci-linux-0.5/jr3pci-driver.ko
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

If green LEDs are off after switching on the PC and "jr3pci_driver" does not appear after doing lsmod, try in the jr3 directory (on manipulation PC: `/home/teo/repos/LoliRepo/jr3/jr3pci-linux-0.5/`) and see README_loli. Maybe `make clean` before, sometimes works:

```bash 
sudo make
sudo insmod jr3pci-driver.ko
sudo make node
```

If it doesn't work, type `lspci` to see PCI devices connected to the computer. It should be there `PCI bridge: Pericom Semiconductor PI7C9X110 PCI Express to PCI bridge` which is the PCI card Adapter.
If nothing works, shutdown and revise connections!! (Revise: PCI adapter connections, power and PCI slots).

