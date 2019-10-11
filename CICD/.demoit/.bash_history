helm install --name jenkins-cicd -f values.yaml --namespace jenkins stable/jenkins
docker run --rm --name gke -it mikenieto/jenkinsx-gke /bin/bash
docker run --rm --name slave -v /var/run/docker.sock:/var/run/docker.sock -it mikenieto/jenkins-slave /bin/bash

