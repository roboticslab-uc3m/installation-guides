# Install NPM

NPM (Node.js Package Manager) is the package manager for [Node.js](install-node.md). We use it for [gitbook](install-gitbook.md) and similar.

Official page: [link](https://www.npmjs.com)

## Install NPM (Ubuntu 20.04)

```bash
sudo apt install npm # Install npm 6.14.4
```

## Install NPM (Ubuntu)

```bash
sudo apt install npm
```

## Using NPM

- <https://docs.npmjs.com/cli/install>

```bash
npm install (with no args, in package dir)
npm install [<@scope>/]<name>
npm install [<@scope>/]<name>@<tag>
npm install [<@scope>/]<name>@<version>
npm install [<@scope>/]<name>@<version range>
npm install <git-host>:<git-user>/<repo-name>
npm install <git repo url>
npm install <tarball file>
npm install <tarball url>
npm install <folder>
```

In global mode (with `-g` or `--global`), it installs the package  as a global package, so may require `sudo`.

## Troubleshooting NPM

Hack for `phantomjs` and `svgexport` is to use `--unsafe-perm` if fails even with `sudo`:

```bash
sudo npm -g install phantomjs-prebuilt --upgrade --unsafe-perm
suod npm -g install svgexport --unsafe-perm
```
