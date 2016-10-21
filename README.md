# labview
LabView 6.1 for Linux Dockerfile. For installation **without Docker** see details in this [wiki](https://wiki.ubuntu.com/LabVIEW).

## Getting labviewlinux.zip
Pick a [mirror](http://www.filewatcher.com/m/labviewlinux.zip.96745702-0.html) and verify the SHA1 sum.
```sh
sha1sum labviewlinux.zip
# should be 5ef4d7e63e73b456c2232a88ca7601712ece78a5
```

## Building Docker image
```sh
git clone https://github.com/lenartj/labview.git
cd labview
cp /somewhere/labviewlinux.zip .
docker build -t lenart/labview .
```

## Running
```sh
docker run --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix lenart/labview
```
