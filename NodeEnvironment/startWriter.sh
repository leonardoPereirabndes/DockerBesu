#!/bin/bash
source ./configEnv.txt
ipBoot=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${bootNode}`
addressBoot=`docker exec ${bootNode}  cat ./config/bootnodePubKey`
eNode=`echo "enode://${addressBoot:2}@${ipBoot}:30303"`
echo "boot enode"
echo "${eNode}"
echo "start node"
docker exec ${writerNode} besu --data-path=data --genesis-file=./config/genesis.json --bootnodes="${eNode}" --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-host="0.0.0.0"  --node-private-key-file=./config/key --rpc-http-port=8545 --min-gas-price=0