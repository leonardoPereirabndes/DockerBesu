#!/bin/bash
source ./configEnv.txt
for boot in ${bootNode[*]}
do
  docker stop -t 0 ${boot}
  docker start ${boot}
done

for writer in ${writerNode[*]}
do
  docker stop -t 0 ${writer}
  docker start ${writer}
done

for validator in ${validatorNode[*]}
do
  docker stop -t 0 ${validator}
  docker start ${validator}
done
