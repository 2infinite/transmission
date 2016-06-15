# Transmission 

[Transmission](https://www.transmissionbt.com) lightweight BitTorrent client (daemon and webinterface) running on [Alpine Linux](https://hub.docker.com/_/alpine/).

## Usage:

### Create a data directory on the host system for store data, configs:
```sh
mkdir -p /var/ct/transmission/{data/resume,config}
```

### Run Transmission daemon:

* CHANGE flag --password "CHANGE-PASSWORD" to your password
* CHANGE flag --allowed "127.0.0.1" to your IP address
* ADJUST flags --memory="1g" --kernel-memory="512m" --memory-swap="2g" according to your host's memory
* TIP: transmission-daemon will be started with "nice ionice -c3" (grep ENTRYPOINT Dockerfile)

```sh
docker run -d --log-driver=syslog --restart=always --name transmission --read-only=true -v /var/ct/transmission/data:/data  -v /var/ct/transmission/config:/config \
 --env TRANSMISSION_HOME=/config --cpuset-cpus="0-1" --memory="1g" --kernel-memory="512m" --memory-swap="2g" -p 9091:9091/tcp -p 54321:54321/tcp -p 54321:54321/udp \
 --security-opt no-new-privileges 2infinity/transmission:latest --incomplete-dir /data/resume --download-dir /data --peerport 54321 \
 --auth --username USER4TR --password CHANGE-PASSWORD --allowed "127.0.0.1"
```
