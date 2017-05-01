# Install PCL

We use the Point Coud Library (PCL) for 2D/3D image and point cloud processing. Official download page: [link](http://pointclouds.org/)

- First install [OpenNI2 & NiTE2](install-openni-nite.md) for Xtion Pro Live support.

## Install PCL 1.7.2-1+trusty6 (Ubuntu 14.04)

For Trusty and similar versions, we need to add the jochen-sprickerhof PPA ([ref](https://launchpad.net/~v-launchpad-jochen-sprickerhof-de/+archive/ubuntu/pcl)).

```bash
sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get update
sudo apt-get install libpcl-all libpcl-all-dev
sudo apt-get install libopenni-sensor-primesense0 # no pcl-tools here; and libopenni-sensor-pointclouds0 cannot be installed simultaneously.
```

## Install PCL (Ubuntu 14.10)

```bash
sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get update
sudo apt-get install libpcl-dev
sudo apt-get install pcl-tools # no sensor here, but libopenni-sensor-primesense0 may be found elsewhere
```

## Install PCL 1.7.2-14build1 with VTK 6.2.0+dfsg1-10build1 (Ubuntu 16.04)

PCL is available directly as part of `universe` in modern Ubuntu distros (see [here](https://launchpad.net/ubuntu/+source/pcl)).

```bash
sudo apt-get install libpcl-dev  # depends: libvtk6-dev
```

## Install PCL (From source)

Link: [install from source](http://pointclouds.org/documentation/tutorials/compiling_pcl_posix.php).

## Install PCL (For any distro with CUDA for KinFu)

No official ppa, install CUDA, then [install from source](http://pointclouds.org/documentation/tutorials/compiling_pcl_posix.php) setting additional flags to get `pcl_kinfu_largeScale`, `pcl_kinfu_largeScale_mesh_output`, `pcl_kinfu_largeScale_texture_output`.

See additional info [here](https://david-estevez.gitbooks.io/install-guides/content/01_pcl_cuda.html).
