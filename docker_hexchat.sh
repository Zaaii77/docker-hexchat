#!/bin/bash

docker build -t 

xhost +local:docker

docker run \
	--env DISPLAY=$DISPLAY \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	hexchat
