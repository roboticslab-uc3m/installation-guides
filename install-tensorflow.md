# Install Tensorflow

We use Tensorflow as a Keras backend

Official page: [link](https://www.tensorflow.org/install/)

# Install Tensorflow with GPU (Ubuntu 16.04)

Before attempting GPU installation, check the requirements on GPU (micro-architecture, etc) from the official documentation.

Tip: At time of writing, you can increment the number of options for NVIDIA drivers (e.g. from only `384.111`/`nouveau` to `390`/`394`...) in the Ubuntu `Addiditional Drivers` application by previously running:
```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
```

Working setups (GM200 GeForce GTX TITAN X rev a1):
- CUDA 9.0 (uninstalls any NVIDIA driver, installs with version lower than 390) + tensorflow 1.5 (directly using `tensorflow-gpu` binary)
- Not tested: CUDA 8.0 + tensorflow 1.4 (directly using `tensorflow-gpu` binary)
