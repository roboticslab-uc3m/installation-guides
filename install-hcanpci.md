# Install hcanpci kernel module

## Install hcanpci kernel module (Debian 6.0)

```bash
cd  # go home
mkdir -p repos && cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/roboticslab-uc3m/yarp-devices.git  # Download yarp-devices software from the repository
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

Now add the following line to `/etc/rc.local` (lines before the exit):

```bash
/usr/local/bin/makenodes.sh
```
