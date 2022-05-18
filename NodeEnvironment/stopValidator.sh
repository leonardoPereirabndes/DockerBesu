#!/bin/bash
source ./configEnv.txt
docker stop -t 0 ${validatorNode}
docker start ${validatorNode}