[![Docker Pulls](https://img.shields.io/docker/pulls/gnuton/asuswrt-merlin-toolchains-docker.svg)](https://hub.docker.com/r/gnuton/asuswrt-merlin-toolchains-docker)

# Asuswrt-Merlin-Toolchains-Docker
A Docker image containing Asuswrt Merlin BCM-SDK Toolchains.

## Usage
This docker image is used to build Asus Merlin AC68U firmware.
Once you run the container, you can git clone the firmware repository and build it.

```bash
docker run -it --rm gnuton/asuswrt-merlin-toolchains-docker /bin/bash
```

For more info please check the [Asus Merlin official repository](https://github.com/RMerl/am-toolchains)

