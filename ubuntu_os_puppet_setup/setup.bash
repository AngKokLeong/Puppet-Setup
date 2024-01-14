cd ~/Desktop

#1. Install relevant packages in Ubuntu

# Run apt-get update
apt-get update -yq

# Install net-tools Git
apt-get install net-tools git -yq

# Install Docker

# Setup Docker's apt repository
apt-get install ca-certificates curl gnupg -yq
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -yq

# Install Docker packages
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -yq

chmod 777 /var/run/docker.sock


#2. Setup the IP address

# Use netplan to apply static address
cat netplan.yaml > /etc/netplan/01-network-manager-all.yaml

# Apply the netplan
netplan apply    


#3. Setup Puppet Server

#3.1 Download the package using wget 
# Refer to https://www.ubuntumint.com/wget-force-ipv4-ipv6-connection/
# Puppet download link retrieved from https://www.puppet.com/downloads/puppet-enterprise 
wget --content-disposition --inet4-only 'https://pm..puppet.com/cgi-bin/download.cgi?dist=ubuntu&rel=22.04&arch=amd64&ver=latest' 

#3.2 Unpack the archive
echo 'Step 3.2 Unpack the archive'

# using gunzip
echo 'Extract the archive using gunzip'
gunzip puppet-enterprise-2023.5.0-ubuntu-22.04-amd64.tar.gz

#then tar xvf
echo 'Extracting the files in tar archive'
tar xvf puppet-enterprise-2023.5.0-ubuntu-22.04-amd64.tar


# Remove the tar archive file
rm puppet-enterprise-2023.5.0-ubuntu-22.04-amd64.tar

echo 'Change working directory to puppet folder'
cd puppet-enterprise-2023.5.0-ubuntu-22.04-amd64

#3.3 Run the installer
echo 'Running the installer for Puppet Enterprise'
./puppet-enterprise-installer -y 



#3.4 Change the password
puppet infrastructure console_password --password password


#Test the puppet server with this command 'puppet agent -t'
puppet agent -t

puppet agent -t



