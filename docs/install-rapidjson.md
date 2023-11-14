# Install RapidJSON

RapidJSON has become a hard dependency for OpenRAVE. Please note OpenRAVE requires the latest master branch of RapidJSON, therefore installing the `rapidjson-dev` package via *apt* will probably not work.

This is a header-only library, but you'll probably want to disable examples and tests in order to avoid compiling stuff:

```
mkdir -p repos && cd repos
git clone https://github.com/Tencent/rapidjson.git
cd rapidjson
mkdir build && cd build
cmake .. -DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF -DRAPIDJSON_BUILD_TESTS=OFF
make && sudo make install
```
