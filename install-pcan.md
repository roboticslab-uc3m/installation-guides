# Install PCAN-M.2 Driver for Linux (Ubuntu 16.04)

## Links of interest
* Official page:  [link](https://www.peak-system.com/fileadmin/media/linux/index.htm)
* Manual:         [link](https://www.peak-system.com/fileadmin/media/linux/files/PCAN-Driver-Linux_UserMan_eng.pdf)

## Driver installation
```bash
cd && mkdir -p ~/src/peak && cd ~/src/peak
wget https://www.peak-system.com/fileadmin/media/linux/files/peak-linux-driver-8.9.0.tar.gz
tar -xzf peak-linux-driver-8.9.0.tar.gz # Untar the compressed tarball file
cd peak-linux-driver-8.9.0/ 
make -C driver PCI=PCI_SUPPORT PCIEC=NO_PCIEC_SUPPORT DNG=NO_DONGLE_SUPPORT USB=NO_USB_SUPPORT ISA=NO_ISA_SUPPORT PCC=NO_PCCARD_SUPPORT
sudo make -C driver install
make -C lib && sudo make -C lib install
make -C test && sudo make -C test install # test utilities (optional)
sudo modprobe pcan # driver loading
```

## Activate CanBusPeak in yarp-devices
Note: These lines assume that yarp-devices has been cloned, configured and compiled. If not, follow the [installation instructions](https://github.com/roboticslab-uc3m/yarp-devices/blob/develop/doc/yarp-devices-install.md).

```bash
cd && cd repos/yarp-devices/build/
cmake .. -DENABLE_CanBusPeak=ON  # configure yarp-devices to use CanBusPeak
make -j$(nproc) && sudo make install # Compile and install
cd # go home
```
