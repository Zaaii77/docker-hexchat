# Running HexChat in Docker (with X11 Forwarding)

This project builds and runs HexChat inside a Docker container while
displaying the GUI on the host using X11.

## Requirements

### 1. Install Docker

On Debian/Ubuntu:

    sudo apt update
    sudo apt install -y docker.io

Enable and start the Docker service:

    sudo systemctl enable --now docker

### 2. Add Your User to the `docker` Group

To run Docker without `sudo`, the user must be part of the `docker`
group.

#### If you are a normal user:

    sudo usermod -aG docker $USER

Then reload your session:

    newgrp docker

#### If you are running inside a root shell and want root to use Docker without sudo:

    usermod -aG docker root

Then reload the shell:

    newgrp docker

You can verify:

    docker run hello-world

## Build the Docker Image

Run this command from the directory containing the `Dockerfile`:

    docker build -t hexchat .

## Allow Docker Access to the X Server

This gives local Docker containers permission to open windows on your
display:

    xhost +local:docker

## Run HexChat in Docker

Launch the container with X11 forwarding enabled:

    docker run     --env DISPLAY=$DISPLAY     --volume /tmp/.X11-unix:/tmp/.X11-unix     hexchat

HexChat will appear on your host machine as a normal GUI application.

## Notes

-   An X server must be running on the host.
-   On WSL2, you must install and start an external X server (e.g.,
    VcXsrv or Xming) before launching the container.
-   If the GUI does not appear, ensure:
    -   `DISPLAY` is set correctly
    -   `/tmp/.X11-unix` is available
    -   `xhost +local:docker` was executed

