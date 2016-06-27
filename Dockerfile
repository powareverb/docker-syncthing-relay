FROM ubuntu
#Forked from...
#MAINTAINER bn0ir <gblacknoir@gmail.com>
MAINTAINER Gavin Jones <gavin.jones.nz@gmail.com>
ENV SYNCTHINGVERSION v0.13.5

RUN apt-get update \
	&& apt-get install -y \
	    wget \
	&& mkdir -p /usr/local/src \
	&& mkdir -p /data/ \
	&& cd /usr/local/src \
	&& wget https://github.com/syncthing/relaysrv/releases/download/${SYNCTHINGVERSION}/relaysrv-linux-amd64-${SYNCTHINGVERSION}.tar.gz \
	&& tar -xzf relaysrv-linux-amd64-${SYNCTHINGVERSION}.tar.gz \
	&& mkdir -p /usr/local/syncthing \
	&& cp relaysrv-linux-amd64-${SYNCTHINGVERSION}/relaysrv /usr/local/syncthing/relaysrv \
	&& rm -rf /usr/local/src/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./run_syncthing.sh /run_syncthing.sh

ENTRYPOINT ["bash"]

EXPOSE 22067

CMD ["/run_syncthing.sh"]
