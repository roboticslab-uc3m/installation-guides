# Install daemontools

## Install daemontools (Ubuntu)

```bash
sudo apt install daemontools daemontools-run csh
```

`daemontools` can be activated in `/etc/rc.local` through the line (before exit):

```bash
/bin/csh -cf '/usr/bin/svscanboot &'
```

## Create a service
1. Create a folder inside `/etc/service`, e.g. `/etc/service/whatever`
2. Inside it, create a script called `run`, e.g. `/etc/service/whatever/run`
3. Give it execution permissions, e.g. `chmod +x /etc/service/whatever/run`

Here's an example `/etc/service/yarprun/run` example we'll use for the rest of the examples:
```bash
#!/bin/bash
export PATH=/usr/local/bin:/usr/bin:/bin
export YARP_CONFIG_HOME=/home/teo/.config/yarp
yarprun --server /manipulation
```

## Monitoring
Get the status of, say, a `/etc/service/yarprun/run` service with:

```bash
sudo svstat /etc/service/yarprun # We do not point to run here
```

## Troubleshooting
You can get some log messages for debugging opening a separate terminal with:
```bash
ps aux | grep readproctitle
```

Then stop the service with:
```bash
sudo svc -d /etc/service/yarprun # We do not point to run here
```

And start the service with:
```bash
sudo svc -u /etc/service/yarprun # We do not point to run here
```

## Additional Resources
- http://blog.teksol.info/pages/daemontools/tutorial
- http://robots.uc3m.es/index.php/TEO_Network_troubleshooting
