# Install Git

## Install Git (Ubuntu)

```bash
sudo apt install git
```

## Set your username and e-mail

Set your username and e-mail. Type the following commands anywhere, filling the corresponding fields:

```bash
git config --global user.name "My Username"
git config --global user.email "user@example.com"
```

You may set these values on a per-repository basis. In order to achieve that, browse to the root directory of the desired repo and type the previous commands, replacing `--global` with `--local`.
