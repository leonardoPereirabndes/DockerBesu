#!/bin/bash
source ./configEnv.txt
docker stop -t 0 ${bootNode}
docker start ${bootNode}