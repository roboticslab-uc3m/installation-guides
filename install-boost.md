# Install Boost

This package contains the Boost C++ Libraries development files.

## Install Boost (Ubuntu)

Usually, you'll want to install all available Boost libraries. Note that you will be prompted for your password upon using `sudo`.

```bash
sudo apt install libboost-all-dev
```

In case you just want specific components of the Boost framework, check [available packages](https://packages.ubuntu.com/search?keywords=libboost-) (`libboost-<component>-dev`) first. For Boost.Thread:

```bash
sudo apt install libboost-thread-dev
```

Header-only Boost libraries are grouped in one single package, which is a common dependency for `libboost-all-dev` and `libboost-<component>-dev`:

```bash
sudo apt install libboost-dev
```

## Install Boost (Windows)

* Download the source code from http://www.boost.org/users/download/.
* Extract in a `Boost` folder located at `C:\` or `C:\Program files` so that CMake find-modules can detect it.
* Invoke the command line and navigate to the extracted folder (e.g. `cd C:\Boost\boost_1_63_0`).
* Follow the instructions at http://www.boost.org/build/doc/html/bbv2/overview/invocation.html to build all packages in the selected configuration. You may want to compile only specific modules, in which case refer to their documentation (http://www.boost.org/doc/libs/).
  * Run the bootstrap script (`bootstrap.bat`) prior to building anything.
  * Issuing `b2` will build only static libraries for the default architecture and both Release and Debug configurations.
  * Issue `b2 variant=release address-model=64 link=static,shared` to build 64-bit static and dynamic binaries in *Release* configuration for all available Boost components.
  * Issue `b2 property=value --with-<component>` to build only specific Boost components ([list](http://www.boost.org/doc/libs/)). Use lower case. Example: `b2 variant=release --with-thread` will build release binaries for Boost.Thread. You can chain multiple `--with-<component>` options.
  * See [#Properties](http://www.boost.org/build/doc/html/bbv2/overview/invocation.html#bbv2.overview.invocation.properties) for further details on the command line interface.
