#!/usr/bin/env bash

sudo apt-get install -y pkg-config

OPENCV_VERSION="$(pkg-config --modversion opencv | grep '2.4.5')"
if [ ! "$OPENCV_VERSION" ]; then
    echo "Installing OpenCV 2.4.5"

    echo "Installing dependencies..."

    echo "Essentials"
    # Essentials: Libraries and tools required by OpenCV.
    sudo apt-get install -y build-essential checkinstall cmake pkg-config yasm

    echo "Image I/O"
    # Image I/O: Libraries for reading and writing various image types.
    sudo apt-get install -y libtiff4-dev libjpeg-dev libjasper-dev

    echo "Video I/O"
    # Video I/O: Packages to add video capturing/encoding/decoding capabilities to the highgui module.
    sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev

    echo "Python"
    # Python: Packages needed to build the Python wrappers.
    sudo apt-get install -y python-dev python-numpy

    echo "Third-party libs"
    # Other third-party libs: Install Intel TBB to enable parallel code in OpenCV.
    sudo apt-get install -y libtbb-dev

    echo "GUI"
    # GUI
    sudo apt-get install -y libgtk2.0-dev

    cd $HOME

    # Download OpenCV 2.4.5
    if [ ! -d "$HOME/opencv-2.4.5" ]; then
        echo "Downloading OpenCV..."
        wget -O OpenCV-2.4.5.tar.gz http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.5/opencv-2.4.5.tar.gz/download

        echo "Extracting..."
        tar -xvf OpenCV-2.4.5.tar.gz
    fi

    cd opencv-2.4.5/
    echo "Compiling..."
    mkdir build
    cd build
    cmake -D WITH_XINE=ON -D WITH_OPENGL=ON -D WITH_TBB=ON -D BUILD_EXAMPLES=ON ..
    make
    sudo make install
    sudo sh -c "echo /usr/local/lib >> /etc/ld.so.conf"
    sudo ldconfig
fi