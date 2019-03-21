# Install TensorFlow

We use TensorFlow as a Keras backend. Official page: [link](https://www.tensorflow.org/install/)

Also see [install-tensorflow_cc](install-tensorflow_cc.md) for an alternative that is more prepared for use with CMake.

## Dependencies for building TensorFlow
To build TensorFlow from source (e.g. for GPU support), you'll need:
- [Bazel](install-bazel.md)
- The python `enum` module, which on Ubuntu can be installed via: ```sudo apt install python-enum34```

## Install TensorFlow with GPU (Ubuntu 16.04)

This page is to track working setups and common pitfalls. It is not replacement for the official documentation, above. Before attempting GPU installation, check the official requirements on GPU (micro-architecture, etc), and go through all the official steps during the process.

Some very important steps are those of the [Post-installation Actions (CUDA)](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#post-installation-actions). The end of your `.profile` will probably end up looking something like:
```bash
# CUDA
PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# cuDNN
LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}/usr/local/cuda/extras/CUPTI/lib64
```
Note: better than `LD_LIBRARY_PATH`, put in correct place and run `ldconfig`.

## Working setups

### RTX 2080 Ti
- CUDA 10, cuDNN 7.5.
- As general practice, better `.run` than `.deb`: e.g. gives option to install CUDA without modifying your installed [NVIDIA drivers](install-nvidia-drivers.md))
- As in https://medium.com/@saitejadommeti/building-tensorflow-gpu-from-source-for-rtx-2080-96fed102fcca ended up using [bazel](install-bazel.md) `0.18.0` via `.run` (the `.deb` had a java package issue), and tensorflow `r0.11`. Otherwise ended up with Bazel not finding tensorflow configuration.
- keras via pip, 2.2.3 or similar with no issues.

### GM200 GeForce GTX TITAN X rev a1:
- CUDA 9.0 (uninstalls any NVIDIA driver, installs `384.130` driver, so you may not need to [Install NVIDIA drivers](https://github.com/roboticslab-uc3m/installation-guides/blob/master/install-nvidia-drivers.md)). We go to legacy and get `deb (local)` (`cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb` and patches from [here](https://developer.nvidia.com/cuda-90-download-archive?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal)). Official documentation is currently at CUDA 9.0, and [here](https://github.com/tensorflow/tensorflow/issues/16886#issuecomment-365108781) they say 9.1 will be skipped. + cuDNN v7.1.3 (April 17, 2018) for CUDA 9.0.
   - tensorflow 1.8-rc0 at [e1e5f305e5359fd50340ea76ea2f737f6e87a0d7](https://github.com/tensorflow/tensorflow/tree/e1e5f305e5359fd50340ea76ea2f737f6e87a0d7) (tried 1.7 but was broken for GPU). From source, with CUDA, said Yes to cuDNN 7.0 even with 7.1.3, without TensorRT (Ubuntu 16.04 local deb v3 was installed, but said default No).
   - tensorflow 1.5 (directly using `tensorflow-gpu` binary), without TensorRT.
- Not tested: CUDA 8.0 + tensorflow 1.4 (directly using `tensorflow-gpu` binary)

## Non-working setups
TensorFlow for GPU at https://www.tensorflow.org/install/install_linux says:
   - CUDA 9.0: http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#axzz4VZnqTJ2A
      - Which recommends Drivers [390](http://www.nvidia.com/Download/driverResults.aspx/132530/en-us), with no GeForce 200 Series support (min GeForce 400 Series), but should support GeForce GTX 675M.
   - CUDA [micro-arch](https://en.wikipedia.org/wiki/CUDA#GPUs_supported) 3.0 Kepler from source, or 3.5 Kepler for bin: GTX 260 is 1.3 Tesla, and GTX 675M is 2.1 Fermi.

