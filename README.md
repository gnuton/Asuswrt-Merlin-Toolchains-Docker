[![Docker Pulls](https://img.shields.io/docker/pulls/gnuton/asuswrt-merlin-toolchains-docker.svg)](https://hub.docker.com/r/gnuton/asuswrt-merlin-toolchains-docker)

Main branch build: [![CircleCI](https://circleci.com/gh/gnuton/Asuswrt-Merlin-Toolchains-Docker/tree/master.svg?style=svg)](https://circleci.com/gh/gnuton/Asuswrt-Merlin-Toolchains-Docker/tree/master)

# Asuswrt-Merlin-Toolchains-Docker
Docker images based on the latest Ubuntu LTST 22.04 containing the latest Asuswrt Merlin Toolchains.
This docker image allows you to build AsusWRT inside docker.

## Usage
Please follow the instructions below to 
```bash
git clone ASUS_MERLIN_REPO_OR_ASUS_GPL
cd asuswrt-merlin.ng
docker pull gnuton/asuswrt-merlin-toolchains-docker:latest
docker run -it --rm -v "$PWD:/build"  -u "docker:docker" \
       gnuton/asuswrt-merlin-toolchains-docker:latest /bin/bash

# inside docker, follow the instructions to select the correct toolchain for your build
# and after set the correct permissions to the files to make docker user able to read and write them for building
sudo chmod docker -R *
sudo chgrp docker -R *

# after this you are ready to build your AsusWRT code
cd THE_SDK
make THE_MODEL
```

For more info please check the [Asus Merlin official repository](https://github.com/RMerl/am-toolchains)

# Build and test locally
```bash
./build
```

# Building and publishing the image
```bash
./buildNPublish
```

