#!/bin/bash
source ./configEnv.txt
docker  exec ${validatorNode} rm -r data
docker  exec ${writerNode} rm -r data
docker  exec ${bootNode} rm -r data
docker  exec ${validatorNode} mkdir data
docker  exec ${writerNode} mkdir data
docker  exec ${bootNode}  mkdir data