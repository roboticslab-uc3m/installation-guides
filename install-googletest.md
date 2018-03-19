# Install googletest

We use googletest for performing automated unit testing (usually via Travis CI). In order to avoid compilation issues, it is recommended to work with source files, i.e. not precompiled binaries, and build the final googletest libraries along with the user's project.

## Install googletest (Ubuntu 14.04 and 16.04)

```bash
sudo apt install libgtest-dev
```

## Install googletest (Ubuntu 17.04 and later)

```bash
sudo apt install googletest
```
