#!/bin/bash
source ./configEnv.txt
docker exec ${validatorNode} besu --data-path=config public-key export-address --to=config/nodeAddress
docker exec ${writerNode} besu --data-path=config public-key export-address --to=config/nodeAddress
docker exec ${bootNode} besu --data-path=config  public-key export --to=./config/bootnodePubKey
chave=`docker exec ${validatorNode} cat ./config/nodeAddress`
chave=`echo "${chave:2}\"]"`
chave=`echo "[\"${chave}"`
echo "${chave}" > ./NodeFile/ValidatorToExtraData.json
echo "extraData:"
docker exec ${validatorNode} besu rlp encode --from=./config/ValidatorToExtraData.json
