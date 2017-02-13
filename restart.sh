#!/bin/bash

ssh -l ok 127.0.0.1 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i key 'bash -s' <<'ENDSSH'
  ID_LIST=''
  IMAGE='olegk57/lolek'

  docker pull $IMAGE

  for id in `docker container ls | grep -v -i "CONTAINER ID"| cut -d" " -f1 | tr '\n' ' '`
  do
    if docker container inspect $id | grep -izq "$IMAGE"
    then
      docker container kill $id
      docker run -d $IMAGE
    fi
  done
ENDSSH
