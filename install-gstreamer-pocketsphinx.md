# Install gstreamer with pocketsphinx

We use `gstreamer` with `pocketsphinx` within speech recognition.

### Install gstreamer

```bash
sudo apt install libgstreamer1.0-dev
sudo apt install libgstreamer-plugins-base1.0-dev
```

### Install pocketsphinx dependencies

To compile `pocketsphinx` from source, `sphinxbase` is a dependency.

- [Install sphinxbase](install-sphinxbase.md)

### Install pocketsphinx

```bash
sudo apt install autoconf libtool
cd  # go home
mkdir -p repos; cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/cmusphinx/pocketsphinx
cd pocketsphinx
./autogen.sh
./configure
make -j$(nproc)  # compile
sudo make install # install
```
