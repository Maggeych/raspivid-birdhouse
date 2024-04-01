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

### DNS Update via CRON

Run `crontab -e` and append the following line to run the dns update script every 5 minutes:

```
*/5 * * * * ~/raspivid-birdhouse/duckdns.sh >/dev/null 2>&1
```

### Disable Password Login For IPV6 SSH

Edit `/etc/ssh/sshd_conf` and add:

```
Match Address 0.0.0.0/0
	AddressFamily inet
	PasswordAuthentication yes

Match Address ::/0
    AddressFamily inet6
    PasswordAuthentication no
```

### Stream Youtube

To stream to a live youtube token, use `stream.sh` or install the `stream.service` systemd service.  
Make sure to change your stream token in the `stream.sh` file.

## Credits

- Forked from [Richardn2002/raspivid-broadcaster](https://github.com/Richardn2002/raspivid-broadcaster)
- [Birdhouse](https://icons8.com/icon/xXapShTzctaU/birdhouse) icon by [Icons8](https://icons8.com)
