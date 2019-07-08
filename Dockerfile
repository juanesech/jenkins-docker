FROM jenkins/jenkins:lts-slim

USER root

##Install docker
RUN apt-get update
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    unzip \
    python-pip \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"
RUN apt-get update
RUN apt-get install -y docker-ce
RUN usermod -aG docker jenkins

#Install Sonar-Scanner
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip && unzip sonar-scanner-cli-3.2.0.1227-linux.zip
RUN ln -s ${PWD}/sonar-scanner-3.2.0.1227-linux/bin/sonar-scanner /usr/bin/sonar-scanner

#Install awscli
RUN pip install awscli
USER jenkins

