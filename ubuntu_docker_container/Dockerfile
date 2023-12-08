FROM ubuntu:22.04

WORKDIR /

COPY . ./

RUN dpkg -i puppet-agent_8.3.1-1jammy_amd64.deb

RUN apt-get -yq update
RUN apt-get -yq install apache2
RUN apt-get -yq install puppet-agent nano vim iproute2



