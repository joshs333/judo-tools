#!/bin/bash
########################################################
# @file vnc_entry.sh
# @brief entry point for vnc image, launches a vnc
#   server desktop instance on port 5920.
########################################################
export DISPLAY=:20
Xvfb :20 -screen 0 2560x1600x16 &
xfce4-session &
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
x11vnc -passwd nonono -display :20 -N -forever &
wait