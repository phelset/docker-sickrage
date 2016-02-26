FROM phusion/baseimage:0.9.18
MAINTAINER Petter Helset <petter@helset.eu>

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install deps
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		python \
		python-cheetah \
		ca-certificates \
		wget \
		unrar \
		unzip \
		git \
	&& apt-get clean

# Setup SickRage from tag
RUN groupadd -r -g 797 sickrage \
	&& useradd -r -u 797 -g 797 -d /opt/sickrage -s /usr/sbin/nologin sickrage \
	&& git clone https://github.com/SickRage/SickRage.git /opt/sickrage \
	&& git -C /opt/sickrage checkout -b v5.1.2 tags/v5.1.2 \
	&& mkdir /config /downloads /tv \
	&& chown -R 797:797 /opt/sickrage /config /downloads /tv 

# SickRage HTTP
EXPOSE 8081

# SickRage Configuration
VOLUME /config

# Downloads directory
VOLUME /downloads

# TV directory
VOLUME /tv

# Add edge.sh to execute during container startup
RUN mkdir -p /etc/my_init.d
ADD edge.sh /etc/my_init.d/edge.sh
RUN chmod +x /etc/my_init.d/edge.sh

# Add SickRage to runit
RUN mkdir /etc/service/sickrage
ADD sickrage.sh /etc/service/sickrage/run
RUN chmod +x /etc/service/sickrage/run
