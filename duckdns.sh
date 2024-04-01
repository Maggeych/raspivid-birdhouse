#!/bin/sh
IP=$(ip -6 addr show wlan0 | grep -o -E '([0-9a-fA-F]{4}:){7}[0-9a-fA-F]{4}')
TOKEN=
echo url="https://www.duckdns.org/update?domains=stodl&token=$TOKEN&ipv6=$IP" | curl -k -s -K -
