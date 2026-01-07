# Install Gazebo

Note: For now, this page refers to what is now known as `Gazebo Classic`:

- Official page: <https://classic.gazebosim.org>
- For new `GazeboSim`, refer to: <https://gazebosim.org>

## Install Gazebo (Ubuntu 22.04 Jammy)

Install Gazebo 11 (Classic) via:

```bash
sudo apt install gazebo
```

You may also be interested in:

```bash
sudo apt install libgazebo-dev
```

## Install Gazebo (Ubuntu 20.04 Focal)

Note that Gazebo 9 (Classic) is also avaliable for this distro.

Install Gazebo 11 (Classic) via:

```bash
sudo apt install gazebo11
```

You may also be interested in:

```bash
sudo apt install libgazebo11-dev
```

## Install Gazebo (Ubuntu 18.04 Bionic)

Install Gazebo 9 (Classic) via:

```bash
sudo apt install gazebo9
```

You may also be interested in:

```bash
sudo apt install libgazebo9-dev
```

## Install Gazebo (Ubuntu 16.04 Xenial)

Install Gazebo 7 (Classic) via:

```bash
sudo apt install gazebo7
```

You may also be interested in:

```bash
sudo apt install libgazebo7-dev
```

## Troubleshooting

### Bad screen output (WSL/WSL2 with Ubuntu 22.04 Jammy)

- Description: Bad screen output using WSL/WSL2 with Ubuntu 22.04 Jammy, deformed gray image (good image flashes when attempting 3D navigation).
- Solution: As described at [Taskbar window caption shows [WARN: COPY MODE] #312](https://github.com/microsoft/wslg/discussions/312), fixed via upgrading to mesa 21.x:

    ```bash
    sudo add-apt-repository ppa:kisak/kisak-mesa
    sudo apt-get update
    sudo apt upgrade
    ```

    Then close Ubuntu, run `wsl --shutdown` from Windows, and finally restart Ubuntu.


## Additional Information

### Similar and Related

- <https://github.com/roboticslab-uc3m?q=gazebo> (roboticslab-uc3m)
