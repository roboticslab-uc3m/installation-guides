# Install Tensorflow

We use Tensorflow as a Keras backend

Official page: [link](https://www.tensorflow.org/install/)

# Install Tensorflow with GPU (Ubuntu 16.04)

Before attempting GPU installation, check the requirements on GPU (micro-architecture, etc) from the official documentation.

Tip: At time of writing, you can increment the number of options for NVIDIA drivers available in Ubuntu `Additional Drivers` (e.g. from `nouveau`/`384.111` to `nouveau`/`384.130`/`390.48`/`396.18`) by previously running:
```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
```

Working setups (GM200 GeForce GTX TITAN X rev a1):
- CUDA 9.0 (uninstalls any NVIDIA driver, installs 38_ driver) + tensorflow 1.5 (directly using `tensorflow-gpu` binary). We go to legacy and get `deb (local)` ([cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb](https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb)). Official documentation is currently at CUDA 9.0, and [here](https://github.com/tensorflow/tensorflow/issues/16886#issuecomment-365108781) they say 9.1 will be skipped.
- Not tested: CUDA 8.0 + tensorflow 1.4 (directly using `tensorflow-gpu` binary)
