# Install NVIDIA drivers

## Install NVIDIA drivers (Ubuntu)

At time of writing, you can increment the number of options for NVIDIA drivers available in Ubuntu `Additional Drivers` (e.g. for teo-titan, from `nouveau`/`384.111` to `nouveau`/`384.130`/`390.48`/`396.18`) by previously running:
```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
```

## Working setups
- `304.135` on GT200 GeForce GTX 260 (rev a1)
- `384.111` on GF114M GeForce GTX 675M (rev a1)
- `384.130` on GM200 GeForce GTX TITAN X (rev a1) (more modern also work but this one goes with CUDA, see [install-tensorflow-with-gpu-ubuntu-1604](https://github.com/roboticslab-uc3m/installation-guides/blob/master/install-tensorflow.md#install-tensorflow-with-gpu-ubuntu-1604))
