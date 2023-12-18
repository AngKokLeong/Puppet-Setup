FROM ubuntu:18.04

WORKDIR /

COPY . ./

# puppet enterprise server version 2023.5.0
# reference from https://www.puppet.com/releases/202350 
RUN wget --inet4-only --content-disposition 'https://apt.puppet.com/pool/bionic/puppet8/p/puppet-agent/puppet-agent_8.3.1-1bionic_amd64.deb'
RUN dpkg -i puppet-agent_8.3.1-1bionic_amd64.deb

RUN apt-get -yq update

RUN apt-get install apache2
RUN apt-get -yq install puppet-agent nano vim iproute2
