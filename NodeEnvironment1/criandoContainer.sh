#!/bin/bash
source ./configEnv.txt
portCont=8551
for valor in ${bootNode[*]}
do
  mkdir -p -m 777 ${valor}
  docker run -d -ti --volume $(pwd)/${valor}:/Node/config --name ${valor}  leotestedockerhub/besu:latest
done

for valor in ${validatorNode[*]}
do
  mkdir -p -m 777 ${valor}
  docker run -d -ti --volume $(pwd)/${valor}:/Node/config --name ${valor}  leotestedockerhub/besu:latest
done

for valor in ${writerNode[*]}
do
  mkdir -p -m 777 ${valor}
  docker run -d -ti --volume $(pwd)/${valor}:/Node/config --name ${valor} -p ${portCont}:8545 leotestedockerhub/besu:latest
  portCont=$[${portCont} + 1]
done
