# Install PCAN-M.2 Driver for Linux (Ubuntu 16.04)

Official page:  [link](https://www.peak-system.com/fileadmin/media/linux/index.htm)
Manual:         [link](https://www.peak-system.com/fileadmin/media/linux/files/PCAN-Driver-Linux_UserMan_eng.pdf)

```bash
sudo apt-get install libpopt-dev libelf-dev
cd && mkdir -p ~/src/ && mkdir -p ~/src/peak && cd ~/src/peak
wget https://www.peak-system.com/fileadmin/media/linux/files/peak-linux-driver-8.5.1.tar.gz
tar -xzf peak-linux-driver-8.5.1.tar.gz # Untar the compressed tarball file
cd peak-linux-driver-8.5.1/ 
make -C driver PCI=PCI_SUPPORT DNG=NO_DONGLE_SUPPORT USB=NO_USB_SUPPORT ISA=NO_ISA_SUPPORT PCC=NO_PCCARD_SUPPORT
sudo make -C driver install
make -C test && sudo make -C test install # test utilities (optional)
sudo modprobe pcan # driver loading
cd && cd repos/yarp-devices/build/
ccmake .. -DENABLE_CanBusHico=OFF -DENABLE_CanBusPeak=ON  # configure yarp-devices to use CanBusPeak
make -j$(nproc) && sudo make install # Compile and install
cd # go home
```
