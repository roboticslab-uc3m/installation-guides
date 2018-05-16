# Install sphinxbase

`sphinxbase` is a dependency for compiling [pocketsphinx](install-pocketsphinx.md) from source.

# Install sphinxbase  from source (Ubuntu)

Install sphinxbase  from source (Ubuntu):
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

## Experimental alternative: Install sphinxbase from apt (Ubuntu)

Experimental alternative: Install sphinxbase from apt (Ubuntu). On Xenial, installs `0.8+5prealpha-2ubuntu1`.
```bash
sudo apt install libsphinxbase-dev
```
