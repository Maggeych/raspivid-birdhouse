# raspivid-birdhouse

A birdhouse live stream running on a `Raspberry Pi Zero W` with a `Raspberry Pi NoIR v2`.

## Installation

```
# Make serving on port 80 work as non-root user
sudo setcap cap_net_bind_service=+ep `readlink -f \`which node\``

npm install
```

### System Freezes
The raspberry pi zero W freezes after a few minutes. The way to fix it was to add the following lines to `/boot/config.txt`:
```
over_voltage=6
force_turbo=1
```

### Watchdog
To activate the raspberry pi's watchdog hardware, add the following to `/boot/config.txt`:
```
dtparam=watchdog=on
```

Install watchdog:
```bash
# Install
sudo apt-get install watchdog

# Configure
echo 'watchdog-device = /dev/watchdog' >> /etc/watchdog.conf
echo 'watchdog-timeout = 15' >> /etc/watchdog.conf
echo 'max-load-1 = 24' >> /etc/watchdog.conf

# Start
sudo systemctl enable watchdog
sudo systemctl start watchdog
sudo systemctl status watchdog
```

### Systemd Installation
Copy `birdhouse.service` to `/etc/systemd/system` and make sure to set the correct path in `ExecStart`.

```bash
sudo systemctrl enable birdhouse.service
sudo systemctrl start birdhouse.service
sudo systemctrl status birdhouse.service
```

## Credits

- Forked from [Richardn2002/raspivid-broadcaster](https://github.com/Richardn2002/raspivid-broadcaster)
- [Birdhouse](https://icons8.com/icon/xXapShTzctaU/birdhouse) icon by [Icons8](https://icons8.com)
