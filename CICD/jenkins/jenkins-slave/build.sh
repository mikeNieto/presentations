#!/bin/bash
set -e

sudo cp -R ${HOME}/.kube .
sudo cp -R ${HOME}/.minikube .
sudo chown -R $(id -u):$(id -g) .kube
sudo chown -R $(id -u):$(id -g) .minikube

sed -i 's/'$USER'/jenkins/g' .kube/config

docker build -t mikenieto/jenkins-slave:latest .
docker push mikenieto/jenkins-slave:latest

rm -Rf .kube
rm -Rf .minikube

