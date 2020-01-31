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

# Default Entry point
ADD default_exec_entry.sh /default_exec_entry.sh

# Setup some env vars
ENV DISPLAY host.docker.internal:0

ENTRYPOINT ["/default_exec_entry.sh"]