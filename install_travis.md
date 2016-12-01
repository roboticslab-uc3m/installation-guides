## Install Travis

This library is a wrapper of OpenCV hosted on SourceForge. We install it from source to assure the CMake file is created.

```bash
svn co svn://svn.code.sf.net/p/travislibrary/code/main travis
cd travis; mkdir build; cd build
cmake ..
make -j3; sudo make install
cd ../..
```
