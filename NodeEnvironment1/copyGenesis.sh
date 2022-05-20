#!/bin/bash
source ./configEnv.txt

for boot in ${bootNode[*]}
do
  cp genesis.json ./${boot}/genesis.json
done

for validator in ${validatorNode[*]}
do
  cp genesis.json ./${validator}/genesis.json
done

for writer in ${writerNode[*]}
do
  cp genesis.json ./${writer}/genesis.json
done
