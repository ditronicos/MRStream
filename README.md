# MRStream (Fork from LordPedal Lordstream)
Based in **ACEstream** is a simple **streaming playback**, compatilbe with most video playback apps.

# Dockerfile
Only AMD64 over Ubuntu 20.04

# Usage  docker compose.

```
version: "2"
services:
  iptv:
    image: ditronics/mrstream
    container_name: MrStream
    environment:
      - TZ=Etc/UTC
    volumes:
      - ../opt:/opt
    network_mode: host
    restart: always
```

# Enviromment

| ``TZ=Etc/UTC`` | Time Zone |
| ``network_mode: host`` | Default network mode |

# Volumes
| '' ../opt:opt'' | To easy safe configurations on your system

## To open the web interface

http://localhost:6878/webui/app/password/server

## [https://github.com/ditronicos}
