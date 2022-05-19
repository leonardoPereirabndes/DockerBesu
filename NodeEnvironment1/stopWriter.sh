#!/bin/bash
read -p "nome do nó writer: " entradaWriter
docker stop -t 0 ${entradaWriter}
docker start ${entradaWriter}