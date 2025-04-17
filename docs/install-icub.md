# Install icub-main

We use the icub-main repository for the `xsensmtx` device.

Make sure you have previously installed [YARP with lib_math](install-yarp.md).

```bash
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/icub-main
cd icub-main; mkdir build; cd build
cmake .. -DENABLE_icubmod_xsensmtx=ON
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd  # install and go home
```

Try `xsensmtx` out:
```bash
[Terminal 1] yarp server
[Terminal 2] sudo chmod 777 /dev/ttyUSB0
[Terminal 2] sudo yarpdev --device deviceBundler --wrapper_device multipleanalogsensorsserver --attached_device xsensmtx --name /inertial --period 5
[Terminal 3] yarp read ... /inertial
```
