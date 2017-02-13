#!/bin/bash

docker run -d --name myjenkins -p 8080:8080 -p 50000:50000 -v `pwd`/data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --group-add=$(stat -c %g /var/run/docker.sock) olegk57/ci:latest
