# JR3 card

Now add the following lines to `/etc/rc.local` (lines before the exit) to automatically run the jr3 module in the PC switching on:

```bash
cd  # go $HOME
cd repos
git clone https://github.com/lpinel/LoliRepo
cd /home/teo/repos/LoliRepo/jr3/jr3pci-linux-0.5
make
insmod /home/teo/repos/LoliRepo/jr3/jr3pci-linux-0.5/jr3pci-driver.ko
mknod /dev/jr3 c 39 0
chmod 777 /dev/jr3 #admin permission 
```

If green LEDs are off after switching on the PC and "jr3pci_driver" does not appear after doing lsmod, try in the jr3 directory (on manipulation PC: `/home/teo/repos/LoliRepo/jr3/jr3pci-linux-0.5/`) and see README_loli. Maybe `make clean` before, sometimes works:

```bash 
sudo make
sudo insmod jr3pci-driver.ko
sudo make node
```

If it doesn't work, type `lspci` to see PCI devices connected to the computer. It should be there `PCI bridge: Pericom Semiconductor PI7C9X110 PCI Express to PCI bridge` which is the PCI card Adapter.
If nothing works, shutdown and revise connections!! (Revise: PCI adapter connections, power and PCI slots).

In order to  **run the acquisition program**, go to manipulation PC: `/home/teo/repos/LoliRepo/LoliRepo/TFM/jr3Yarp/jr3pci4channelYarp/build` and execute `./jr3pci4channelYarp` for all sensors data acquisition.
