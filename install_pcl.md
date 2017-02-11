# Install PCL

We use the Point Coud Library (PCL) for 2D/3D image and point cloud processing. Official download page: [link](http://pointclouds.org/)

- First install [OpenNI2 & NiTE2](install_openni_nite.md) for Xtion Pro Live support.

## Install PCL (Ubuntu 14.04)

```bash
sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get update
sudo apt-get install libpcl-all-dev
sudo apt-get install libopenni-sensor libopenni-sensor-pointclouds0  # no pcl-tools here
```

## Install PCL (Ubuntu 14.10)

```bash
sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get update
sudo apt-get install libpcl-dev
sudo apt-get pcl-tools # no sensor here, but libopenni-sensor-primesense0 may be found elsewhere
```

## Install PCL (More modern Ubuntu, such as 16.04)

No official ppa, [install from source](http://pointclouds.org/documentation/tutorials/compiling_pcl_posix.php).
