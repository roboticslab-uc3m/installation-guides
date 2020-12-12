# Install OpenCV

We use OpenCV for real-time computer vision. Official download page: [link](http://opencv.org/)

## Install OpenCV (Ubuntu)

```bash
sudo apt install libopencv-dev
```

## Install OpenCV 3 (With contrib and Python 3 support)

Adapted from [this post](http://www.pyimagesearch.com/2015/07/20/install-opencv-3-0-and-python-3-4-on-ubuntu/).

1. Upgrade any pre-installed packages:

   ```bash
   sudo apt update
   sudo apt upgrade
   ```

2. Install developer tools used to compile OpenCV 3.0:

   ```bash
   sudo apt install build-essential cmake git pkg-config
   ```

3. Install libraries and packages used to read various image and video formats from disk:

   ```bash
   sudo apt install libjpeg8-dev libtiff-dev libjasper-dev libpng12-dev
   sudo apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
   ```

4. Install GTK so we can use OpenCV’s GUI features:

   ```bash
   sudo apt install libgtk2.0-dev
   ```

5. Install packages that are used to optimize various functions inside OpenCV, such as matrix operations:

   ```bash
   sudo apt install libatlas-base-dev gfortran
   ```

6. Install the Python 3.4+ headers and development files:

   ```bash
   sudo apt install python3.4-dev
   ```

7. [Install pip](install-pip.md)

8. [Install Numpy](install-numpy.md)

   ```bash
   sudo -H pip install numpy
   ```

9. Download OpenCV main repo

   ```bash
   mkdir -p repos
   cd repos
   git clone https://github.com/Itseez/opencv.git
   cd opencv
   git checkout 3.0.0
   ```

10. Download OpenCV contrib repo

   ```bash
   cd ..
   git clone https://github.com/Itseez/opencv_contrib.git
   cd opencv_contrib
   git checkout 3.0.0
   ```

11. Configure OpenCV main repo

   ```bash
   cd ../opencv
   mkdir build
   cd build
   cmake -D CMAKE_BUILD_TYPE=RELEASE \
         -D CMAKE_INSTALL_PREFIX=/usr/local \
         -D INSTALL_C_EXAMPLES=ON \
         -D INSTALL_PYTHON_EXAMPLES=ON \
         -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
         -D BUILD_EXAMPLES=ON ..
   ```

   The last step can also be done by hand using `ccmake`.

12. Compile and install (This will probably take a long time, use the `-j` flag to speed up things using multithreaded compilation)

   ```bash
  make -j$(nproc)  # compile
   sudo make install; sudo ldconfig; cd  # install and go home
   ```

## Install OpenCV 3 (With contrib, Python 3 support and fix for SVM_load)

OpenCV 3 has no method to load the SVM unless the specific commit where this was fixed is used (see [this](https://github.com/opencv/opencv/issues/4969) and [this](https://github.com/roboticslab-uc3m/textiles/issues/20) for related info).

To install OpenCV 3 with support for SVM loading, follow the previous steps, executing the following commands after step 10: 

```bash
cd ../opencv
git checkout 37cbcf024c2b4160648299887a7c28d7cf28b1d3
cd ../opencv_contrib
git checkout 5409d5ad560523c85c6796cc5a009347072d883c
```

Then, continue with the previous guide, executing steps 11 and 12.

## Install OpenCV 3 (With Python 3 support, CUDA 8 support, no NVIDIA driver installed)

To install OpenCV 3 with Python 3 support and CUDA 8 support (but no NVIDIA driver installed), follow the steps 1-9 of **Install OpenCV 3 (With contrib and Python 3 support)**. Then, perform these steps:

1. Patch the `3.0.0` branch to fix the issue with removed `GraphCut` in CUDA 8

   ```bash
   git format-patch -1 10896129b39655e19e4e7c529153cb5c2191a1db
   git am < 0001-GraphCut-deprecated-in-CUDA-7.5-and-removed-in-8.0.patch
   ```

2. Configure OpenCV main repo with CUDA and `libcuda.so` path

   ```bash
   mkdir build
   cd build
   cmake -D CMAKE_BUILD_TYPE=RELEASE \
         -D CMAKE_INSTALL_PREFIX=/usr/local \
         -D INSTALL_C_EXAMPLES=ON \
         -D INSTALL_PYTHON_EXAMPLES=ON \
         -D BUILD_EXAMPLES=ON \
         -D WITH_CUDA=ON \
         -D BUILD_CUDA_STUBS=ON \
         -D CMAKE_LIBRARY_PATH=/usr/local/cuda/lib64/stubs..
   ```

   The last step can also be done by hand using `ccmake`.

3. Compile and install

   (This will probably take a long time, use the `-j` flag to speed up things using multithreaded compilation)

   ```bash
   make -j$(nproc)  # compile
   sudo make install; sudo ldconfig; cd  # install and go home
   ```
