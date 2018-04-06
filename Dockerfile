FROM ubuntu:16.04

ENV INTERFACE eth0

#RUN apt-get update \
#    && apt-get -qq --no-install-recommends install \
#        libmicrohttpd10 \
#        libssl1.0.0 \
#    && rm -r /var/lib/apt/lists/*

WORKDIR /usr/local/src
ADD . /usr/local/src/
RUN chmod 755 /usr/local/src/docker-entrypoint.sh

RUN apt-get -qq update 

RUN apt-get -qq install \
	sysstat vim unzip iftop \
	software-properties-common

RUN add-apt-repository ppa:oisf/suricata-stable -y \
	&& apt-get update -y \
	&& apt-get install suricata -y

RUN echo ${INTERFACE} > /root/interface

RUN rm -r /var/lib/apt/lists/*  

ENTRYPOINT ["/usr/local/src/docker-entrypoint.sh"]
