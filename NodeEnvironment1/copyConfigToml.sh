#!/bin/bash
source ./configEnv.txt

for boot in ${bootNode[*]}
do
  cp config.toml ./${boot}/config.toml
done

for validator in ${validatorNode[*]}
do
  cp config.toml ./${validator}/config.toml
done

for writer in ${writerNode[*]}
do
  cp config.toml ./${writer}/config.toml
done
