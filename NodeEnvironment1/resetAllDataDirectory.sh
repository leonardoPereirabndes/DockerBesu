#!/bin/bash
source ./configEnv.txt

for boot in ${bootNode[*]}
do
  docker  exec ${boot} rm -r data
  docker  exec ${boot} mkdir data
done

for validator in ${validatorNode[*]}
do
  docker  exec ${validator} rm -r data
  docker  exec ${validator} mkdir data
done

for writer in ${writerNode[*]}
do
  docker  exec ${writer} rm -r data
  docker  exec ${writer} mkdir data
done
