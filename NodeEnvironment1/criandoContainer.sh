#!/bin/bash
source ./configEnv.txt
portCont=8551
for boot in ${bootNode[*]}
do
  mkdir -p -m 777 ${boot}
  docker run -d -ti --volume $(pwd)/${boot}:/Node/config --name ${boot}  leotestedockerhub/besu:latest
done

for validator in ${validatorNode[*]}
do
  mkdir -p -m 777 ${validator}
  docker run -d -ti --volume $(pwd)/${validator}:/Node/config --name ${validator}  leotestedockerhub/besu:latest
done

for writer in ${writerNode[*]}
do
  mkdir -p -m 777 ${writer}
  docker run -d -ti --volume $(pwd)/${writer}:/Node/config --name ${writer} -p ${portCont}:8545 leotestedockerhub/besu:latest
  portCont=$[${portCont} + 1]
done
