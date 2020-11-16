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

### How to install Gitbook plugins (if present in project)

Only necesary once per project (and only if any, specified in `book.json`). They are installed in `./node_modules/`, which should usually be set as ignored (not uploaded to repository).

```bash
gitbook install
```

### How to serve (defaults to `localhost:4000`)

```bash
gitbook serve # command builds and serves
```

### How to build (generate `_book` without serving)

```bash
gitbook build
```

## Additional Tools

### gitbook-summary

A useful tool for auto-generating `SUMMARY.md` as done for [roboticslab-uc3m/installation-guides](https://github.com/roboticslab-uc3m/installation-guides). Install via:

```bash
sudo npm install -g gitbook-summary
```
