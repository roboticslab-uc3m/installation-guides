# Install Aquila

We use Aquila as a library for Dynamic Time Warping (DTW) operations.

Official page: [link](http://aquila-dsp.org/)

## Install Aquila (Ubuntu)

```bash
sudo apt-get install libsfml-dev
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone git://github.com/zsiciarz/aquila.git
cd aquila; mkdir build; cd build
cmake ..
make -j3;  sudo make install; sudo ldconfig; cd  # go home
```
