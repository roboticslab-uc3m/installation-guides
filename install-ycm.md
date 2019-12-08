# Install YCM

We use [YCM](http://robotology.github.io/ycm/gh-pages/git-master/index.html) to benefit from additional CMake modules and superbuild support. The source code is hosted on GitHub at [robotology/ycm](https://github.com/robotology/ycm). Due to its nature, you may want to install it on your system (as a so-called hard dependency) or lazy-load on demand (soft dependency).

Modern YCM releases require CMake 3.0 or higher (3.5+ since YCM 0.8), see [Install CMake](install-cmake.md). If working on Trusty, make sure you get the [Ubuntu 14.04 backports](install-cmake.md#ubuntu-1404-backports).

## Install YCM (Ubuntu) - hard dependency

Note that you will be prompted for your password upon using `sudo`. Type:

```bash
cd  # go home
mkdir -p repos && cd repos  # create $HOME/repos if it doesn't exist; then, enter it
git clone https://github.com/robotology/ycm  # clone repository
mkdir -p ycm/build && cd ycm/build && cmake ..  # configure
make -j$(nproc)  # download external modules
sudo make install && cd  # install and go home
```

## Include YCM in CMake project - soft dependency

CMake-based projects may bootstrap YCM so that its sources are downloaded on demand - it's up to the developers to reflect this in the documentation. Under these assumptions, you should not worry about the previous installation step as everything would land in your project's `<build-tree>/install` directory by default. However, you may want to avoid this process (and the subsequent need for Internet connection) by installing YCM in your system paths - in this respect, please refer to the previous section. Additionally, it must be noted that bootstrapping YCM itself as well as downloading any remote package integrated in the superbuild requires that an appropriate VCS client is installed on the system. Usually, these projects are Git-based and all you need to do is to install `git` (we assume you did this already):

```bash
sudo apt install git
```

Remember to configure your Git username and email ([YCM and Git](#ycm-and-git)).

## YCM and Git

Apart from installing Git, YCM requires that you set your username and e-mail. Type the following commands anywhere, filling the corresponding fields:

```bash
git config --global user.name "My Username"
git config --global user.email "user@example.com"
```

You may set these values on a per-repository basis. In order to achieve that, browse to the root directory of the desired repo and type the previous commands, replacing `--global` with `--local`.

## YCM and OpenSSL

During its build phase, YCM expects that CMake offers support for the `https://` protocol. Older CMake releases and locally built instances may lack this, see [OpenSSL support](install-cmake.md#openssl-support).
