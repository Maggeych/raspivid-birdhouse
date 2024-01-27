# raspivid-birdhouse

A birdhouse live stream running on a `Raspberry Pi Zero W` with a `Raspberry Pi NoIR v2`.

## Installation

```
# Make serving on port 80 work as non-root user
sudo setcap cap_net_bind_service=+ep `readlink -f \`which node\``

npm install
node ws+http-server.js  # Then simply browse to http://<address-of-your-pi>/
```

## Credits

- Forked from [Richardn2002/raspivid-broadcaster](https://github.com/Richardn2002/raspivid-broadcaster)
- [Birdhouse](https://icons8.com/icon/xXapShTzctaU/birdhouse) icon by [Icons8](https://icons8.com)
