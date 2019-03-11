[![Docker Pulls](https://img.shields.io/docker/pulls/gnuton/asuswrt-merlin-toolchains-docker.svg)](https://hub.docker.com/r/gnuton/asuswrt-merlin-toolchains-docker)

# Asuswrt-Merlin-Toolchains-Docker
A Docker image based on Ubuntu 16.04 containing Asuswrt Merlin BCM-SDK Toolchains.
You may wanna use this to build Asus Merling by yourself.

## Always up-to-date
The docker images are build every night.

## Why is this image using 16.04? 
The instructions I found to build the asus firmware worked better on 16.04 than on the newer version 18.04.
Maybe this will change later on, but for now I will stick to the ubuntu which works better for the task.

## Usage
Once the container runs, you can git clone the firmware repository and build it, following the instructions in README of the Asus merlin repository.

```bash
docker run -it --rm gnuton/asuswrt-merlin-toolchains-docker /bin/bash
```

For more info please check the [Asus Merlin official repository](https://github.com/RMerl/am-toolchains)

