#!/bin/bash
source ./configEnv.txt
docker stop -t 0 ${writerNode}
docker start ${writerNode}