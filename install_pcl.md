# Install PCL (Point Coud Library)

We use PCL for 2D/3D image and point cloud processing. Official download page: [link](http://pointclouds.org/)

- First install [OpenNI2 & NiTE2](install_openni_nite.md) for Xtion Pro Live support.

## Install PCL (Point Coud Library) (Ubuntu)

```bash
sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get update
sudo apt-get install libpcl-dev pcl-tools libopenni-sensor-primesense0  # libpcl-dev & pcl-tools instead of libpcl-all-dev as of Dic/2015
```
