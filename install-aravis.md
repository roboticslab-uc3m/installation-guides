# Install Aravis 0.4

1. Download the current stable release  [here](http://ftp.gnome.org/pub/GNOME/sources/aravis/0.4/).
2. Install the following dependencies:
```
sudo apt install glib-2.0 gobject-2.0 gio-2.0 libxml-2.0 thread-2.0 zlib gstreamer-base-1.0 streamer-app-1.0 gstreamer-base-0.10 gstreamer-app-0.10 gstreamer-video-1.0 gtk+-3.0 libnotify
```
3. Install even more dependiencies:
```
sudo apt install autoconf intltool python-gobject-dev gobject-introspection gtk-doc-tools libgstreamer0.10-dev python-gst0.10-dev libxml2-dev
```
4. Uncompress the downloaded Aravis package and open a terminal in that folder.
5. Run `./configure`
6. Run `make`
7. Run `sudo make install`

## If you need some special features...
Depending on what you need, you have to call autogen with different parameters.

The most common are:

##### --enable-viewer 
Builds the aravis example application that allows basic interaction with your camera. The viewer needs GTK+3 and libnotify. You can install them with

```
sudo apt install libgtk-3-dev libnotify-dev libgstreamer1.0 libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-bad
```

##### --enable-gst-plugin 
Build the aravis gstreamer plugin.

##### --enable-gst-plugin-0.10 
Build the aravis gstreamer-0.10 plugin.

##### --enable-gtk-doc 
Build the aravis documentation.

##### --enable-introspection=yes 
Allow interaction with aravis trough gobject introspection. This allows usage of aravis in non-c based languages like Python or Perl.

On Ubuntu / Debian it is `sudo apt install libgirepository1.0-dev`

##### --disable-silent-rules 
If you want to see the actual compile commands

For an overview over all available arguments try configure --help

In case the library is built with `./autogen.sh --enable-viewer --enable-introspection=yes` some more packages are needed: `sudo apt install libgirepository1.0-dev libnotify-dev lib-gtk-3-dev`

## Original Source
Should you have any trouble with the installation process, you can read the original source of this guide [here](https://github.com/TheImagingSource/tiscamera/wiki/Aravis).
