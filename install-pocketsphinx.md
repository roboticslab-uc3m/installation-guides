# Install pocketsphinx
```bash
sudo apt install autoconf libtool
sudo apt install libgstreamer1.0-dev
sudo apt install libgstreamer-plugins-base1.0-dev
cd
cd repos
git clone https://github.com/cmusphinx/pocketsphinx
cd pocketsphinx
./autogen.sh
./configure
make -j$(nproc)  # compile
sudo make install # install
```
