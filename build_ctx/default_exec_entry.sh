#!/bin/bash
########################################################
# @file default_exec_entry.sh
# @brief general entry point for images... sources
#   bashrc if there, sources ros, runs a special
#   entry point or runs tmux
########################################################
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
source /ros_entrypoint.sh

if [ -f special_exec_entry.sh ]; then
    /special_exec_entry.sh
else
    tmux
fi