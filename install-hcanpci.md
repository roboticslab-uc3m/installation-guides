# Install hcanpci kernel module

## Install hcanpci kernel module (Debian 6.0)

```bash
cd  # go home
mkdir -p src && cd src  # make $HOME/src if it doesn't exist; then, enter it
tar xvf ../yarp-devices/extern/hcanpci/linux-2-6-32/100_hcanpci_linux-v1207en-edi1822.tar.gz
cd hcanpci_linux-v1207en/driver
make
sudo mkdir /lib/modules/2.6.32-5-686/kernel/can
sudo cp hcanpci.ko /lib/modules/2.6.32-5-686/kernel/can
sudo depmod
sudo ln -s $PWD/driver/makenodes.sh /usr/local/bin
```

## Install hcanpci kernel module (Ubuntu 14.04)

```bash
cd  # go home
cd repos
git clone https://github.com/munozyanez/hc-driver-4.9
cd hc-driver-4.9/miniPCI2to4CH/driver
make
sudo mkdir /lib/modules/4.4.0-31-generic/kernel/can
sudo cp hcanpci.ko /lib/modules/4.4.0-31-generic/kernel/can
sudo depmod
cd
sudo ln -s $PWD/repos/hc-driver-4.9/miniPCI2to4CH/driver/makenodes.sh /usr/local/bin
sudo ldconfig
```

Now add the following line to `/etc/rc.local` (lines before the exit):

```bash
/usr/local/bin/makenodes.sh
```
