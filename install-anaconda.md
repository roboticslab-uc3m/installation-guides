# Install anaconda

anaconda is a bundle of python packages and environments to work with machine learning applications. To install it just follow the instructions in the [original documentation](https://docs.anaconda.com/anaconda/install/linux) (If you are installing anaconda as a rllab dependecy **make sure to download the python 2.7 installer**).

anaconda creates its own environments inside the system. This means, that some packages that are installed outside anaconda, have to be installed inside too. To do this you just have to follow the normal installation instructions of the package but inside the anaconda environment. 

**NOTE:** Make sure to create another build folder (build_anaconda for example) for the new installation, the rest is the same. Example for rllab3 environment:

```bash
export PATH="~/anaconda2/bin:$PATH" #Activate anaconda
source activate rllab3 #Initialize rllab
export PYTHONPATH=~/repos/rllab:$PYTHONPATH #Export rllab to pythonpath.
#install any package following https://github.com/roboticslab-uc3m/installation-guides (make sure to change build->build_rllab)
```
This usually not so easy, some package need additional steps:

## Install YARP inside anaconda

Make sure you have performed a [normal installation](https://github.com/roboticslab-uc3m/installation-guides/blob/master/install-yarp.md) of YARP first. Then:

```bash
export PATH="~/anaconda2/bin:$PATH" #Activate anaconda
source activate rllab3 #Initialize rllab
export PYTHONPATH=~/repos/rllab:$PYTHONPATH #Export rllab to pythonpath.
#Same terminal!
cd ~/repos/yarp; mkdir build_rllab; cd build_rllab
make .. -DCREATE_LIB_MATH=ON -DCREATE_GUIS=OFF -D  #We have problems with qt so GUIS out.
make -j$(nproc)  # compile
sudo make install; sudo ldconfig # install
#Lets go with the bindings
cmake .. -DYARP_COMPILE_BINDINGS=ON -DCREATE_PYTHON=ON
make -j$(nproc)  # compile
sudo make install; sudo ldconfig; cd # install and go home
#Now moving some important things.
cp /usr/local/lib/python3.5/site-packages/_yarp.so ~/anaconda2/envs/rllab3/lib/python3.5/site-packages
cp /usr/local/lib/python3.5/site-packages/yarp.py ~/anaconda2/envs/rllab3/lib/python3.5/site-packages
```

Now make sure to install again YARP outside anaconda

```bash
#open new terminal outside anaconda environment
cd ~/repos/yarp/build; cmake ..
sudo make install; cd
```
