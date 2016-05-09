! #/bin/bash

sudo apt-get update
sudo apt-get -y install apt-transport-https software-properties-common

sudo add-apt-repository -y "deb https://clusterhq-archive.s3.amazonaws.com/ubuntu/$(lsb_release --release --short)/\$(ARCH) /"
echo "<========== ADDED FLOCKER REPO REFERENCE ===========>"

sudo apt-get update

# Install Flocker
sudo apt-get -y --force-yes install clusterhq-flocker-cli
echo "<========= FLOCKER INSTALLATION COMPLETED ==========>"
