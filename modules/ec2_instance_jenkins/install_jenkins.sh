#!/bin/bash

# Update package lists
sudo apt update
# setup nodejs in targeted machine
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs

sudo apt install -y docker.io
sudo apt update

sudo usermod -aG docker ubuntu
sudo usermod -aG docker $USER && newgrp docker
sudo usermod -aG docker jenkins
sudo chmod 777 /var/run/docker.sock

sudo apt install -y git

#install trivy
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y



sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip
sudo apt install unzip  # Install unzip tool if not already installed
sudo unzip sonar-scanner-cli-*.zip
sudo mkdir -p /opt/sonar-scanner
sudo mv sonar-scanner-* /opt/sonar-scanner
export PATH="/opt/sonar-scanner/sonar-scanner-4.6.2.2472-linux/bin:$PATH"
source ~/.bashrc
sonar-scanner --version


# Install required packages
sudo apt install -y fontconfig openjdk-17-jre

# Check Java version
java -version

#!/bin/bash

# Update package lists
sudo apt update

# Install required packages
sudo apt install -y fontconfig openjdk-17-jre

# Download Jenkins key and add it to the keyring
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository to sources list
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists again to include Jenkins repository
sudo apt-get update

# Install Jenkins with automatic confirmation
sudo apt-get install -y jenkins

sudo systemctl enable jenkins

sudo systemctl start jenkins

sudo systemctl status jenkins