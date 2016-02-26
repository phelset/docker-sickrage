# docker-sickrage
Dockerized [SickRage](http://sickrage.github.io/).

Docker Hub repository [phelset/sickrage](https://hub.docker.com/r/phelset/sickrage/)


### Usage

It's recommended to provide three mount points writeable by user `797` (or group `797`).

  * `/config`: SickRage configuration folder
  * `/downloads`: Post Processing folder
  * `/tv`: TV Show folder

Example:
```
$ mkdir ~/sickrage-config
$ docker run -d --name=sickrage -v ~/plex-config:/config -v ~/Movies:/tv -v ~/Downloads:/downloads -p 8081:8081 phelset/sickrage
```

To pull from master at startup apply environment variable `EDGE=1`:
```
docker run -d --name=sickrage -v ~/plex-config:/config -v ~/Movies:/tv -v ~/Downloads:/downloads -e EDGE=1 -p 8081:8081 phelset/sickrage
```

To duplicate host timezone inside the container use `-v /etc/localtime:/etc/localtime:ro`
```
docker run -d --name=sickrage -v ~/plex-config:/config -v ~/Movies:/tv -v ~/Downloads:/downloads -v /etc/localtime:/etc/localtime:ro -p 8081:8081 phelset/sickrage
```

*Based on [needo37/sickrage](https://github.com/needo37/sickrage)*
