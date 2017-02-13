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

7. [Install pip](install-pip.md)
8. [Install Numpy](install-numpy.md)
```
$ sudo -H pip install numpy
```
9. Download OpenCV main repo
```
$ mkdir -p repos
$ cd repos
$ git clone https://github.com/Itseez/opencv.git
$ cd opencv
$ git checkout 3.0.0
```
10. Download OpenCV contrib repo
```
$ cd ..
$ git clone https://github.com/Itseez/opencv_contrib.git
$ cd opencv_contrib
$ git checkout 3.0.0
```
11. Configure OpenCV main repo
```
$ cd ../opencv
$ mkdir build
$ cd build
$ cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=ON \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	-D BUILD_EXAMPLES=ON ..
```
The last step can also be done by hand using `ccmake`.

12. Compile and install
(This will probably take a long time, use the `-j` flag to speed up things using multithreaded compilation)
```
$ make
$ sudo make install
```
## Install OpenCV 3 (With contrib, Python 3 support and fix for SVM_load)
ToDo