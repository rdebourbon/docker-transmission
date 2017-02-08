# docker transmission

This is a Dockerfile to set up "Transmission" - (https://www.transmissionbt.com/)

Build from docker file

```
git clone git@github.com:rdebourbon/docker-transmission.git
cd docker-transmission
docker build -t transmission .
```

docker run -d -v /*your_config_dir*:/volumes/config -v /*your_media_dir:/volumes/media -p your_external_port:45555 -p web_interface_port:9091 -e "USERNAME=username" -e "PASSWORD=password"

