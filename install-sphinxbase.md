# Install sphinxbase
```bash
sudo apt install autoconf libtool
sudo apt install bison
cd
cd repos
git clone https://github.com/cmusphinx/sphinxbase.git
cd sphinxbase
./autogen.sh
./configure
make -j$(nproc)  # compile
sudo make install  # install
```
