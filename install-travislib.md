## Install Travis

This library is a wrapper of OpenCV hosted on SourceForge.

- First install [OpenCV](install-opencv.md).

## Install Travis (Ubuntu)

```bash
svn co svn://svn.code.sf.net/p/travislibrary/code/main travis
cd travis; mkdir build; cd build
cmake ..
make -j3; sudo make install
cd ../..
```
