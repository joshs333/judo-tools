FROM base_dev
MAINTAINER Joshua Spisak (joshs333@live.com)

RUN apt-get install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
RUN apt-get install -y x11vnc xvfb

ADD vnc_entry.sh entrypoint.sh

EXPOSE 5920
ENV DISPLAY :20

ENTRYPOINT ["/entrypoint.sh"]