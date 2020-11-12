# (Legacy) Install YARP

This is Legacy documentation regarding YARP installations. Updated YARP installation at: [Install YARP](install-yarp.md)

## Note for Linux Mint 17.3 Rosa

```bash
sudo apt install libqt5opengl5-dev # Avoid error on yarpmanager/builder GUI
```

## Install additional YARP device: OpenNI2DeviceServer (Ubuntu)

* **Note:** tested on YARP `2.3.68.x` and YARP `2.3.72.1`, not compatible with YARP `3.x.*`

```bash
cd ~/repos/yarp/build
cmake .. -DCREATE_DEVICE_LIBRARY_MODULES=ON -DENABLE_yarpmod_OpenNI2DeviceServer=ON -DENABLE_yarpmod_OpenNI2DeviceClient=ON -DOpenNI2_INCLUDE_DIR=/usr/local/include/OpenNI2/ -DOpenNI2_LIBRARY=/usr/local/lib/libOpenNI2.so
make -j$(nproc) # Compile
sudo make install && sudo ldconfig && cd # Install and go home
```

You should now be able to launch `yarpdev --device OpenNI2DeviceServer`. It is a complex device, see options with `yarpdev --device OpenNI2DeviceServer --verbose` (where there is an option to see modes) or example [here](https://github.com/roboticslab-uc3m/teo-configuration-files/blob/ee168eaf61454113b1ac7113fbb24e10af679bc3/share/teoBase/scripts/teoBase.xml#L35-L36).

## Install additional YARP device: OpenNI2DeviceServer (Ubuntu) with NiTE (skeletons)

* **Note:** not compatible with YARP `3.x.*`

NiTE only required for skeletons. In addition to above steps for OpenNI:

- [Install NiTE2.2 (Ubuntu)](install-openni-nite.md#install-nite22-ubuntu)

```bash
cd ~/repos/yarp/build
cmake .. -DNITE2_INCLUDE_LOCAL=/usr/local/include/NiTE-Linux-x64-2.2 -DNITE2_LIBRARY=/usr/local/lib/libNiTE2.so
make -j$(nproc) # Compile
sudo make install && sudo ldconfig && cd # Install and go home
```

You may need to launch `yarpdev --device OpenNI2DeviceServer` from `/YOUR_PATH_TO/NiTE-Linux-x64-2.2/Redist` if using NiTE.
