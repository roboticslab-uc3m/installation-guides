# Install Speech Recognition

We use Speech Recognition for give voice orders.

```bash
# Speech Recognition: 
sudo apt-get install libgstreamer1.0-dev
sudo apt-get install libgstreamer-plugins-base1.0-dev
sudo apt-get install autoconf
sudo apt-get install bison

# Installation sphinxbase
cd
cd repos
git clone https://github.com/cmusphinx/sphinxbase.git
cd sphinxbase
./autogen.sh
./configure
make -j4
make check # to be sure that all is ok
sudo make install

# Installation pocketsphinx
cd
cd repos
git clone https://github.com/cmusphinx/pocketsphinx
cd pocketsphinx
./autogen.sh
./configure
make -j4 clean all
make -j4 check
sudo make install

# We need to configure the path to look for shared libaries
echo "export LD_LIBRARY_PATH=/usr/local/lib" >> ~/.bashrc
echo "export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig" >> ~/.bashrc
echo "export GST_PLUGIN_PATH=/usr/local/lib/gstreamer-1.0" >> ~/.bashrc

# To verify that GStreamer can find the plugin. You should get a large amount of output, ending with something like this:
# decoder             : The underlying decoder
#                        flags: readable
#                        Boxed pointer of type "PSDecoder"

gst-inspect-1.0 pocketsphinx

# to test that all is runnin ok
sudo modprobe snd_pcm_oss
pocketsphinx_continuous -inmic yes
```

Our software integrates the previous dependencies. Note that you will be prompted for your password upon using '''sudo''' a couple of times:

```bash
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/roboticslab-uc3m/teo-head.git  # Download teo-head software from the repository
cd teo-head; mkdir build; cd build; cmake ..  # Configure the teo-head software
make  # Compile
sudo make install  # Install :-)
```

You may want to (from the same build dir):
```bash
echo "export TEO_HEAD_DIR=`pwd`" >> ~/.bashrc
```

For additional TEO options use ccmake instead of cmake.
