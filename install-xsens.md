# Install XSENS
```
sudo apt install libgsl0-dev  # Seems to be hard dependency
cd  # go home
mkdir -p repos; cd repos  # make $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/icub-main
cd icub-main && mkdir build && cd build
cmake ..  -DENABLE_icubmod_xsensmtx=ON  # Configure the icub-main software
make -j$(nproc)  # compile
```
