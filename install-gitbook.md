# Install Gitbook legacy

Official page: [link](https://github.com/GitbookIO/gitbook)

## Install Gitbook legacy (Ubuntu)

First:
- [Install NPM](install-npm.md)
- [Install Node.js](install-node.md)

Then:
```bash
sudo npm install -g gitbook-cli
```

## To be able to serve via Gitbook legacy
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

## Troubleshooting Gitbook legacy
To install missing plugins:
```bash
gitbook install
```

## Additional Tools

### gitbook-summary
```bash
npm install -g gitbook-summary
```
