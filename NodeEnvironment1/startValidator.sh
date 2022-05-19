#!/bin/bash
source ./configEnv.txt

read -p "nome do nó validator:" entradaValidator

for valor in ${bootNode[*]}
do
 ipBoot=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${valor}`
 addressBoot=`docker exec ${valor}  cat ./config/bootnodePubKey`
 eNode=`echo "enode://${addressBoot:2}@${ipBoot}:30303 "`
 allENodeBoot=`echo "${allENodeBoot}${eNode}"`
done

docker exec ${entradaValidator} besu --data-path=data --genesis-file=./config/genesis.json --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-host="0.0.0.0" --node-private-key-file=./config/key --rpc-http-port=8545 --min-gas-price=0 --bootnodes=${allENodeBoot}