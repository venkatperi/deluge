FROM phusion/baseimage:0.9.11
MAINTAINER needo <venkatperi@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME 	/root
ENV UID 	21000
ENV GID 	21000
ENV WEBPORT	8112
ENV PORT	58846

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

RUN groupadd -g $GID deluge && useradd -g deluge -u $UID deluge

ADD sources.list /etc/apt/
RUN apt-get update -qq
RUN apt-get install -qy deluged deluge-web unrar unzip p7zip

#Path to a directory that only contains the deluge.conf
VOLUME /config
VOLUME /downloads
VOLUME /log

EXPOSE 8112
EXPOSE 58846 

# Add deluged to runit
RUN mkdir /etc/service/deluged
ADD deluged.sh /etc/service/deluged/run
RUN chmod +x /etc/service/deluged/run

# Add deluge-web to runit
RUN mkdir /etc/service/deluge-web
ADD deluge-web.sh /etc/service/deluge-web/run
RUN chmod +x /etc/service/deluge-web/run
