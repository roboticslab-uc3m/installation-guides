# Install Gitbook

Page related to open source Gitbook (sometimes aka Legacy), not new closed source version.

Official page: <https://github.com/GitbookIO/gitbook>

## Install Gitbook (Ubuntu)

First:

- [Install NPM](install-npm.md)
- [Install Node.js](install-node.md)
  - Note that `gitbook 3.2.3` works with `node 10.19.0`, but not with `node 14.x`.

Then:

```bash
sudo npm install -g gitbook-cli
```

## To be able to serve via Gitbook

Make sure your project has a file called `SUMMARY.md` in its root.

## How-To's

### How to serve on localhost

```bash
gitbook serve # command builds and serves
```

### How to build to serve generated contents elsewhere

```bash
gitbook build
```

## Troubleshooting Gitbook

To install missing plugins:

```bash
gitbook install
```

## Additional Tools

### gitbook-summary

A useful tool for auto-generating `SUMMARY.md` as done for [roboticslab-uc3m/installation-guides](https://github.com/roboticslab-uc3m/installation-guides). Install via:

```bash
sudo npm install -g gitbook-summary
```
