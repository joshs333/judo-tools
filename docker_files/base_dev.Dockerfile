FROM osrf/ros:melodic-desktop-full
MAINTAINER Joshua Spisak (joshs333@live.com)

# Install some libraries I like to use
## spdlog
# COPY libs/spdlog/ /tmp/libs/spdlog
# RUN mkdir /tmp/libs/spdlog/build
# RUN cd /tmp/libs/spdlog/build \
#     && cmake ../ \
#     && make install

## fmt
COPY libs/fmt/ /tmp/libs/fmt
RUN mkdir /tmp/libs/fmt/build
RUN cd /tmp/libs/fmt/build \
    && cmake ../ -DFMT_TEST=0 \
    && make install

## fmt
COPY libs/yaml-cpp/ /tmp/libs/yaml-cpp
RUN mkdir /tmp/libs/yaml-cpp/build
RUN cd /tmp/libs/yaml-cpp/build \
    && cmake -DYAML_CPP_BUILD_TESTS=OFF -DYAML_BUILD_SHARED_LIBS=ON ../ \
    && make install

COPY libs/spdlog/ /tmp/libs/spdlog
RUN mkdir /tmp/libs/spdlog/build
RUN cd /tmp/libs/spdlog/build \
    && cmake ../ \
    && make install

# Install dependencies
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y tmux
RUN apt-get install -y tmuxp
RUN apt-get install -y iputils-ping
RUN apt-get install -y bash-completion
RUN apt-get install -y nano
RUN apt-get install -y qemu
RUN apt-get install -y python-catkin-tools
RUN apt-get install -y net-tools
RUN apt-get install -y netcat
RUN apt-get install -y software-properties-common
RUN apt-get install -y google-perftools graphviz
RUN apt-get install -y ros-melodic-rosbridge-suite

# RUN apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
# RUN add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
# RUN apt-get update

# RUN apt-get install -y librealsense2-dkms
# RUN apt-get install -y librealsense2-utils
# RUN apt-get install -y librealsense2-dev
# RUN apt-get install -y librealsense2-dbg

# Default Entry point
ADD default_exec_entry.sh /default_exec_entry.sh

# Setup some env vars
ENV DISPLAY host.docker.internal:0

ENTRYPOINT ["/default_exec_entry.sh"]