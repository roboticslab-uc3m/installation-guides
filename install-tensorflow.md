# Install Tensorflow

We use Tensorflow as a Keras backend

Official page: [link](https://www.tensorflow.org/install/)

# Install Tensorflow with GPU (Ubuntu 16.04)

Before attempting GPU installation, check the requirements on GPU (micro-architecture, etc) from the official documentation.

Working setups (GM200 GeForce GTX TITAN X rev a1):
- CUDA 9.0 (uninstalls any NVIDIA driver, installs `384.130` driver, so you may not need to [Install NVIDIA drivers](https://github.com/roboticslab-uc3m/installation-guides/blob/master/install-nvidia-drivers.md)). We go to legacy and get `deb (local)` (`cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb` and patches from [here](https://developer.nvidia.com/cuda-90-download-archive?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal)). Official documentation is currently at CUDA 9.0, and [here](https://github.com/tensorflow/tensorflow/issues/16886#issuecomment-365108781) they say 9.1 will be skipped.
   - tensorflow 1.5 (directly using `tensorflow-gpu` binary). 
- Not tested: CUDA 8.0 + tensorflow 1.4 (directly using `tensorflow-gpu` binary)
