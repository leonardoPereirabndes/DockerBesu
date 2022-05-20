#!/bin/bash

read -p "nome do nó: " node
docker stop -t 0 ${node}
docker start ${node}
