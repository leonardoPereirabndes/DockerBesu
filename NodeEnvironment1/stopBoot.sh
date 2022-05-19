#!/bin/bash

read -p "nome do nó boot:" entradaBoot
docker stop -t 0 ${entradaBoot}
docker start ${entradaBoot}
