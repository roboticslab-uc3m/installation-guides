# Install Aquila

We use Aquila as a library for Dynamic Time Warping (DTW) operations.

Official page: [link](http://aquila-dsp.org/)

## Install Aquila (Ubuntu)

```bash
sudo apt install libsfml-dev
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/zsiciarz/aquila.git
cd aquila; mkdir build; cd build
cmake ..
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd  # install and go home
```

Use the following command in case you get relocation errors when linking Aquila from a shared library ([#55](https://github.com/roboticslab-uc3m/installation-guides/issues/55)), then `make` and install again:

```
cmake .. -DBUILD_SHARED_LIBS=ON
```
