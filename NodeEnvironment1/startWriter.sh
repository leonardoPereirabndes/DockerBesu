#!/bin/bash
source ./configEnv.txt

read -p "nome do nó writer:" entradaWriter

for boot in ${bootNode[*]}
do
 ipBoot=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${boot}`
 addressBoot=`docker exec ${boot}  cat ./config/bootnodePubKey`
 eNode=`echo "enode://${addressBoot:2}@${ipBoot}:30303 "`
 allENodeBoot=`echo "${allENodeBoot}${eNode}"`
done


docker exec ${entradaWriter} besu --data-path=data --config-file=./config/config.toml --genesis-file=./config/genesis.json --rpc-http-enabled --rpc-http-api=ETH,PERM,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-host="0.0.0.0"  --node-private-key-file=./config/key --rpc-http-port=8545 --bootnodes=${allENodeBoot}
