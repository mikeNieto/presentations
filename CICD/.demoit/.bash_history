helm install --name jenkins-cicd -f values.yaml --namespace jenkins stable/jenkins
docker run --rm --name gke -it mikenieto/jenkinsx-gke /bin/bash

