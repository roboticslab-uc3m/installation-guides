# Install pip

Pip (Package Installer for Python) is the  [PyPA recommended tool](https://packaging.python.org/current/) for installing [Python](install-python.md) packages.

Official page: <https://pypi.python.org/pypi/pip>

## Install pip3 for python3 (Ubuntu 20.04)

First, [install Python](install-python.md).

Then:

```bash
sudo apt install python3-pip
```

## Install latest pip on GNU/Linux

```bash
wget https://bootstrap.pypa.io/get-pip.py | sudo python
```

## Install latest pip3 on GNU/Linux

```bash
wget https://bootstrap.pypa.io/get-pip.py | sudo python3
```

## Troubleshooting

There is a bug in some versions of pip that disables pip after an upgrade (`pip install --upgrade pip`) with the following error:

```python
Traceback (most recent call last):
  File "/usr/bin/pip3", line 9, in <module>
    from pip import main
ImportError: cannot import name 'main'
```

The simplest fix found [here](https://github.com/pypa/pip/issues/5240#issuecomment-381677898) is to run the following command to upgrade pip by installing again the latest version (use `python` instead for python2):

```bash
wget https://bootstrap.pypa.io/get-pip.py | sudo python3
```
