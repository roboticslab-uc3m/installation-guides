# Install Tensorflow

We use Tensorflow as a Keras backend

Official page: [link](https://www.tensorflow.org/install/)

# Install Tensorflow with GPU (Ubuntu 16.04)

Before attempting GPU installation, check the requirements on GPU (micro-architecture, etc) from the official documentation.

Tip: At time of writing, you can increment the number of options for NVIDIA drivers (e.g. from `nouveau`/`384.111` to `nouveau`/`384.130`/`390.48`/`396.18`) in the Ubuntu `Addiditional Drivers` application by previously running:
```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
```

Working setups (GM200 GeForce GTX TITAN X rev a1):
- CUDA 9.0 (uninstalls any NVIDIA driver, installs 38_ driver) + tensorflow 1.5 (directly using `tensorflow-gpu` binary)
- Not tested: CUDA 8.0 + tensorflow 1.4 (directly using `tensorflow-gpu` binary)
