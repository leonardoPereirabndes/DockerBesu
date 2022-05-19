#!/bin/bash
source ./configEnv.txt

for valor in ${bootNode[*]}
do
  docker exec ${valor} besu --data-path=config  public-key export --to=./config/bootnodePubKey
done


for valor in ${writerNode[*]}
do
  docker exec ${valor} besu --data-path=config public-key export-address --to=config/nodeAddress
done


for valor in ${validatorNode[*]}
do
  docker exec ${valor} besu --data-path=config public-key export-address --to=config/nodeAddress
done

for valor in ${initialValidator[*]}
do
  chave1=`docker exec ${valor} cat ./config/nodeAddress`
  chave1=`echo "${chave1:2}\""`
  chave1=`echo ",\"${chave1}"`
  chave=`echo "${chave}${chave1}"`
done
  chave=`echo "[${chave:1}]"`
  echo ${chave}
  echo "${chave}" > ./${initialValidator[0]}/ValidatorToExtraData.json
  echo "extraData:"
  docker exec ${initialValidator[0]} besu rlp encode --from=./config/ValidatorToExtraData.json
