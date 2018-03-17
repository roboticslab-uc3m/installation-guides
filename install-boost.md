# Install Boost

This package contains the Boost C++ Libraries development files.

## Install Boost (Ubuntu)

Installing Boost on Ubuntu is quite straightforward. Note that you will be prompted for your password upon using `sudo`. Type:

```bash
sudo apt install libboost-all-dev
```

## Install Boost (Windows)

* Download the source code from http://www.boost.org/users/download/.
* Extract in a `Boost` folder located at `C:\` or `C:\Program files` so that CMake find-modules can detect it.
* Invoke the command line and navigate to the extracted folder (e.g. `cd C:\Boost\boost_1_63_0`).
* Follow the instructions at http://www.boost.org/build/doc/html/bbv2/overview/invocation.html to build all packages in the selected configuration. You may want to compile only specific modules, in which case refer to their documentation (http://www.boost.org/doc/libs/).
  * Issuing `b2` will build only static libraries for the default architecture and both Release and Debug configurations.
  * Issue `b2 variant=release address-model=64` to build 64-bit binaries in Release configuration.
  * See [#Properties](http://www.boost.org/build/doc/html/bbv2/overview/invocation.html#bbv2.overview.invocation.properties) for further details on the command line interface.
