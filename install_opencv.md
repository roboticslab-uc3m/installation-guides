# Install OpenCV

We use OpenCV for real-time computer vision. Official download page: [link](http://opencv.org/)

## Install OpenCV (Ubuntu)

```bash
sudo apt-get install libopencv-dev
```

## Install OpenCV 3 (With contrib and Python 3 support)
Adapted from [this post](http://www.pyimagesearch.com/2015/07/20/install-opencv-3-0-and-python-3-4-on-ubuntu/).

1. Upgrade any pre-installed packages:
```bash
$ sudo apt-get update
$ sudo apt-get upgrade
```	
2. Install developer tools used to compile OpenCV 3.0:
```bash
$ sudo apt-get install build-essential cmake git pkg-config
```
3. Install libraries and packages used to read various image and video formats from disk:
```bash
$ sudo apt-get install libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev
$ sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
```
4. Install GTK so we can use OpenCV’s GUI features:
```	
$ sudo apt-get install libgtk2.0-dev
```
5. Install packages that are used to optimize various functions inside OpenCV, such as matrix operations:
```
$ sudo apt-get install libatlas-base-dev gfortran
```

6. Install the Python 3.4+ headers and development files:
```
$ sudo apt-get install python3.4-dev
```

7. [Install Numpy]()
```
$ pip install numpy
```
	
$ pip install numpy

## Install OpenCV 3 (With contrib, Python 3 support and fix for SVM_load)
ToDo