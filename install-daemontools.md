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
Create `/etc/service/whatever/run` and give `chmod +x` permissions.

## Monitoring
Get the status of, say, a `/etc/service/yarprun` service with:

```bash
sudo svstat /etc/service/yarprun
```

# Troubleshooting
You can get some log messages for debugging opening a separate terminal with:
```bash
ps aux | grep readproctitle
```

Then stop the service with:
```bash
sudo svc -d /etc/service/yarprun`
```

And start the service with:
```bash
sudo svc -u /etc/service/yarprun`
```

## Additional Resources
- http://blog.teksol.info/pages/daemontools/tutorial
- http://robots.uc3m.es/index.php/TEO_Network_troubleshooting
