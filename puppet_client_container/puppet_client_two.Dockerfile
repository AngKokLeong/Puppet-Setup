FROM ubuntu:22.04

WORKDIR /

COPY puppet_client_two_configuration.txt ./
COPY extend_path_variable_puppet_command.txt ./

RUN apt-get -yq update
RUN apt-get -yq install wget

# puppet enterprise server version 2023.5.0
# reference from https://www.puppet.com/releases/202350 
RUN wget --inet4-only --content-disposition 'https://apt.puppet.com/pool/bionic/puppet8/p/puppet-agent/puppet-agent_8.3.1-1bionic_amd64.deb'
RUN dpkg --install puppet-agent_8.3.1-1bionic_amd64.deb

RUN apt-get -yq install nano vim iproute2 apache2 puppet-agent iputils-ping systemd
RUN cat puppet_client_two_configuration.txt > /etc/puppetlabs/puppet/puppet.conf
RUN cat extend_path_variable_puppet_command.txt >> ~/.bashrc

