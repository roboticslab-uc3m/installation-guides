# Install Node.js

Official page: <https://nodejs.org>

You may also be interested in [NPM](install-npm.md) (Node.js Package Manager).

## Install Node.js (all platforms)

Main downloads page (now already includes `npm`): <https://nodejs.org/en/download>

Many updated versions for package managers can be found at: <https://nodejs.org/en/download/package-manager/>

## Install Node.js (Ubuntu 20.04 Focal)

```bash
sudo apt install nodejs # install node 10.19.0
```

## Install Node.js (Ubuntu 18.04 Bionic)

```bash
sudo apt install nodejs # install node 8.10.0
```

## Install Node.js (Ubuntu 16.04 Xenial)

```bash
sudo apt install nodejs-legacy # install node 4.2.6
```

## Install specific Node.js version (Ubuntu)

First remove node:

```bash
sudo apt-get remove nodejs npm  
```

Then update & upgrade:

```bash
sudo apt-get update
sudo apt-get upgrade
```

Then get your desired Node version (where setup_12.x, replace with desired major version):

```bash
curl -sL deb.nodesource.com/setup_12.x | sudo -E bash - 
```

And then install your new node version:

```bash
sudo apt-get install -y nodejs
```

## Check installed Node.js version

```bash
node -v
```
