#!/bin/bash
source ./configEnv1.txt
for valor in ${bootNode[*]}
do
  docker stop -t 0 ${valor}
  docker start ${valor}
done

for valor in ${writerNode[*]}
do
  docker stop -t 0 ${valor}
  docker start ${valor}
done

for valor in ${validatorNode[*]}
do
  docker stop -t 0 ${valor}
  docker start ${valor}
done