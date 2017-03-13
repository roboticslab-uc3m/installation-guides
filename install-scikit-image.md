# Install Scikit-Image

[Scikit-image](http://scikit-image.org/) is a Python library for computer vision. Installation using `pip` is quite straightforward.

Note that you will be prompted for your password upon using sudo a couple of times.

## Install stable version
Installing the stable version is simple (Use `pip3` instead to install the Python 3 version):

```bash
$ sudo -H pip install scikit-image
```

## Install development version (pre-0.13)
The development version has to be compiled from the source code. Here are the steps (Use `pip3` instead to install the Python 3 version):

1. Clone development repository:
```bash
$ git clone https://github.com/scikit-image/scikit-image.git
```
2. Upgrade Cython to version `cython>=0.21` (if that version isn't already installed)
```bash
$ sudo -H pip install --upgrade cython
```
3. Installation:
```bash
$ cd scikit-image
$ sudo -H pip install -e .
```

