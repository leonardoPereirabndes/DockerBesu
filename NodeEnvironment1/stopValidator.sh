#!/bin/bash
read -p "nome do nó validator: " entradaValidator
docker stop -t 0 ${entradaValidator}
docker start ${entradaValidator}
