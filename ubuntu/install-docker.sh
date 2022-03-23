# First, update your existing list of packages
sudo apt update

# Next, install a few prerequisite packages which let apt use packages over HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Then add the GPG key for the official Docker repository to your system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Finally, install Docker
sudo apt install -y docker-ce

# Create docker user and add to existing docker group that was installed with docker in previous step ^
#useradd -m -s /bin/bash -g docker docker
