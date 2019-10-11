FROM jenkinsci/jnlp-slave

USER root

# INSTALL DOCKER
RUN apt-get update && \
    apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    python-pip \
    software-properties-common -y && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get install docker-ce -y && \
    apt-get install zip -y && \
    apt-get install unzip -y

## INSTALL KUBECTL
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

## INSTALL HELM
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

# INSTALL GRADLE
RUN wget https://services.gradle.org/distributions/gradle-5.6.2-bin.zip
RUN mkdir /opt/gradle
RUN unzip -d /opt/gradle gradle-5.6.2-bin.zip
ENV GRADLE_HOME=/opt/gradle/gradle-5.6.2
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle --stop

# COPYING CURRENT KUBECTL CONFIG
ADD .kube/config ${HOME}/.kube/config
ADD .minikube/ca.crt ${HOME}/.minikube/ca.crt
ADD .minikube/ca.key ${HOME}/.minikube/ca.key
ADD .minikube/client.crt ${HOME}/.minikube/client.crt
ADD .minikube/client.key ${HOME}/.minikube/client.key



