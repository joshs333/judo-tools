# Josh's JuDo (Just Docker) Tools
This repo contains some random scripts and docker configurations I use for general development on my macbook.

To use them I add the scripts folder to PATH. I also add the folder containing all of my source code to the `CODING_DIR` variable in `scripts/header.sh` this will make the following scripts mount it into docker container automatically so changes I make while in docker persist.

`dbuild` is for building images
`drun` for running them (brings up a tmux window)
`dstart` starts an image in the background (for me starts a vnc server so I can visualize rviz)
`dstop` kills a running image
`dexec` pulls up a tmux session in a running image.

All of the scripts are pretty simple and they are really only intended for personal use so I don't feel a strong need to write a ton of documentation.

# Dependencies
## Docker for mac: https://hub.docker.com/?overlay=onboarding 
I can't remember if this installs cli tools or if i needed to install those via homebrew

## XQuartz: https://www.xquartz.org
this is cool because it lets you run X11 applications on the macos desktop... as opposed to what I do with the vnc_dev image in which I need to vnc in to viz stuff.

# Questions?
## Why do I use vnc instead of using XQuartz all the time? 
Because some 3D applications (rivz...) don't like XQuartz...
I could also do all of this development in parallels instead but docker is lighter-weight (esp. in terms of storage) and the X11 forwarding to xQuartz is really nice when it works.

## Why don't I use docker-compose?
Mostly a flexibility/simplicity thing. In the end I wanted simple one-word commands to do everything, a few lines in bash and I have everything I want. Life is good.

# Future work
I might expand my tools to make it easier to have multiple images with different build contexts, if I want to use these commands for work/research.
Also in the future if I want to deploy docker images to robots I might want to have the deploy image be built slightly different than the devel image (esp in terms of file structure/volume mounting). Maybe docker-compose could fill this need (want is probably a better word), maybe I'll just write more bash/python scripting and do it myself the way I want. We'll see.

Again, this is mostly just for me to keep track of stuff and not lose this if I reinstall everything. Feel free to use this or suggest better ways to develop on mac. **Also please please please ping me if you have a better way to run rviz on macos. I've tried compiling a few times but each time just ends up being a painful journey down a rabbit hole that never works.**

Joshua Spisak <joshs333@live.com> 01/30/2020