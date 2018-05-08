# Install sphinxbase
cd
cd repos
git clone https://github.com/cmusphinx/sphinxbase.git
cd sphinxbase
./autogen.sh
./configure
make -j$(nproc)  # compile
sudo make install  # install
