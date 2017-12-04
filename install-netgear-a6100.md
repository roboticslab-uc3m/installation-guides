# Setting up Wifi connection: Netgear A6100 WiFi USB Mini Adapter

First, we have to install required drivers that have not been merged with the linux kernel and do not come with most linux distros.

We can install the required build packages, corresponding to our kernel version:
```bash
 uname -r
 sudo apt-get install linux-headers-$(uname -r) build-essential
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

Now Then install using make install. Then add 8812au to the end of the file /etc/modules with tee -a to tell the OS to load the driver when it boots
```bash
 sudo make install
 sudo modprobe 8812au
 echo 8812au | sudo tee -a /etc/modules
```

The wireless should now be working.
