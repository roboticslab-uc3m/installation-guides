# Install Travis

This library is a wrapper of OpenCV hosted on GitHub.

- First install [OpenCV](install-opencv.md).

## Install Travis (Ubuntu)

```bash
git clone https://github.com/roboticslab-uc3m/travislib.git
cd travislib/main; mkdir build; cd build
cmake ..
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd  # install and go home
```
