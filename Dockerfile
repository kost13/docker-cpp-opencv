FROM kost13/cpp-base:latest

ARG OPENCV_VERSION=4.4.0

RUN apt-get update
RUN apt-get install libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y
RUN apt-get install libtbb2 libtbb-dev libjpeg-dev libpng-dev -y

RUN git clone https://github.com/opencv/opencv.git && \
cd opencv && \
git checkout ${OPENCV_VERSION}

RUN  cd opencv && \
mkdir build && cd build && \
cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .. && \
ninja -j4 && \
ninja install && \
rm -rf opencv
