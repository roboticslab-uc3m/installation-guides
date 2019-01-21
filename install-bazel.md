# Install Bazel

We use Bazel to build [Tensorflow](install-tensorflow.md).

Official page: [link](https://bazel.build).

## Install Bazel (Ubuntu)
The easiest is to download the Bazel binary installer named `bazel-<version>-installer-linux-x86_64.deb` from the Bazel releases page on GitHub.

Here's an example for v0.21.0
```bash
sudo apt install zlib1g-dev # only dependency
wget https://github.com/bazelbuild/bazel/releases/download/0.21.0/bazel_0.21.0-linux-x86_64.deb
sudo dpkg -i bazel_0.21.0-linux-x86_64.deb
```
