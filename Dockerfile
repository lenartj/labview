FROM debian:jessie
MAINTAINER Janos Lenart <janos@lenart.io>
COPY labviewlinux.zip spd_readdir.c labview.sh entrypoint.sh /
RUN sed -i 's/httpredir.debian.org/deb.debian.org/' -i /etc/apt/sources.list \
 && dpkg --add-architecture i386 \
 && apt-get update \
 && apt-get install -y \
      unzip alien gcc-multilib libx11-6 libx11-6:i386 libxext6:i386 \
 && cd /tmp \
 && unzip /labviewlinux.zip \
 && alien -i --target=amd64 LabVIEW61Linux/*.rpm \
 && rm -rf /tmp/LabVIEW61Linux \
 && gcc -o spd_readdir.so -fPIC -march=i586 -m32 -shared /spd_readdir.c -ldl \
 && apt-get autoremove --purge -y unzip alien gcc-multilib \
 && chmod +x /labview.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["su", "user", "/labview.sh"]
