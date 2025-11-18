# Install Docker

We use [Docker](https://www.docker.com) for images and containers.

## Install Docker (all platforms)

Simply go to [Docker](https://www.docker.com) and download your version.

## Install Docker (Ubuntu)

```bash
sudo apt install docker.io
```

Post-install, rather than rootless, prefer to (<https://docs.docker.com/engine/install/linux-postinstall/>):

```bash
sudo groupadd docker # may already exist
sudo usermod -aG docker $USER
```

Then log out and in or simply `newgrp docker`.

Additionally, if you have an NVIDIA GPU, it is recommended to [Install the NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html), e.g. it will be required by `rocker --nvidia`.

## Additional Information

### Similar and related

#### Docker Compose

Compose V2 is included with all currently supported versions of Docker Desktop.

#### Rocker

- [osrf/rocker](https://github.com/osrf/rocker): A tool to run docker containers with overlays and convenient options for things like GUIs etc.

Can be installed via `pip`:

```bash
pip install rocker
```

But starting on Ubuntu 24.04:

```bash
pipx install rocker
pipx ensurepath
```

### Tutorials and Examples

- <https://asrob.uc3m.es/tutoriales/software/docker.html>
