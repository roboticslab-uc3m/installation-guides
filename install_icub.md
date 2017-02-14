# Install icub-main

We use the icub-main repository for the `xsensmtx` device.

```bash
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/icub-main
cd icub-main; mkdir build; cd build
cmake .. -DENABLE_icubmod_xsensmtx=ON
make -j3;  sudo make install; sudo ldconfig; cd  # go home
```

Try it out:
```bash
Terminal 2: yarp server
sudo chmod 777 /dev/ttyUSB0
(Volviendo a la terminal 1) sudo yarpdev --subdevice xsensmtx --device inertial --name /inertial
Terminal 3: yarp read ... /inertial
```
