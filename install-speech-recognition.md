# Install Speech Recognition

We use Speech Recognition for give voice orders.

# Install Speech Recognition (Ubuntu)

```bash
# Speech Recognition: 
sudo apt-get install libgstreamer1.0-dev
sudo apt-get install libgstreamer-plugins-base1.0-dev
sudo apt-get install autoconf
sudo apt-get install bison

# Install sphinxbase
cd
cd repos
git clone https://github.com/cmusphinx/sphinxbase.git
cd sphinxbase
./autogen.sh
./configure
make -j4
make check # to be sure that all is ok
sudo make install

# Install pocketsphinx
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
