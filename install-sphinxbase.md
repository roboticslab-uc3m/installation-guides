# Install sphinxbase

`sphinxbase` is a dependency for compiling [pocketsphinx](install-pocketsphinx.md) from source.

# Install sphinxbase  from source (Ubuntu)

Install sphinxbase  from source (Ubuntu):
```bash
sudo apt install autoconf libtool
sudo apt install bison
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/cmusphinx/sphinxbase.git
cd sphinxbase
./autogen.sh
./configure
make -j$(nproc)  # compile
sudo make install  # install
```

## Not good for latest pocketsphinx: Install sphinxbase from apt (Ubuntu)

**Not good for latest pocketsphinx** ([ATOW](https://github.com/cmusphinx/pocketsphinx/commit/6061af42f532baebb2a9cde66f05666845e3025b)): Install sphinxbase from apt (Ubuntu). On Xenial, installs `0.8+5prealpha-2ubuntu1`.
```bash
sudo apt install libsphinxbase-dev
```
