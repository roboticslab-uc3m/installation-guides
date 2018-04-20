# Install Tensorflow

We use Tensorflow as a Keras backend

Official page: [link](https://www.tensorflow.org/install/)

# Install Tensorflow with GPU (Ubuntu 16.04)

This page is to track working setups and common pitfalls. It is not replacement for the official documentation, above. Before attempting GPU installation, check the official requirements on GPU (micro-architecture, etc), and go through all the official steps during the process, including the Post-installation Actions.

Working setups (GM200 GeForce GTX TITAN X rev a1):
- CUDA 9.0 (uninstalls any NVIDIA driver, installs `384.130` driver, so you may not need to [Install NVIDIA drivers](https://github.com/roboticslab-uc3m/installation-guides/blob/master/install-nvidia-drivers.md)). We go to legacy and get `deb (local)` (`cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb` and patches from [here](https://developer.nvidia.com/cuda-90-download-archive?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal)). Official documentation is currently at CUDA 9.0, and [here](https://github.com/tensorflow/tensorflow/issues/16886#issuecomment-365108781) they say 9.1 will be skipped. + cuDNN v7.1.3 (April 17, 2018) for CUDA 9.0.
   - tensorflow 1.8-rc0 at [e1e5f305e5359fd50340ea76ea2f737f6e87a0d7](https://github.com/tensorflow/tensorflow/tree/e1e5f305e5359fd50340ea76ea2f737f6e87a0d7) (tried 1.7 but was broken for GPU). From source, with CUDA, said yes to cuDNN 7.0 even with 7.1.3, without TensorRT.
   - tensorflow 1.5 (directly using `tensorflow-gpu` binary), without TensorRT (was installed, but set default No).
- Not tested: CUDA 8.0 + tensorflow 1.4 (directly using `tensorflow-gpu` binary)

The end of your `.profile` will probably end up looking something like:
```bash
# CUDA
PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# cuDNN
LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}/usr/local/cuda/extras/CUPTI/lib64
```
