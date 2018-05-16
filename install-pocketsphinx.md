# Install pocketsphinx

We use `pocketsphinx` within speech recognition.

### Install the dependencies

To compile `pocketsphinx` from source, `sphinxbase` is a dependency.

- [Install sphinxbase](install-sphinxbase.md)

### Install the Software

```bash
sudo apt install autoconf libtool
sudo apt install libgstreamer1.0-dev
sudo apt install libgstreamer-plugins-base1.0-dev
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/cmusphinx/pocketsphinx
cd pocketsphinx
./autogen.sh
./configure
make -j$(nproc)  # compile
sudo make install # install
```
