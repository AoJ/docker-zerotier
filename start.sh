#!/usr/bin/env bash
exec docker run -d --name zerotier --cap-add=NET_ADMIN --net=host --device /dev/net/tun:/dev/net/tun -v /etc/zerotier:/var/lib/zerotier-one -p 9993:9993/udp zerotier "zerotier-one -U"
