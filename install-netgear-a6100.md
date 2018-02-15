# Netgear A6100 WiFi USB Mini Adapter

## Ubuntu 16.04:

```bash
sudo apt-get update
sudo apt-get install linux-headers-generic build-essential git
cd $HOME
mkdir -p src
cd src
git clone https://github.com/abperiasamy/rtl8812AU_8821AU_linux.git
cd rtl8812AU_8821AU_linux
make
sudo make install
sudo modprobe rtl8812au
```

In the original post it is `sudo modprobe 8812au`, but you will get a not found error since based on the make ouput `install -p -m 644 rtl8812au.ko /lib/modules/4.4.0–47-generic/kernel/drivers/net/wireless/`, the name should be `rtl8812au`

After every kernel update, need to run the following again.

```bash
make
sudo make install
sudo modprobe rtl8812au
```

## Debian 6.0:

First, we have to install required drivers that have not been merged with the linux kernel and do not come with most linux distros.

We can install the required build packages, corresponding to our kernel version:
```bash
 uname -r
 sudo apt install linux-headers-$(uname -r) build-essential
```

Now, we will download the source code: 
```bash
 cd $HOME
 mkdir -p src
 cd src
 git clone https://github.com/diederikdehaas/rtl8812AU.git
```

Compile the kernel module:
```bash
 cd rtl8812AU-driver-4.3.14
 make
```

Now install using `sudo make install`, and perhaps a `depmod`. Then add 8812au to the end of the file `/etc/modules` with `tee -a` to tell the OS to load the driver when it boots
```bash
 sudo make install
 sudo modprobe 8812au
 echo 8812au | sudo tee -a /etc/modules
```

The wireless should now be working.


