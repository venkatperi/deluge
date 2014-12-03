FROM venkatperi/baseimage-supervisor
MAINTAINER Venkat Peri <venkatperi@gmail.com>

COPY universe_multiverse.list /etc/apt/sources.list.d/
RUN apt-get update -qq && \
    apt-get install -qy deluged deluge-web unrar unzip p7zip 

ENV USERNAME	deluge
ENV GROUPNAME   deluge
    
COPY runtime-init /
COPY supervisor-deluged.conf /etc/supervisor/conf.d/

EXPOSE 8112
EXPOSE 58846 

