# Install zip and unzip
apt-get install zip unzip
# Create bin directory to install aws cli to
[ ! -d $HOME/bin ] && mkdir $HOME/bin
# Add bin directory to user path variable
echo 'PATH=~/bin:$PATH' >> ~/.bashrc
# Download aws-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# Unarchive aws-cli
unzip awscliv2.zip
# Install aws-cli into previously create bin directory
sudo ./aws/install -i ~/bin -b ~/bin
# Remove temporary aws directory
rm -rf ~/aws