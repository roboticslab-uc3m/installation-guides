# Install pip

Pip is the  [PyPA recommended tool](https://packaging.python.org/current/) for installing Python packages.

[Official website](https://pypi.python.org/pypi/pip).

**Note**: There is a bug in some versions of pip that disables pip after an upgrade (`pip install --upgrade pip`) with the following error:

```python
Traceback (most recent call last):
  File "/usr/bin/pip3", line 9, in <module>
    from pip import main
ImportError: cannot import name 'main'
```

The simplest fix [I've found](https://github.com/pypa/pip/issues/5240#issuecomment-381677898) is to run the following command to upgrade pip by installing again the latest version:

```bash
wget https://bootstrap.pypa.io/get-pip.py | sudo python3
```

## Install latest pip on GNU/Linux

```bash
wget https://bootstrap.pypa.io/get-pip.py | sudo python
```

## Install latest pip3 on GNU/Linux

```bash
wget https://bootstrap.pypa.io/get-pip.py | sudo python3
```
